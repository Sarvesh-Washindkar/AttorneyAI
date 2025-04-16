import 'package:flutter/material.dart';
import 'package:attorney_ai/app_colors.dart';
// import 'package:attorney_ai/light_blue_shadow.dart';

// ignore: must_be_immutable
class MyPrompt extends StatelessWidget {
  String text;
  bool isSameMember;

  VoidCallback? onLongPress;

  VoidCallback? onTap;

  bool isSelected;

  MyPrompt({
    super.key,
    required this.text,
    
    this.onLongPress,
    this.onTap,
    this.isSelected = false,
    this.isSameMember = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: !isSameMember ? const EdgeInsets.only(top: 10) : EdgeInsets.zero,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 50, top: 3, bottom: 3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Flexible(
                  child: Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            // color: AppColors.primary.withOpacity(0.15),
                            color: AppColors.secondaryBackground,
                            border: Border.all(color: AppColors.secondaryBackgroundBorder, width: 0.3),
                            borderRadius: const BorderRadius.all(Radius.circular(15)).copyWith(bottomRight: const Radius.circular(0)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              text,
                              style: const TextStyle(
                                color: AppColors.primaryText,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: GestureDetector(
              onLongPress: onLongPress,
              onTap: onTap,
              child: Container(
                color: isSelected
                    ? AppColors.primaryVariant.withOpacity(0.2)
                    : Colors.transparent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
