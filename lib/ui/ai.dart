import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/controllers.dart';

class Ai extends StatefulWidget {
  const Ai({super.key});

  @override
  State<Ai> createState() => _AiState();
}

class _AiState extends State<Ai> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(15),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenHeight * 0.05),
                    Text(
                      'Roommate',
                      style: GoogleFonts.manrope(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Text(
                      'Relax, let AI match you with a perfect roommate.',
                      style: GoogleFonts.manrope(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.04),

                    // Image + Button Section
                    Container(
                      height: screenHeight * 0.55,
                      width: double.infinity,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(27),
                              image: const DecorationImage(
                                image: AssetImage("assets/img_6.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: CreateBtn(
                              Colors.white,
                              Colors.black,
                              "Coming soon ...",
                                  () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
