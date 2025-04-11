import 'package:flutter/material.dart';
import 'package:attorney_ai/app_colors.dart';
// import 'package:attorney_ai/light_blue_shadow.dart';

// ignore: must_be_immutable
class MyPrompt extends StatelessWidget {
  String message;
  bool isSameMember;

  String time;

  bool isDelivered;

  VoidCallback? onLongPress;

  VoidCallback? onTap;

  bool isSelected;

  MyPrompt({
    super.key,
    required this.message,
    required this.time,
    this.onLongPress,
    this.onTap,
    this.isSelected = false,
    this.isDelivered = true,
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
                            color: const Color.fromARGB(179, 81, 81, 81),
                            borderRadius: BorderRadius.only(
                              topLeft: const Radius.circular(15),
                              bottomRight: const Radius.circular(15),
                              bottomLeft: const Radius.circular(15),
                              topRight: const Radius.circular(15),
                            )),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              message,
                              style: const TextStyle(
                                color: AppColors.normalText,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 10,
                        bottom: 5,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              time,
                              style: TextStyle(
                                fontSize: 11,
                                color: Color.fromARGB(255, 233, 233, 233),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            // Icon(
                            //   isDelivered ? FontAwesomeIcons.check : FontAwesomeIcons.clock,
                            //   color: Colors.white,
                            //   size: 12,
                            // )
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
