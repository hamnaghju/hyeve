import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hyeve/ui/chatDetail.dart';
import 'package:hyeve/ui/chatlist.dart';

import '../ui/caretakerScreen.dart';

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
              onPressed: () => Get.to(ChatDetailPage()),
            ),
          ],
        ),
      ),
    );
  }
}


class BotTypingIndicator extends StatefulWidget {
  const BotTypingIndicator({Key? key}) : super(key: key);

  @override
  State<BotTypingIndicator> createState() => _BotTypingIndicatorState();
}

class _BotTypingIndicatorState extends State<BotTypingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);

    _opacity = Tween(begin: 0.2, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          backgroundColor: Colors.transparent,
          child: Icon(Icons.smart_toy, color: Colors.white),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: FadeTransition(
            opacity: _opacity,
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                "Searching...",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}


