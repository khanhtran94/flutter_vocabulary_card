DateTime startOfDay(DateTime date) => DateTime(date.year, date.month, date.day);

DateTime endOfDay(DateTime date) =>
    DateTime(date.year, date.month, date.day, 23, 59, 59, 999, 999);
