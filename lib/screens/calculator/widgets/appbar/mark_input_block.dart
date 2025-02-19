import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:levlly/theme/app_colors.dart';
import 'package:levlly/theme/app_dimensions.dart';
import 'package:levlly/widgets/item_block.dart';

class MarkInputBlock extends StatefulWidget {
  const MarkInputBlock({
    super.key,
    required this.changeGoalScore,
    required this.defaultGoalScore,
    this.width, 
    this.height,
    this.elevation,
    this.backgroundColor, 
  });

  final ValueChanged<String> changeGoalScore;
  final String defaultGoalScore;
  final double? width;
  final double? height;
  final double? elevation;
  final Color? backgroundColor;

  @override
  State<MarkInputBlock> createState() => _MarkInputBlockState();
}

class _MarkInputBlockState extends State<MarkInputBlock> {
  final controller = TextEditingController();
  late final ValueNotifier<Color> textColorNotifier;

  @override
  void initState() {
    super.initState();
    controller.text = widget.defaultGoalScore;
    textColorNotifier = ValueNotifier<Color>(
      getColor(controller.text),
    );

    controller.addListener(() {
      textColorNotifier.value = getColor(controller.text);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    textColorNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ItemBlock(
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: Center(
          child: ValueListenableBuilder<Color>(
            valueListenable: textColorNotifier,
            builder: (context, color, child) {
              return TextField(
                controller: controller,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                textAlignVertical: TextAlignVertical.center,
                decoration: null,
                maxLength: AppDimensions.markInputMaxLenght,
                cursorColor: color,
                style: TextStyle(
                  fontSize: AppDimensions.markInputFontSize,
                  fontWeight: AppDimensions.markInputFontWeight,
                  color: color
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp("[0123456789.]"))
                ],
                onSubmitted: onSubmitted
              );
            },
          ),
        )
      ),
    );
  }

  void onSubmitted(value){
    final double? score = double.tryParse(value);
    if (score == null){
      controller.text = widget.defaultGoalScore;
      return;
    }
    if (score > 5){
      controller.text = "5";
      widget.changeGoalScore("5");
      return;
    }
    widget.changeGoalScore(value); 
  }

  Color getColor(String value){
    final formattedValue = double.tryParse(value);
    if (formattedValue == null){
      return AppColors.getColor(0);
    }
    if (formattedValue > 5){
      return AppColors.getColor(5);
    }
    return AppColors.getColor(formattedValue);
  }
}