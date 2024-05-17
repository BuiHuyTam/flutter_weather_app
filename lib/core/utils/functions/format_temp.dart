class FormatTemp {
  final int temp;
  FormatTemp({required this.temp});
  int formatted() {
    int formattedTemp = (temp / 10).truncate();
    return formattedTemp;
  }
}
