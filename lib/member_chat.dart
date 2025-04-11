import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:attorney_ai/app_colors.dart';
// import 'package:attorney_ai/light_blue_shadow.dart';

// ignore: must_be_immutable
class AIResponse extends StatefulWidget {
  String? memberName;

  String message;
  Widget? profileImage;

  bool isSameMember;

  VoidCallback? onLongPress;
  VoidCallback? onTap;

  bool isSelected;

  String time;

  AIResponse({
    super.key,
    required this.message,
    required this.time,
    this.memberName,
    this.profileImage,
    this.onLongPress,
    this.onTap,
    this.isSelected = false,
    this.isSameMember = false,
  });

  @override
  State<AIResponse> createState() => _AIResponseState();
}

class _AIResponseState extends State<AIResponse> {
  dynamic actsAndSections;

  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    String response = widget.message;
    String jsonString = "";

    try {
      jsonString = response.substring(
          response.indexOf('['), response.lastIndexOf(']') + 1);
      actsAndSections = jsonDecode(jsonString);
      print("decoded: " + jsonString);
      // ignore: empty_catches
    } catch (e) {}

    return Padding(
      padding: !widget.isSameMember
          ? const EdgeInsets.only(top: 10)
          : EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.only(right: 60, top: 3, bottom: 3),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: 5,
            ),
            Flexible(
              child: Container(
                padding: const EdgeInsets.only(
                    bottom: 10, right: 10, top: 7, left: 10),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.only(
                      topRight: const Radius.circular(15),
                      bottomRight: const Radius.circular(15),
                      bottomLeft: const Radius.circular(15),
                      topLeft: const Radius.circular(15)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (widget.memberName != null)
                      Text(
                        widget.memberName!,
                        style: const TextStyle(
                          color: AppColors.primary,
                          fontSize: 14,
                        ),
                      ),

                    Text(
                      widget.message != 'Analyzing your incident ...'
                          ? (widget.message.contains('धारा')
                              ? 'आपकी घटना (शिकायत) के अनुसार ये लागू होने वाले अधिनियम एवं धाराएं हैं'
                              : "According to your incident (complaint) these are the acts and sections that are applicable")
                          : 'Analyzing your incident ...',
                      style: TextStyle(
                        color: widget.message != 'Analyzing your incident ...'
                            ? Colors.white
                            : Colors.grey,
                        fontSize: 15,
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    if (actsAndSections != null)
                      for (var i = 0; i < actsAndSections.length; i++)
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: ExpansionTile(
                            // initiallyExpanded: true,
                            leading: Text(
                              "${i + 1}.",
                              style: TextStyle(
                                  color: AppColors.primary, fontSize: 16),
                            ),
                            collapsedBackgroundColor: AppColors.lightBackground,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            collapsedShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),

                            iconColor: AppColors.primary,
                            collapsedIconColor: AppColors.primary,
                            backgroundColor: AppColors.lightBlue,

                            title: Text(
                              actsAndSections[i]['act'],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),

                            // trailing: Icon(Icons.add),

                            children: [
                              for (var j = 0;
                                  j < actsAndSections[i]['sections'].length;
                                  j++)
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 5),
                                  // padding: const EdgeInsets.only(top: 5, bottom: 5, left: 15, right: 5),
                                  child: ExpansionTile(
                                    iconColor: AppColors.primary,
                                    collapsedIconColor: AppColors.primary,
                                    backgroundColor: AppColors.lightBackground,
                                    // backgroundColor: Colors.white,
                                    collapsedBackgroundColor:
                                        AppColors.lightBackground,

                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    collapsedShape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),

                                    title: Text(
                                      "• " +
                                          actsAndSections[i]['sections'][j]
                                              ['title'],
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onExpansionChanged: (_) {},
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              actsAndSections[i]['sections'][j]
                                                  ['description'],
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                              ),
                                            ),
                                            TextButton(
                                                onPressed: () {},
                                                child: Text("Read more"))
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              SizedBox(
                                height: 7,
                              )
                            ],
                          ),
                        ),

                    SizedBox(
                      height: 5,
                    ),

                    if (widget.message != 'Analyzing your incident ...')
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.thumb_up_alt_outlined,
                            size: 20,
                            color: AppColors.lightText,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.thumb_down_alt_outlined,
                            size: 20,
                            color: AppColors.lightText,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.volume_up,
                            size: 20,
                            color: AppColors.lightText,
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
