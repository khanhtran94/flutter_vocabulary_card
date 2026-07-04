import 'package:flutter/foundation.dart';

import '../../../core/constants/review_intervals.dart';
import '../../../data/repositories/card_repository.dart';

enum LibraryFilter { all, learning, due, mastered }

class LibraryCardItem {
  const LibraryCardItem({
    required this.id,
    required this.english,
    required this.vietnamese,
    required this.reviewCount,
    required this.status,
    required this.nextReviewDate,
    required this.audioPath,
  });

  final int id;
  final String english;
  final String vietnamese;
  final int reviewCount;
  final String status;
  final DateTime nextReviewDate;
  final String? audioPath;

  bool get isMastered => status == masteredStatus;
  bool get isDue =>
      status == learningStatus && !nextReviewDate.isAfter(DateTime.now());
  double get progress =>
      (reviewCount / reviewIntervals.length).clamp(0, 1).toDouble();
}

class VocabularyLibraryController extends ChangeNotifier {
  VocabularyLibraryController(this._cardRepository);

  final CardRepository _cardRepository;
  List<LibraryCardItem> _allCards = const [];

  bool isLoading = false;
  String? errorMessage;
  LibraryFilter filter = LibraryFilter.all;
  String searchQuery = '';

  List<LibraryCardItem> get visibleCards {
    final normalizedQuery = searchQuery.trim().toLowerCase();
    return _allCards.where((card) {
      final matchesSearch =
          normalizedQuery.isEmpty ||
          card.english.toLowerCase().contains(normalizedQuery) ||
          card.vietnamese.toLowerCase().contains(normalizedQuery);
      final matchesFilter = switch (filter) {
        LibraryFilter.all => true,
        LibraryFilter.learning => card.status == learningStatus,
        LibraryFilter.due => card.isDue,
        LibraryFilter.mastered => card.status == masteredStatus,
      };
      return matchesSearch && matchesFilter;
    }).toList();
  }

  Future<void> loadCards() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();
    try {
      final cards = await _cardRepository.getAllCards();
      _allCards = cards
          .map(
            (card) => LibraryCardItem(
              id: card.id,
              english: card.english,
              vietnamese: card.vietnamese,
              reviewCount: card.reviewCount,
              status: card.status,
              nextReviewDate: card.nextReviewDate,
              audioPath: card.audioPath,
            ),
          )
          .toList();
    } catch (_) {
      errorMessage = 'Không thể tải kho từ vựng.';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void setFilter(LibraryFilter value) {
    if (filter == value) {
      return;
    }
    filter = value;
    notifyListeners();
  }

  void setSearchQuery(String value) {
    searchQuery = value;
    notifyListeners();
  }
}
