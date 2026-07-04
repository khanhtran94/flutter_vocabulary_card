const List<int> reviewIntervals = [1, 3, 5, 7, 12];

int getNextReviewInterval(int reviewCount) {
  if (reviewCount <= 0) {
    return 0;
  }
  if (reviewCount > reviewIntervals.length) {
    return reviewIntervals.last;
  }
  return reviewIntervals[reviewCount - 1];
}
