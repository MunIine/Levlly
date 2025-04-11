import 'package:flutter/material.dart';
import 'package:levlly/theme/app_colors.dart';
import 'package:levlly/widgets/export.dart';

class SolvesList extends StatefulWidget {
  const SolvesList({super.key, required this.marks, required this.numberOfRequiredMarks, required this.goalScore});

  final List<int> marks;
  final int numberOfRequiredMarks;
  final String goalScore;

  @override
  State<SolvesList> createState() => _SolvesListState();
}

class _SolvesListState extends State<SolvesList> {
  final double marksSize = 45;
  final double secondListPadding = 6.5;


  @override
  Widget build(BuildContext context) {
    final double rowHeight = marksSize+2*secondListPadding;

    return ItemBlock(
      horizontalPadding: 0,
      verticalPadding: 0,
      child: SizedBox(
        height: rowHeight*2 + 20 + 24,
        child: ListView.separated(
          itemCount: 10,
          padding: const EdgeInsets.symmetric(vertical: 12).copyWith(left: 20).copyWith(right: 15),
          separatorBuilder: (context, index) => const SizedBox(height: 20),
          itemBuilder: (context, index) {
            return Row(
              children: [
                const CircularProgressWithText(value: 3.85, size: 50, strokeWidth: 10,),
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
                        itemCount: 4,
                        padding: EdgeInsets.symmetric(vertical: secondListPadding, horizontal: secondListPadding),
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) => SizedBox(width: secondListPadding),
                        itemBuilder: (context, index) {
                          return BlockTextButton(
                            value: "5", 
                            onPressed: (){},
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