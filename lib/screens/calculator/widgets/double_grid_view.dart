import 'package:flutter/material.dart';
import 'package:levlly/screens/calculator/widgets/dotted_placeholder.dart';
import 'package:levlly/screens/calculator/widgets/view_more_button.dart';
import 'package:levlly/theme/app_colors.dart';
import 'package:levlly/widgets/block_text_button.dart';

class DoubleGridView extends StatefulWidget {
  const DoubleGridView({super.key, required this.marks});

  final List<int> marks;

  @override
  State<DoubleGridView> createState() => _DoubleGridViewState();
}

class _DoubleGridViewState extends State<DoubleGridView> {
  final double itemsSize = 53;
  final double horizontalItemsPadding = 19;
  final double verticalItemsPadding = 15; // Только для dual mode
  bool expandMode = false;

  @override
  Widget build(BuildContext context) {
    // Один ряд
    if(!expandMode){
      return SizedBox(
        height: itemsSize,
        child: Row(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: widget.marks.length+1,
                padding: const EdgeInsets.symmetric(horizontal: 2),
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) {
                  return SizedBox(width: horizontalItemsPadding);
                },
                itemBuilder: (context, index){
                  if (index == widget.marks.length){ // Отступ для последнего элемента
                    return Container();
                  }
                  return BlockTextButton(
                    value: widget.marks[index].toString(), 
                    onPressed: (){},
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
            const SizedBox(width: 2)
          ]
        ),
      );
    }

    // Случай для двух рядов
    final freePlaces = getFreePlaces(widget.marks.length); // Кол-во placeholder
    return SizedBox(
      height: itemsSize * 2 + verticalItemsPadding,
      child: GridView.builder(
        itemCount: widget.marks.length+freePlaces+1,
        padding: const EdgeInsets.symmetric(horizontal: 2),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          crossAxisSpacing: horizontalItemsPadding,
          mainAxisSpacing: verticalItemsPadding,
        ),
        itemBuilder: (context, index) {
          if (index < widget.marks.length){
            return BlockTextButton(
              value: widget.marks[index].toString(), 
              onPressed: (){},
              useBackgroundColorScheme: true, 
              color: AppColors.textColor,
              elevation: 0,
              width: itemsSize,
              height: itemsSize,
            );
          }
          if (index == widget.marks.length+freePlaces){
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

  int getFreePlaces(int length) {
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