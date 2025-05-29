import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatInputField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;

  ChatInputField({required this.controller, required this.onSend});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          children: [
            Container(height: 16, width: 16, decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/img_5.png"))),),
            SizedBox(width: 8),
            Expanded(
              child: TextField(
                controller: controller,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Ask anything...",
                  hintStyle: GoogleFonts.manrope(
                    textStyle: TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 20,
                    ),),
                  border: InputBorder.none,
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.send, color: Colors.white),
              onPressed: onSend,
            ),
          ],
        ),
      ),
    );
  }
}


