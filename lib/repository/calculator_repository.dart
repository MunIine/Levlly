import 'package:levlly/extensions/num_extensions.dart';
import 'package:levlly/models/solves_list_model.dart';

class CalculatorRepository {
  const CalculatorRepository({
    required this.marks,
    required this.numberOfRequiredMarks,
    required this.goalScore,
  });

  final List<int> marks;
  final int numberOfRequiredMarks;
  final String goalScore;

  SolvesListModel getMarks(){
    final int minMarkToUp = double.parse(goalScore).cutNumber(0).round();
    final List values = List.generate(5-minMarkToUp, (int index) => minMarkToUp+index+1);
    final int marksSum = marks.isNotEmpty ? marks.reduce((a, b) => a + b) : 0;

    // Добавить эту оценку в список значений, если цель - целый балл
    if (double.parse(goalScore).cutNumber(0) == double.parse(goalScore)) values.add(double.parse(goalScore).toInt());

    SolvesListModel solvesList = SolvesListModel([], []);
    List<int> currentCombination = List.filled(numberOfRequiredMarks, values[0]);
    List<int> indices = List.filled(numberOfRequiredMarks, 0);

    while (true) {
      final currentScore = ((marksSum + currentCombination.reduce((a, b) => a + b)) / (marks.length + numberOfRequiredMarks)).cutNumber(2);
      
      if (currentScore >= double.parse(goalScore)) {
        solvesList.scores.add(currentScore.toDouble());
        solvesList.marksCombinations.add(List.from(currentCombination));
      }

      int i = numberOfRequiredMarks - 1;
      while (i >= 0 && indices[i] == values.length - 1) {
        i--;
      }

      if (i < 0) break;

      indices[i]++;
      currentCombination[i] = values[indices[i]];

      for (int j = i + 1; j < numberOfRequiredMarks; j++) {
        indices[j] = indices[i];
        currentCombination[j] = values[indices[j]];
      }
    }

    return solvesList;
  }
}