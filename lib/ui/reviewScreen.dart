import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/controllers.dart';

class CaretakerReviewScreen2 extends StatelessWidget {
  final controller = Get.put(LodgeController());

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
                style: TextStyle(color: Color(0xFF9C9EFF), fontWeight: FontWeight.w600),
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
        final data = controller.lodge.value;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Avatar + Name
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey[800],
                    radius: 24,
                    child: Icon(Icons.location_on_sharp, color: Colors.blue, size: 32,),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      data.name,
                      style: GoogleFonts.manrope(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 24, color: Color(0xFF8791F4),
                          )
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),

              // TrustScore + Rating
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Color(0xFF25294B),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      'TrustScore: ${data.trustScore}%',
                      style: GoogleFonts.manrope(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 14, color: Color(0xFF8791F4),
                          )
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.star, color: Colors.blue, size: 18),
                  SizedBox(width: 4),
                  Text(
                    '${data.rating} (${data.rating})',
                    style: GoogleFonts.manrope(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 14, color: Colors.white,
                        )
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),

              // About Section
              Text(
                'About',
                style: GoogleFonts.manrope(
                    textStyle: GoogleFonts.manrope(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 18, color: Colors.white,
                        )
                    ),
                ),
              ),
              SizedBox(height: 8),
              Text(
                data.description,
                style: GoogleFonts.manrope(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 15, color: Colors.white,
                    )
                ),
              ),

              Spacer(),

              Divider(color: Colors.grey),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    'Content is opinion-based and may not be fully accurate',
                    style: GoogleFonts.manrope(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 12.5, color: Colors.grey,
                        )
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
