class SolvesListModel {
  SolvesListModel(this.scores, this.marksCombinations);

  final List<double> scores;
  final List<List<int>> marksCombinations;

  bool get isEmpty => scores.isEmpty && marksCombinations.isEmpty;
  int get length => scores.length;
}