import 'package:flutter/material.dart';
import 'package:levlly/screens/calculator/widgets/marks_grid/dotted_placeholder.dart';
import 'package:levlly/screens/calculator/widgets/marks_grid/view_more_button.dart';
import 'package:levlly/theme/app_colors.dart';
import 'package:levlly/theme/app_dimensions.dart';
import 'package:levlly/widgets/block_text_button.dart';

class DoubleGridView extends StatefulWidget {
  const DoubleGridView({super.key, required this.marks, required this.markRemoveAt});

  final List<int> marks;
  final ValueChanged<int> markRemoveAt;

  @override
  State<DoubleGridView> createState() => _DoubleGridViewState();
}

class _DoubleGridViewState extends State<DoubleGridView> {
  final double itemsSize = AppDimensions.gridItemSize;
  final double horizontalItemsPadding = AppDimensions.gridHorizontalItemPadding;
  final double verticalItemsPadding = AppDimensions.gridVerticalItemPadding; // Только для dual mode
  bool expandMode = false;

  @override
  Widget build(BuildContext context) {
    final int itemsCount = widget.marks.length;
    final freePlaces = getFreePlaces(itemsCount, expandMode);

    // Один ряд
    if(!expandMode){
      return SizedBox(
        height: itemsSize,
        child: Row(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: itemsCount+freePlaces+1,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => SizedBox(width: horizontalItemsPadding),
                itemBuilder: (context, index){
                  if (index == itemsCount+freePlaces){ // Отступ для последнего элемента
                    return Container();
                  }
                  if (index >= itemsCount){
                    return DottedPlaceholder(size: itemsSize);
                  }
                  return BlockTextButton(
                    value: widget.marks[index].toString(), 
                    onPressed: () => widget.markRemoveAt(index),
                    useBackgroundColorScheme: true, 
                    color: AppColors.textColor,
                    elevation: 0,
                    width: itemsSize,
                    height: itemsSize,
                  );
                }
              ),
            ),
            ViewMoreButton(
              size: itemsSize,
              onPressed: (){
              setState(() {
                expandMode = !expandMode;
              });
            }),
          ]
        ),
      );
    }

    // Случай для двух рядов
    return SizedBox(
      height: itemsSize * 2 + verticalItemsPadding,
      child: GridView.builder(
        itemCount: itemsCount+freePlaces+1,
        padding: const EdgeInsets.symmetric(horizontal: 0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          crossAxisSpacing: horizontalItemsPadding,
          mainAxisSpacing: verticalItemsPadding,
        ),
        itemBuilder: (context, index) {
          if (index < itemsCount){
            return BlockTextButton(
              value: widget.marks[index].toString(), 
              onPressed: () => widget.markRemoveAt(index),
              useBackgroundColorScheme: true, 
              color: AppColors.textColor,
              elevation: 0,
              width: itemsSize,
              height: itemsSize,
            );
          }
          if (index == itemsCount+freePlaces){
            return ViewMoreButton(
              size: itemsSize,
              down: false,
              onPressed: (){
              setState(() {
                expandMode = !expandMode;
              });
            });
          }
          return DottedPlaceholder(size: itemsSize);
        },
      ),
    );
  }

  int getFreePlaces(int length, bool expandMode) {
    if (!expandMode){
      if (length < 4){
        return 4 - length;
      }
      return 0;
    }

    final freePlaces = (length+1)%5;
    if (length < 10) {
      return 10-length-1;
    }
    if (freePlaces == 0) {
      return 0;
    }
    return 5-freePlaces;
  }
}