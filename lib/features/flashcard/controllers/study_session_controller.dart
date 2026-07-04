import 'package:flutter/foundation.dart';

import '../../../data/repositories/card_repository.dart';

class StudyCardItem {
  const StudyCardItem({
    required this.id,
    required this.english,
    required this.vietnamese,
    required this.reviewCount,
    required this.nextReviewDate,
    this.audioPath,
  });

  final int id;
  final String english;
  final String vietnamese;
  final int reviewCount;
  final DateTime nextReviewDate;
  final String? audioPath;

  bool get isOverdue => nextReviewDate.isBefore(
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
      );
}

class StudySessionController extends ChangeNotifier {
  StudySessionController(this._cardRepository);

  final CardRepository _cardRepository;

  List<StudyCardItem> cards = const [];
  bool isLoading = false;
  bool isSubmitting = false;
  String? errorMessage;
  int currentIndex = 0;
  int correctAnswers = 0;
  int wrongAnswers = 0;

  StudyCardItem? get currentCard =>
      currentIndex < cards.length ? cards[currentIndex] : null;
  bool get isCompleted => cards.isNotEmpty && currentIndex >= cards.length;
  int get completedCount => currentIndex.clamp(0, cards.length);
  double get progress => cards.isEmpty ? 0 : completedCount / cards.length;

  Future<void> loadToday() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();
    try {
      final dueCards = await _cardRepository.getDueCards(DateTime.now());
      cards = dueCards
          .map(
            (card) => StudyCardItem(
              id: card.id,
              english: card.english,
              vietnamese: card.vietnamese,
              reviewCount: card.reviewCount,
              nextReviewDate: card.nextReviewDate,
              audioPath: card.audioPath,
            ),
          )
          .toList();
      currentIndex = 0;
      correctAnswers = 0;
      wrongAnswers = 0;
    } catch (_) {
      errorMessage = 'Không thể tải bài học hôm nay.';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> answerCurrent(bool isCorrect) async {
    final card = currentCard;
    if (card == null || isSubmitting) {
      return;
    }
    isSubmitting = true;
    errorMessage = null;
    notifyListeners();
    try {
      await _cardRepository.updateCardProgress(
        cardId: card.id,
        isCorrect: isCorrect,
        answerType: 'manual',
      );
      if (isCorrect) {
        correctAnswers++;
      } else {
        wrongAnswers++;
      }
      currentIndex++;
    } catch (_) {
      errorMessage = 'Không thể lưu kết quả học.';
    } finally {
      isSubmitting = false;
      notifyListeners();
    }
  }
}
