import 'package:flutter/material.dart';


// ignore: must_be_immutable
class MessagesScreen extends StatelessWidget {
  List<Widget> messages;

  MessagesScreen({super.key, required this.messages});


  TextEditingController messageFieldController = TextEditingController();

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
                spacing: 20,
                crossAxisAlignment: CrossAxisAlignment.center,
                // children: widget.messages.map<Widget>((message){

                //   return message['isPrompt'] ? MyPrompt(text: message['text']) : AIResponse(text: message['text'], loaderText: message['loaderText']);

                // }).toList()

                children: messages,
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
}
