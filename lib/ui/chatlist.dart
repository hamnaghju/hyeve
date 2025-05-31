import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/controllers.dart';
import 'chatDetail.dart';

class chatlist extends StatefulWidget {
  const chatlist({super.key});

  @override
  State<chatlist> createState() => _chatlistState();
}

class _chatlistState extends State<chatlist> {
  final ChatsController controller = Get.put(ChatsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF181818),
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Icon(Icons.arrow_back, color: Colors.grey),
                  ),
                   Text(
                    'Hyeve✦',
                    style: GoogleFonts.raleway(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 24, color: Color(0xFF8791F4), height: 3
                        )
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Chats Title
              Text('Chats',textAlign: TextAlign.start,style: GoogleFonts.manrope(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w700, fontSize: 30, color: Colors.white,
                  )
              ),),
              const SizedBox(height: 20),

              // Chat Items
              Expanded(
                child: ListView.separated(
                  itemCount: controller.chatItems.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    return ListTile(

                      title: Text(controller.chatItems[index],
                        textAlign: TextAlign.start,style: GoogleFonts.manrope(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 15, color: Colors.grey,
                          )
                      ),),
                      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
                      onTap: () {
                        // Handle navigation or action here
                      },
                    );
                  },
                ),
              ),

              // Disclaimer
              Padding(
                padding: EdgeInsets.only(top: 12.0),
                child: Center(
                  child: Text(
                    "Hyeve is not affiliated with any of the listed references.", textAlign: TextAlign.center,
                    style:GoogleFonts.manrope(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 12, color: Colors.grey,
                      ),
                  ),)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
