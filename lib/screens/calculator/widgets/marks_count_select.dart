import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:levlly/theme/app_colors.dart';
import 'package:levlly/theme/app_dimensions.dart';
import 'package:levlly/widgets/export.dart';

class MarksCountSelect extends StatefulWidget {
  const MarksCountSelect({super.key, required this.updateNumberOfRequiredMarks});

  final ValueChanged<int> updateNumberOfRequiredMarks;

  @override
  State<MarksCountSelect> createState() => _MarksCountSelectState();
}

class _MarksCountSelectState extends State<MarksCountSelect> {
  int selected = 0;
  final controller = TextEditingController();

  @override
  void initState() {
    controller.text = "1";
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ItemBlock(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(5, (int index) {
            return BlockTextButton(
            value: index != 4 ? (index+1).toString() : null,
            backgroundColor: index != 4 
              ? (selected == index ? AppColors.selected : AppColors.blockItemsBackgroundColor) 
              : (selected >= 4 ? AppColors.selected : AppColors.blockItemsBackgroundColor),
            height: AppDimensions.selectItemSize,
            width: AppDimensions.selectItemSize,
            elevation: AppDimensions.selectItemElevation,
            onPressed: (){
              if(index == 4){
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: AppColors.blockBackgroundColor,
                      content: 
                        TextField(
                          controller: controller,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            hintText: "Введите число", // Добавлено текстовое поле подсказки
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.alternativeTextColor), // Изменение цвета при фокусе
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.selected), // Базовый цвет подчёркивания
                            ),
                            counterText: "", // Отключение отображения счётчика символов
                          ),
                          maxLength: 2,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp("[0123456789]"))
                          ],
                          onSubmitted: (value) => onSubmitted(value),
                          style: const TextStyle(
                            color: AppColors.alternativeTextColor,
                            fontSize: AppDimensions.fontSize-10,
                            fontWeight: AppDimensions.fontWeight
                          ),
                        ),
                      
                      actions: [
                        Center(
                          child: TextButton(
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(AppColors.blockItemsBackgroundColor)
                            ),
                            onPressed: () => onSubmitted(controller.text),
                            child: const Text(
                              "Сохранить", 
                              style: TextStyle(
                                color: AppColors.alternativeTextColor,
                                fontSize: AppDimensions.fontSize-10,
                                fontWeight: AppDimensions.fontWeight
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              }
              else {
                selected = index;
              }
              widget.updateNumberOfRequiredMarks(selected+1);
            },
            child: index == 4 ? const Icon(
              Icons.edit_rounded,
              color: AppColors.alternativeTextColor,
              size: AppDimensions.selectIconSize,
            ) : null
          );
        }),
      )
    );
  }

  void onSubmitted(String value){
    if(value.isNotEmpty){
      selected = int.parse(value)-1;
      widget.updateNumberOfRequiredMarks(selected+1);
    }
    Navigator.of(context).pop();
  }
}