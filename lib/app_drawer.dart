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
      backgroundColor: const Color.fromARGB(255, 34, 34, 34),
      child: Padding(
        padding: EdgeInsets.only(top: 45, left: 16, right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
              margin: EdgeInsets.only(right: 20, bottom: 26),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 81, 81, 81),
                borderRadius: BorderRadius.circular(45),
              ),
              child: Row(
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
            Text(
              "Chats",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: previousUserPrompts.length,
                itemBuilder: (context, index) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        overlayColor: const Color.fromARGB(255, 57, 57, 57),
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 8),
                        backgroundColor: const Color.fromARGB(255, 34, 34, 34),
                        // Colors.red,
                        elevation: 0,
                        alignment: Alignment.centerLeft,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8)))),
                    onPressed: () {},
                    child: Text(
                      previousUserPrompts[index],
                      style: TextStyle(color: Colors.white, fontSize: 17),
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
