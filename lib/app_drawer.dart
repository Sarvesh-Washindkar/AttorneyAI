import 'package:attorney_ai/app_colors.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
    required this.previousUserPrompts,
  });

  final List<String> previousUserPrompts;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // backgroundColor: const Color.fromARGB(255, 34, 34, 34),
      backgroundColor: AppColors.tertiaryBackground,
      child: Padding(
        padding: const EdgeInsets.only(top: 45, left: 16, right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
              margin: const EdgeInsets.only(right: 20, bottom: 26),
              decoration: BoxDecoration(
                // color: const Color.fromARGB(255, 81, 81, 81),
                color: AppColors.secondaryBackground,
                borderRadius: BorderRadius.circular(45),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.search,
                    color: Colors.white70,
                    size: 30,
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: TextField(
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      decoration: InputDecoration(
                        hintText: "Search",
                        hintStyle: TextStyle(color: Colors.white70),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Text(
              "Chats",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 10),
                itemCount: previousUserPrompts.length,
                itemBuilder: (context, index) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        // overlayColor: const Color.fromARGB(255, 57, 57, 57),
                        overlayColor: AppColors.tertiaryBackground,

                        
                        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
                        // backgroundColor: const Color.fromARGB(255, 34, 34, 34),
                        backgroundColor: Colors.transparent,
                        // Colors.red,
                        elevation: 0,
                        
                        alignment: Alignment.centerLeft,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8)))),
                    onPressed: () {},
                    child: Text(
                      previousUserPrompts[index],
                      style: const TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
