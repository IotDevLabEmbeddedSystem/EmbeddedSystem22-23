

import 'package:flutter/material.dart';

import '../widgets/message_bubble.dart';

List<String> messageSend = ["Hello", "Modit","Sala"];
List<String> messageSender = ["Hello", "Alfreda"];

class aichat extends StatelessWidget {
  const aichat({Key? key}) : super(key: key);


void getMessages ( ) async{
  
}
  @override
  Widget build(BuildContext context) {
    final messageTextController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff3E64FF),
        leading: IconButton(icon:Icon(Icons.arrow_back_ios_new),onPressed:() => Navigator.of(context).pop() ,),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("images/doct2.png"),
              radius: 18,
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Dr Esther Brown"),
                Text(
                  "last seen today at 5:12 am",
                  style: TextStyle(
                    fontSize: 11,
                  ),
                )
              ],
            )
          ],
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Stack(children: [
          Image.asset(
            "images/chatback.png",
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Expanded(
              child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            children: [
              MessageBubble(
                sender: messageSender[0],
                text: messageSender[1],
                user: false,
              ),
              MessageBubble(
                sender: messageSend[0],
                text: messageSend[1],
                user: true,
              )
            ],
          )),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                // decoration:  ,

                color: Color(0xff3E64FF),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: TextField(
                      decoration: InputDecoration(
                          hintText: "Type your message ",
                          hintStyle: TextStyle(color: Colors.white),
                          prefixIcon: IconButton(
                            onPressed: () {
                              messageTextController.clear();
                            },
                            icon: Icon(
                              Icons.attach_file,
                              color: Colors.white,
                            ),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              messageTextController.clear();
                            },
                            icon: Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                            ),
                          )),
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                      controller: messageTextController,
                      cursorColor: Colors.white12,
                      onChanged: (value) {
                        
                        messageSender.add(value);
                      },
                    )),
                  ],
                ),
              ))
        ]),
      ),
    );
  }
}

