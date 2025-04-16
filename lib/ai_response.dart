import 'dart:convert';

import 'package:attorney_ai/gradient_text.dart';
import 'package:attorney_ai/logo.dart';
import 'package:attorney_ai/token.dart';
import 'package:flutter/material.dart';
import 'package:attorney_ai/app_colors.dart';
// import 'package:attorney_ai/light_blue_shadow.dart';

// ignore: must_be_immutable
class AIResponse extends StatelessWidget {
  List<Token> tokens;
  String loaderText;

  bool generating;

  bool isSameMember;

  VoidCallback? onLongPress;
  VoidCallback? onTap;

  bool isSelected;

  AIResponse({
    super.key,
    required this.tokens,
    required this.loaderText,
    this.generating = true,
    this.onLongPress,
    this.onTap,
    this.isSelected = false,
    this.isSameMember = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: !isSameMember ? const EdgeInsets.only(top: 10) : EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.only(right: 60, top: 3, bottom: 3),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Logo(
              load: tokens.isEmpty,
            ),
            const SizedBox(
              width: 0,
            ),
            Flexible(
              child: Container(
                padding: const EdgeInsets.only(bottom: 10, right: 10, left: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    tokens.isEmpty
                        ? GradientText(text: loaderText)
                        : Wrap(
                            alignment: WrapAlignment.start,
                            children: tokens.expand((token) {
                              if (token.text.contains('\n')) {
                                // Split on \n and inject line breaks
                                final parts = token.text.split('\n');
                                final widgets = <Widget>[];

                                for (int i = 0; i < parts.length; i++) {
                                  if (parts[i].isNotEmpty) {
                                    widgets.add(Token(text: parts[i]));
                                  }
                                  if (i < parts.length - 1) {
                                    widgets.add(const SizedBox(
                                        height: 14,
                                        width: double.infinity)); // Line break
                                  }
                                }

                                return widgets;
                              } else {
                                return [Token(text: token.text)];
                              }
                            }).toList(),
                          ),

                    const SizedBox(
                      height: 10,
                    ),

                    // if (actsAndSections != null)
                    //   for (var i = 0; i < actsAndSections.length; i++)
                    //     Padding(
                    //       padding: const EdgeInsets.all(5.0),
                    //       child: ExpansionTile(
                    //         // initiallyExpanded: true,
                    //         leading: Text(
                    //           "${i + 1}.",
                    //           style: TextStyle(
                    //               color: AppColors.primary, fontSize: 16),
                    //         ),
                    //         collapsedBackgroundColor: AppColors.lightBackground,
                    //         shape: RoundedRectangleBorder(
                    //             borderRadius: BorderRadius.circular(10)),
                    //         collapsedShape: RoundedRectangleBorder(
                    //             borderRadius: BorderRadius.circular(10)),

                    //         iconColor: AppColors.primary,
                    //         collapsedIconColor: AppColors.primary,
                    //         backgroundColor: AppColors.lightBlue,

                    //         title: Text(
                    //           actsAndSections[i]['act'],
                    //           style: TextStyle(
                    //               color: Colors.white,
                    //               fontWeight: FontWeight.bold),
                    //         ),

                    //         // trailing: Icon(Icons.add),

                    //         children: [
                    //           for (var j = 0;
                    //               j < actsAndSections[i]['sections'].length;
                    //               j++)
                    //             Padding(
                    //               padding: const EdgeInsets.symmetric(
                    //                   horizontal: 15, vertical: 5),
                    //               // padding: const EdgeInsets.only(top: 5, bottom: 5, left: 15, right: 5),
                    //               child: ExpansionTile(
                    //                 iconColor: AppColors.primary,
                    //                 collapsedIconColor: AppColors.primary,
                    //                 backgroundColor: AppColors.lightBackground,
                    //                 // backgroundColor: Colors.white,
                    //                 collapsedBackgroundColor:
                    //                     AppColors.lightBackground,

                    //                 shape: RoundedRectangleBorder(
                    //                     borderRadius:
                    //                         BorderRadius.circular(10)),
                    //                 collapsedShape: RoundedRectangleBorder(
                    //                     borderRadius:
                    //                         BorderRadius.circular(10)),

                    //                 title: Text(
                    //                   "• " +
                    //                       actsAndSections[i]['sections'][j]
                    //                           ['title'],
                    //                   style: TextStyle(color: Colors.white),
                    //                 ),
                    //                 onExpansionChanged: (_) {},
                    //                 children: [
                    //                   Padding(
                    //                     padding: const EdgeInsets.all(10.0),
                    //                     child: Column(
                    //                       mainAxisSize: MainAxisSize.min,
                    //                       children: [
                    //                         Text(
                    //                           actsAndSections[i]['sections'][j]
                    //                               ['description'],
                    //                           style: const TextStyle(
                    //                             color: Colors.white,
                    //                             fontSize: 15,
                    //                           ),
                    //                         ),
                    //                         TextButton(
                    //                             onPressed: () {},
                    //                             child: Text("Read more"))
                    //                       ],
                    //                     ),
                    //                   ),
                    //                 ],
                    //               ),
                    //             ),
                    //           SizedBox(
                    //             height: 7,
                    //           )
                    //         ],
                    //       ),
                    //     ),

                    // SizedBox(
                    //   height: 5,
                    // ),

                    if (!generating)
                      const Row(
                        // mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.thumb_up_alt_outlined,
                            size: 22,
                            color: AppColors.secondaryText,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.thumb_down_alt_outlined,
                            size: 22,
                            color: AppColors.secondaryText,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.copy_rounded,
                            size: 22,
                            color: AppColors.secondaryText,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.volume_up,
                            size: 22,
                            color: AppColors.secondaryText,
                          ),
                        ],
                      )

                    // Text(
                    //   "Click on the above acts and expand the sections for more details",
                    //   style: const TextStyle(
                    //     color: AppColors.normalText,
                    //     fontSize: 15,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
