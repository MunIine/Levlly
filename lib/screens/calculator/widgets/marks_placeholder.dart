import 'package:flutter/material.dart';
import 'package:levlly/screens/calculator/widgets/dotted_placeholder.dart';
import 'package:levlly/screens/calculator/widgets/view_more_button.dart';
import 'package:levlly/widgets/export.dart';

class MarksPlaceholder extends StatefulWidget {
  const MarksPlaceholder({super.key});

  @override
  State<MarksPlaceholder> createState() => _MarksPlaceholderState();
}

class _MarksPlaceholderState extends State<MarksPlaceholder> {
  late List<Widget> marks;
  bool expandMode = true;

  @override
  void initState() {
    marks = List.generate(30, (index) => index == 29 ?
      SizedBox(
        height: 53.2, width: 53.2,
        child: ViewMoreButton(onPressed: (){
          setState(() {
            expandMode = !expandMode;
          });
        }),
      ) : 
      SizedBox(height: 53.2, width: 53.2, child: const DottedPlaceholder())
    ); 

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ItemBlock(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: SizedBox(
          height: expandMode ? 130 : 57.2,
          child: expandMode ? doubleRow() : singleRow()
        ),
      )
    );
  }

  GridView doubleRow() {
    return GridView.builder(
          itemCount: expandMode ? 30 : 5,
          padding: const EdgeInsets.all(2),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            crossAxisSpacing: 18.7,
            mainAxisSpacing: 18.7,
          ),
          itemBuilder: (context, index) {
            return marks[index];
          },
        );
  }

  Row singleRow() {
    return Row(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: marks.length-1,
                padding: EdgeInsets.all(2),
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) {
                  return SizedBox(width: 18.9);
                },
                itemBuilder: (context, index){
                  return marks[index];
                }
              ),
            ),
            marks[marks.length-1],
            SizedBox(width: 2,)
          ]
        );
  }
}