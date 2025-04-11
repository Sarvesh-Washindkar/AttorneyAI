import 'package:legalfriend/member_chat.dart';
import 'package:legalfriend/my_chat.dart';
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class MessagesScreen extends StatefulWidget {
  List messages;

  MessagesScreen({super.key, required this.messages});


  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {

  TextEditingController messageFieldController = TextEditingController();
  List<String> months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

  late String myName;
  late String previousDate;
  late String previousMember;


  @override
  void initState() {
    
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {

    

    return Column(
      children: [

        Expanded(
          child: SingleChildScrollView(
            reverse: true,
            child: Padding(
              padding: const EdgeInsets.all(10.0),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: widget.messages.map<Widget>((message){

                  return message['isPrompt'] ? MyPrompt(message: message['content'], time: "") : AIResponse(message: message['content'], time: "");

                }).toList()
              ),
            ),
          ),
        ),

        // Padding(
        //   padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        //   child: InputField(
        //     hintText: 'Message',
        //     prefixIcon: Icons.attachment_rounded,
        //     controller: messageFieldController,
        //     suffixIcon: Icons.send,
        //     textCapitalization: TextCapitalization.sentences,
        //     multiline: true,

        //   ),
        // )
      ],
    );
  }

  String getCurrentTime() => "${(DateTime.now().hour % 12) == 0 ? 12 : (DateTime.now().hour % 12)}:${DateTime.now().minute < 10 ? '0${DateTime.now().minute}' : DateTime.now().minute} ${(DateTime.now().hour % 12) < 12 ? 'AM' : 'PM'}";
  
  String getCurrentDate() => "${DateTime.now().day} ${months[DateTime.now().month - 1]}, ${DateTime.now().year}";
  
}
