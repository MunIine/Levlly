import 'package:flutter/material.dart';
import 'package:levlly/models/solves_list_model.dart';
import 'package:levlly/repository/calculator_repository.dart';
import 'package:levlly/theme/app_colors.dart';
import 'package:levlly/theme/app_dimensions.dart';
import 'package:levlly/widgets/export.dart';

class SolvesList extends StatefulWidget {
  const SolvesList({super.key, required this.calculatorRepository});

  final CalculatorRepository calculatorRepository;

  @override
  State<SolvesList> createState() => _SolvesListState();
}

class _SolvesListState extends State<SolvesList> {
  final double marksSize = 45;
  final double secondListPadding = 6.5;


  @override
  Widget build(BuildContext context) {
    final double rowHeight = marksSize+2*secondListPadding;
    final SolvesListModel solvesList = widget.calculatorRepository.getMarks();

    return ItemBlock(
      horizontalPadding: 0,
      verticalPadding: 0,
      child: SizedBox(
        height: rowHeight*2 + 20 + 24,
        child: solvesList.isEmpty ? 
        const Center(
          child: Text(
            "Бог в помощь\n    ¯\\_(ツ)_/¯",
            style: TextStyle(
              color: AppColors.alternativeTextColor,
              fontSize: AppDimensions.fontSize,
              fontWeight: AppDimensions.fontWeight,
            ),
          ),
        )

        : ListView.separated(
          itemCount: solvesList.length,
          padding: const EdgeInsets.symmetric(vertical: 12).copyWith(left: 20).copyWith(right: 15),
          separatorBuilder: (context, index) => const SizedBox(height: 20),
          itemBuilder: (context, index) {
            return Row(
              children: [
                CircularProgressWithText(value: solvesList.scores[index], size: 50, strokeWidth: 10,),
                const SizedBox(width: 20),
                Expanded(
                  child: ItemBlock(
                    color: AppColors.blockItemsBackgroundColor,
                    verticalPadding: 0,
                    horizontalPadding: 0,
                    child: SizedBox(
                      width: double.infinity,
                      height: rowHeight,
                      child: ListView.separated(
                        itemCount: solvesList.marksCombinations[index].length,
                        padding: EdgeInsets.symmetric(vertical: secondListPadding, horizontal: secondListPadding),
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, _) => SizedBox(width: secondListPadding),
                        itemBuilder: (context, indexSecond) {
                          return BlockTextButton(
                            value: solvesList.marksCombinations[index][indexSecond].toString(), 
                            onPressed: null,
                            useBackgroundColorScheme: true, 
                            color: AppColors.textColor,
                            elevation: 0,
                            fontSize: 22,
                            width: marksSize,
                            height: marksSize,
                          );
                        }
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      )
    );
  }
}