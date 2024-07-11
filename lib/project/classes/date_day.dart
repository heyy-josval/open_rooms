class DateDay {
  final String year;
  final String month;
  final String day;

  const DateDay(this.year, this.month, this.day);

  @override
  String toString() {
    return "$year-$month-$day";
  }
}
