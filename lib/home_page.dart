import 'dart:async';
import 'package:attorney_ai/ai_response.dart';
import 'package:attorney_ai/app_drawer.dart';
import 'package:attorney_ai/my_prompt.dart';
import 'package:attorney_ai/token.dart';
import 'package:flutter/material.dart';
import 'package:attorney_ai/app_colors.dart';
import 'package:attorney_ai/input_field.dart';
import 'package:attorney_ai/messages_screen.dart';

import 'initial_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  IconData suffixIcon = Icons.mic;

  List<Widget> messages = [];
  TextEditingController incidentController = TextEditingController();

  bool generatingResponse = false;
  
  List<String> chats = ["Chat 1", "Chat 2"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.lightBackground,
      backgroundColor: AppColors.primaryBackground,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: AppColors.primary,
        ),

        backgroundColor: Colors.transparent,
        centerTitle: true,

        // toolbarHeight: 80,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
                width: 40,
                height: 40,
                child: Image.asset("assets/images/logo.png")),
            const Text(
              "Attorney",
              style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 26,
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              "AI",
              style: TextStyle(
                  color: AppColors.secondaryText,
                  fontSize: 26,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 16,
              backgroundColor: Colors.deepPurple,
              child: Text(
                "S",
                style: TextStyle(color: AppColors.primaryText),
              ),
            ),
          )
        ],
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [

          //   ],
          // ),

          Expanded(
            child: messages.isEmpty
                ? const InitialScreen()
                : MessagesScreen(messages: messages),
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: InputField(
              hintText: "Tell me the incident...",
              enabled: !generatingResponse,
              suffixIcon:  suffixIcon,
              controller: incidentController,
              prefixIcon: Icons.add,
              onPrefixIconPressed: () {},
              textCapitalization: TextCapitalization.sentences,
              multiline: true,
              onChanged: (text) {
                setState(() {
                  if (text!.isNotEmpty) {
                    suffixIcon = Icons.send_rounded;
                  } else {
                    suffixIcon = Icons.mic;
                  }
                });
              },
              onSuffixIconPressed: () {
                if (incidentController.text.trim().isNotEmpty) {
                  setState(() {
                    messages.add(MyPrompt(text: incidentController.text));
                    messages.add(AIResponse(tokens: const [], loaderText: 'Analyzing your incident', generating: true,));

                    incidentController.text = "";
                    suffixIcon = Icons.mic;
                    generatingResponse = true;
                  });


                  

                  Timer(const Duration(seconds: 5), () {
                    List words =
                        """According to your incident these are the acts and sections that are applicable: \n
1. Indian Penal Code, 1860: \n
  a. Section 441: Criminal Trespass - Whoever enters into or upon property in the possession of another with intent to commit an offense or to intimidate, insult, or annoy any person in possession of such property.\n
  b. Section 447: Punishment for Criminal Trespass - Whoever commits criminal trespass shall be punished with imprisonment of either description for a term which may extend to three months, or with a fine which may extend to five hundred rupees, or with both.\n
  c. Section 503: Criminal Intimidation - Whoever threatens another with any injury to his person, reputation, or property, with intent to cause alarm to that person or to cause him to do or omit to do any act which he is not legally bound to do or omit, as the means of avoiding the execution of such threat.
""".split(' ');
                    int i = 0;

                    List<Token> tokens = [];


                    // Start Generation

                    Timer.periodic(const Duration(milliseconds: 100), (timer) {
                      setState(() {
                        tokens.add(Token(text: words[i] +" "));
                        messages.last = AIResponse( tokens: tokens, loaderText: '', generating: i != words.length - 1,);

                        if (i == words.length - 1) {
                          timer.cancel();
                          generatingResponse = false;
                        } else {
                          i++;
                        }

                      });
                    });

                  });
                }
              },
            ),
          )
        ],
      ),

      drawer: AppDrawer(previousUserPrompts: chats),
    );
  }
}
