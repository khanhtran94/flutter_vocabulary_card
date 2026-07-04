import 'package:flutter/foundation.dart';

import '../../../data/repositories/card_repository.dart';
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
    required CardRepository cardRepository,
  }) : _deckRepository = deckRepository,
       _cardRepository = cardRepository;

  final DeckRepository _deckRepository;
  final CardRepository _cardRepository;

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
    int? deckId;
    try {
      deckId = await _deckRepository.createDeck(
        name: deckName,
        description: description,
      );
      for (final card in validCards) {
        await _cardRepository.createCard(
          deckId: deckId,
          english: card.english,
          vietnamese: card.vietnamese,
          audioPath: card.audioPath,
        );
      }
      return deckId;
    } catch (_) {
      if (deckId != null) {
        await _deckRepository.deleteDeck(deckId);
      }
      errorMessage = 'Không thể lưu bộ thẻ. Vui lòng thử lại.';
      return null;
    } finally {
      isSaving = false;
      notifyListeners();
    }
  }
}
