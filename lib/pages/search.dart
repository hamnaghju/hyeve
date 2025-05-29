import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hyeve/constant/constant_txt.dart';

import '../widgets/widgets.dart';

class search extends StatefulWidget {
  const search({super.key});

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  final TextEditingController _chatController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  void _handleSend() {
    String message = _chatController.text.trim();
    if (message.isNotEmpty) {
      print("User asked: $message");
      _chatController.clear();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height:MediaQuery.of(context).size.height +
          MediaQuery.of(context).viewInsets.bottom,
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/img_3.png'), fit: BoxFit.cover)),
          child: Column(
            children: [
              Container(
                height: 40, width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Color(0xFF2D2D2D),),
                child: warningtext("Hyeve is not affiliated with any of the listed references.", Colors.grey)
              ),
              SizedBox(height: 180),
              Container( height: 300, width: 340,// color: Colors.blue,
                child: Stack(
                  children: [
                 Center(child: Container(width: 214,height: 191, decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/img_4.png"))),)),
                    Padding(padding: EdgeInsets.only(top: 160),child:
                    headingtext("Your AI Real State \n Buddy", Colors.white))
                  ])),
              Padding(
                padding: EdgeInsets.only(left: 12, top: 70, right: 12, bottom: 20),
                child: ChatInputField(
                  controller: _chatController,
                  onSend: _handleSend,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }}

