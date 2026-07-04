import 'dart:convert';

import 'package:drift/native.dart';
import 'package:flutter_application_1/data/local/app_database.dart';
import 'package:flutter_application_1/data/repositories/card_repository.dart';
import 'package:flutter_application_1/data/repositories/deck_repository.dart';
import 'package:flutter_application_1/features/flashcard/controllers/create_flashcards_controller.dart';
import 'package:flutter_application_1/features/flashcard/controllers/paste_analysis_controller.dart';
import 'package:flutter_application_1/features/flashcard/services/translation_service.dart';
import 'package:flutter_application_1/features/flashcard/services/vocabulary_extractor.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

void main() {
  test('extracts unique English words and lexical phrases', () {
    final result = VocabularyExtractor().extract(
      'Students struggle with complex academic texts and complex terminology.',
    );

    expect(result, contains('struggle with'));
    expect(result, contains('complex academic'));
    expect(result.where((item) => item == 'complex'), hasLength(1));
    expect(result, isNot(contains('and')));
  });

  test('MyMemory service sends en|vi and parses translatedText', () async {
    final service = MyMemoryTranslationService(
      client: MockClient((request) async {
        expect(request.url.queryParameters['q'], 'language acquisition');
        expect(request.url.queryParameters['langpair'], 'en|vi');
        return http.Response(
          jsonEncode({
            'responseStatus': 200,
            'responseData': {'translatedText': 'tiếp thu ngôn ngữ'},
          }),
          200,
          headers: {'content-type': 'application/json; charset=utf-8'},
        );
      }),
    );

    expect(
      await service.translateToVietnamese('language acquisition'),
      'tiếp thu ngôn ngữ',
    );
  });

  test(
    'analyzes text and persists translated cards for offline study',
    () async {
      final database = AppDatabase.forTesting(NativeDatabase.memory());
      addTearDown(database.close);
      final deckRepository = DeckRepository(database);
      final cardRepository = CardRepository(database);
      final analysisController = PasteAnalysisController(
        extractor: VocabularyExtractor(),
        translationService: _FakeTranslationService(),
      );
      final createController = CreateFlashcardsController(
        deckRepository: deckRepository,
        cardRepository: cardRepository,
      );

      final analyzed = await analysisController.analyze(
        'Learners struggle with advanced terminology.',
      );
      final deckId = await createController.createDeckWithCards(
        deckName: 'Imported text',
        cards: analysisController.candidates
            .map(
              (candidate) => NewFlashcard(
                english: candidate.english,
                vietnamese: candidate.vietnamese,
              ),
            )
            .toList(),
      );

      expect(analyzed, isTrue);
      expect(deckId, isNotNull);
      final cards = await cardRepository.getCardsByDeckId(deckId!);
      expect(cards, isNotEmpty);
      expect(cards.every((card) => card.vietnamese.startsWith('vi:')), isTrue);
      expect(await cardRepository.getDueCards(DateTime.now()), isNotEmpty);
    },
  );
}

class _FakeTranslationService implements TranslationService {
  @override
  Future<String> translateToVietnamese(String english) async => 'vi:$english';
}
