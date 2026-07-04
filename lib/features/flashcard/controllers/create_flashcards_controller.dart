import 'package:flutter/foundation.dart';

import '../../../data/repositories/deck_repository.dart';

class NewFlashcard {
  const NewFlashcard({
    required this.english,
    required this.vietnamese,
    this.audioPath,
  });

  final String english;
  final String vietnamese;
  final String? audioPath;
}

class CreateFlashcardsController extends ChangeNotifier {
  CreateFlashcardsController({
    required DeckRepository deckRepository,
  }) : _deckRepository = deckRepository;

  final DeckRepository _deckRepository;

  bool isSaving = false;
  String? errorMessage;

  Future<int?> createDeckWithCards({
    required String deckName,
    String? description,
    required List<NewFlashcard> cards,
  }) async {
    final validCards = cards
        .where(
          (card) =>
              card.english.trim().isNotEmpty &&
              card.vietnamese.trim().isNotEmpty,
        )
        .toList();
    if (deckName.trim().isEmpty || validCards.isEmpty) {
      errorMessage = 'Hãy nhập tên bộ thẻ và ít nhất một flashcard.';
      notifyListeners();
      return null;
    }

    isSaving = true;
    errorMessage = null;
    notifyListeners();
    try {
      return await _deckRepository.createDeckWithCards(
        name: deckName,
        description: description,
        cards: validCards
            .map(
              (card) => NewCardRecord(
                english: card.english,
                vietnamese: card.vietnamese,
                audioPath: card.audioPath,
              ),
            )
            .toList(),
      );
    } catch (_) {
      errorMessage = 'Không thể lưu bộ thẻ. Vui lòng thử lại.';
      return null;
    } finally {
      isSaving = false;
      notifyListeners();
    }
  }
}
