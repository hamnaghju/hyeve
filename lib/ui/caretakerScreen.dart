import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/controllers.dart';

class CaretakerReviewScreen extends StatelessWidget {
  final controller = Get.put(CaretakerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xFF1C1C1E),
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'Review',
                style: GoogleFonts.manrope(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 17, color: Color(0xFF8791F4),
                    )
                ),
              ),
            ),
            SizedBox(width: 12),
            CircleAvatar(
              radius: 18,
              backgroundColor: Colors.white10,
              child: Icon(Icons.bookmark_border, color: Colors.white),
            ),
            SizedBox(width: 12),
            CircleAvatar(
              radius: 18,
              backgroundColor: Colors.white10,
              child: Icon(Icons.share, color: Colors.white),
            ),
          ],
        ),
      ),
      body: Obx(() {
        final data = controller.caretaker.value;
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 24,
                      child:Text("C", style: GoogleFonts.manrope(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 24, color: Colors.white,
                    ),),),),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        data.name,
                        style: GoogleFonts.manrope(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 24, color: Colors.white,
                            )
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),

                // TrustScore + Rating
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Color(0xFF312800),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        'TrustScore: ${data.trustScore}%',
                        style:GoogleFonts.manrope(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 14,  color: Color(0xFFFFAE00),
                            )
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.star, color: Colors.blue, size: 18),
                    Text(
                      '${data.rating} (${data.reviewsCount})',
                      style:  GoogleFonts.manrope(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 14,
                          )
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                Text(
                  'About',
                  style: GoogleFonts.manrope(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 18, color: Colors.white,
                      )
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  data.about,
                  style: GoogleFonts.manrope(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 15, color: Colors.white,
                      )
                  ),
                ),
                SizedBox(height: 20),

                Text(
                  'Key Traits',
                  style: GoogleFonts.manrope(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 18, color: Colors.white,
                      )
                  ),
                ),
                SizedBox(height: 8),

                ...data.traits.map(_buildTrait),

                SizedBox(height: 150),
                Divider(color: Colors.grey),
                Center(
                  child: Text(
                    'Content is opinion-based and may not be fully accurate',
                    style:GoogleFonts.manrope(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 12.5, color: Colors.grey,
                        ))
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _buildTrait(String trait) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          Icon(Icons.circle, color: Colors.white70, size: 6),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              trait,
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
