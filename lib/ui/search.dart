import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../controllers/constant_txt.dart';
import '../controllers/controllers.dart';
import '../widgets/widgets.dart';
import 'chatlist.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading:
        IconButton(onPressed: () => Get.to(chatlist()),
            icon: AppIcons(iconcolor: Colors.grey,
                iconsize: 24,
                iconimage: Icons.history)),
        centerTitle: true,
        title: Container(height: 26, width: 160, decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/img_1.png"))
        ),),
        actions: [
          IconButton(onPressed: () {},
              icon: AppIcons(iconcolor: Colors.grey,
                  iconsize: 24,
                  iconimage: Icons.add_box_outlined)),
        ],


      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              controller: _scrollController,
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/img_3.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      children: [
                        // Warning banner
                        Container(
                          height: 40,
                          width: double.infinity,
                          color: const Color(0xFF2D2D2D),
                          alignment: Alignment.center,
                          child: warningtext(
                            "Hyeve is not affiliated with any of the listed references.",
                            Colors.grey,
                          ),
                        ),

                        // Spacer for top margin (adjusts based on height)
                        SizedBox(height: constraints.maxHeight * 0.1),

                        // Image + Heading
                        Container(
                          height: constraints.maxHeight * 0.35,
                          width: 340,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 214,
                                height: 191,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/img_4.png"),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                child: headingtext(
                                  "Your AI Real Estate \n Buddy",
                                  Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const Spacer(),

                        // Chat input
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                          child: ChatInputField(
                            controller: _chatController,
                            onSend: _handleSend,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }}

