import 'dart:async';

import 'package:flutter/material.dart';
import 'package:legalfriend/app_colors.dart';
import 'package:legalfriend/input_field.dart';
import 'package:legalfriend/messages_screen.dart';

import 'initial_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  IconData suffixIcon = Icons.mic;

  List messages = [];

  TextEditingController incidentController = TextEditingController();

  String mainPrompt = """
  "Given the following FIR complaint description, please list all applicable acts and sections according to the Indian law system in the specified JSON format below. The response must include the title of each act along with the year it was enacted, its sections, and each section must have a title and a very short description. Make sure to include all relevant acts that apply to the context of the complaint, reflecting multiple applicable acts if necessary. FIR Complaint Description: '[<INCIDENT>]'

Expected JSON Format in response:
[
    {
        "act": "Act Title, Year",
        "sections": [
            {
                "title": "Section Title",
                "description": "Section description."
            },
            {
                "title": "Section Title",
                "description": "Section description."
            }
        ]
    }
]""";

  Widget screen = const InitialScreen();

  @override
  void initState() {
    if (messages.isNotEmpty) {
      screen = MessagesScreen(messages: messages);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.lightBackground,
      backgroundColor: Color(0x000000),
      appBar: AppBar(
        iconTheme: IconThemeData(
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
            Text(
              "Attorney",
              style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 26,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "AI",
              style: TextStyle(
                  color: AppColors.semiLightText,
                  fontSize: 26,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 16,
              child: Text(
                "S",
                style: TextStyle(color: AppColors.normalText),
              ),
              backgroundColor: Colors.deepPurple,
            ),
          )
        ],
      ),

      body: Container(
        // width: double.infinity,
        //   height: double.infinity,

        //   decoration: const BoxDecoration(
        //     gradient: LinearGradient(
        //       colors: [AppColors.lightBackground, AppColors.lightBlue],
        //       begin: Alignment.topCenter,
        //       end: Alignment.bottomCenter,
        //     ),
        //   ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [

            //   ],
            // ),

            Expanded(
              child: screen,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: InputField(
                hintText: "Tell me the incident...",
                suffixIcon: suffixIcon,
                controller: incidentController,
                prefixIcon: Icons.attach_file_rounded,
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
                    String incident = "";

                    setState(() {
                      messages.add({
                        'isPrompt': true,
                        'content': incidentController.text,
                      });
                    });

                    // getResponse(incidentController.text);
                    setState(() {
                      incident = incidentController.text;
                      incidentController.text = "";
                      suffixIcon = Icons.mic;

                      //temporary
                      messages.add({
                        'isPrompt': false,
                        'content': 'Analyzing your incident ...'
                      });
                      screen = MessagesScreen(messages: messages);
                    });

                    Timer(Duration(seconds: 2), () {
                      if (incident.contains('कल')) {
                        setState(() {
                          messages.last['content'] = """
  [
    {
        "act": "भारतीय दंड संहिता, 1860",
        "sections": [
            {
                "title": "धारा 390: डकैती",
                "description": "सभी डकैतियों में या तो चोरी होती है या जबरन वसूली, जहां एक अपराधी हिंसा या हिंसा की धमकी का उपयोग करके संपत्ति पर कब्जा कर लेता है।"
            },
            {
                "title": "धारा 392: डकैती की सज़ा",
                "description": "जो कोई डकैती करता है उसे कठोर कारावास की सज़ा दी जाएगी, जिसकी अवधि दस वर्ष तक हो सकती है, और साथ ही वह जुर्माने के लिए भी उत्तरदायी होगा। यदि डकैती सूर्यास्त और सूर्योदय के बीच राजमार्ग पर की जाती है, तो कारावास चौदह वर्ष तक हो सकता है।"
            },
            {
                "title": "धारा 378: चोरी",
                "description": "जो कोई किसी व्यक्ति की अनुमति के बिना कोई भी चल संपत्ति बेईमानी से उसके कब्जे से निकालने का इरादा रखते हुए, उस संपत्ति को इस इरादे से ले जाता है, वह चोरी करता है।"
            },
            {
                "title": "धारा 506: आपराधिक धमकी की सज़ा",
                "description": "जो कोई आपराधिक धमकी का अपराध करता है, उसे दो वर्ष तक के कारावास, या जुर्माने, या दोनों से दंडित किया जाएगा।"
            }
        ]
    }
]
                              """;

                          screen = MessagesScreen(messages: messages);
                        });
                      } else {
                        setState(() {
                          messages.last['content'] = """
                                    [
        {
            "act": "Indian Penal Code, 1860",
            "sections": [
                {
                    "title": "Section 441: Criminal Trespass",
                    "description": "Whoever enters into or upon property in the possession of another with intent to commit an offense or to intimidate, insult, or annoy any person in possession of such property."
                },
                {
                    "title": "Section 447: Punishment for Criminal Trespass",
                    "description": "Whoever commits criminal trespass shall be punished with imprisonment of either description for a term which may extend to three months, or with a fine which may extend to five hundred rupees, or with both."
                },
                {
                    "title": "Section 503: Criminal Intimidation",
                    "description": "Whoever threatens another with any injury to his person, reputation, or property, with intent to cause alarm to that person or to cause him to do or omit to do any act which he is not legally bound to do or omit, as the means of avoiding the execution of such threat."
                },
                {
                    "title": "Section 506: Punishment for Criminal Intimidation",
                    "description": "Whoever commits the offense of criminal intimidation shall be punished with imprisonment of either description for a term which may extend to two years, or with fine, or with both."
                },
                {
                    "title": "Section 425: Mischief",
                    "description": "Whoever with intent to cause, or knowing that he is likely to cause, wrongful loss or damage to the public or to any person, causes the destruction of any property, or any change in it which destroys or diminishes its value or utility, commits 'mischief'."
                },
                {
                    "title": "Section 427: Mischief Causing Damage",
                    "description": "Whoever commits mischief and thereby causes loss or damage to the amount of fifty rupees or upwards, shall be punished with imprisonment of either description for a term which may extend to two years, or with fine, or with both."
                }
            ]
        }
    ]
                              """;

                          screen = MessagesScreen(messages: messages);
                        });
                      }
                    });
                  }
                },
              ),
            )
          ],
        ),
      ),

      drawer: Container(),
    );
  }
}
