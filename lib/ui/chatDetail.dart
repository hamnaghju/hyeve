import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hyeve/ui/lodgeDetails.dart';
import '../../widgets/widgets.dart';

class Message {
  final String text;
  final bool isUser;
  Message({required this.text, required this.isUser});
}

class ChatDetailController extends GetxController {
  var messages = <Message>[].obs;
  final TextEditingController inputController = TextEditingController();
  var isBotTyping = false.obs;
  var lastUserMessage = "".obs;
  var chatItems = <String>[].obs; // Stores messages shown in the other screen


  final List<String> recommendations = [
    "Victoria Lodge",
    "Croydon Lodge",
    "New Favor Lodge",
    "Villamax Lodge",
    "Student- Lodging Apartment...",
  ];

  void sendMessage() {
    final input = inputController.text.trim();
    if (input.isEmpty) return;

    messages.add(Message(text: input, isUser: true));
    chatItems.insert(0, input); // Insert latest chat on top
    inputController.clear();

    isBotTyping.value = true;

    Future.delayed(const Duration(seconds: 3), () {
      isBotTyping.value = false;
      messages.add(Message(
        text: "This is a default response from Hyeve chatbot. please tell me what you want me to help you with, I'll very much available for that",
        isUser: false,
      ));
    });
  }
}
  class ChatDetailPage extends StatelessWidget {
  final ChatDetailController controller = Get.put(ChatDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  const Icon(Icons.history, color: Colors.white),
                  const SizedBox(width: 10),
                  const Text(
                    'Hyeve',
                    style: TextStyle(
                      color: Color(0xFF9C9EFF),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.white10,
                      border: Border.all(color: Colors.grey.shade700),
                    ),
                    child: const Text(
                      'Get Plus +',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                  ),
                  const Spacer(),
                  const Icon(Icons.more_vert, color: Colors.white),
                ],
              ),
            ),

            // Disclaimer
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Hyeve is not affiliated with any of the listed references.", textAlign: TextAlign.center,
                  style:  GoogleFonts.manrope(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 12, color: Colors.grey,
                    ),
                ),)
              ),
            ),
            const SizedBox(height: 10),

            // Chat Messages
            Expanded(
              child: Obx(
                    () => ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    ...controller.messages.map((message) {
                      if (message.isUser) {
                        return Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            margin: const EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                              color: Colors.grey[850],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              message.text,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      } else {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CircleAvatar(
                              backgroundColor: Colors.transparent,
                              child: Icon(Icons.smart_toy, color: Colors.white),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                margin: const EdgeInsets.only(top: 10),
                                decoration: BoxDecoration(
                                  color: Colors.grey[900],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  message.text,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                    }),

                    // Bot Typing Animation
                    if (controller.isBotTyping.value)
                      const BotTypingIndicator(),
                  ],
                ),
              ),
            ),

            // Recommendations
            if (controller.recommendations.isNotEmpty)
              Column(
                children: controller.recommendations.map((item) {
                  return GestureDetector(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.grey[850],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListTile(
                        title: Text(item, style: GoogleFonts.manrope(
                      textStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),)),
                        trailing: const Icon(Icons.chevron_right, color: Colors.white),
                        onTap: () => Get.to(LodgeDetailView()),
                      ),
                    ),
                  );
                }).toList(),
              ),

            // Chat Input
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: Colors.grey.shade800)),
                color: Colors.black,
              ),
              child: Row(
                children: [
                  Container(height: 16, width: 16, decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/img_5.png"))),),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: controller.inputController,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Ask anything...',
                        hintStyle: const TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.grey[850],
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onSubmitted: (_) => controller.sendMessage(),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: controller.sendMessage,
                    child: const Icon(Icons.send, color: Colors.grey),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
