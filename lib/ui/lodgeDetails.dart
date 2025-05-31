// views/lodge_detail_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hyeve/ui/caretakerScreen.dart';
import 'package:hyeve/ui/reviewScreen.dart';
import '../controllers/controllers.dart';

class LodgeDetailView extends StatelessWidget {
  final LodgeController controller = Get.put(LodgeController());

  @override
  Widget build(BuildContext context) {
    final lodge = controller.lodge.value;
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
                style:GoogleFonts.manrope(
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(lodge.name, style: GoogleFonts.manrope(
                fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white
            )),
            SizedBox(height: 8),
            Row(
              children: [
                Chip(label: Text("Student Lodging", style: GoogleFonts.manrope(
                    fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white
                ),), backgroundColor: Colors.grey[850]),
                SizedBox(width: 8),
                Chip(label: GestureDetector(onTap: () => Get.to(CaretakerReviewScreen2()),
                    child: Text("TrustScore: ${lodge.trustScore}", style:GoogleFonts.manrope(
                        fontSize: 14, fontWeight: FontWeight.w700, color: Colors.blue
                    ),)), backgroundColor: Color(0xFF25294B)),
              ],
            ),
            SizedBox(height: 12),
            Text(
              lodge.description,
              style: GoogleFonts.manrope(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w500, fontSize: 16, color: Colors.white,
                  )
              ),
            ),
            SizedBox(height: 10),

            Row(
                children: [
                  Icon(Icons.star, color: Colors.amber),
                  Text('${lodge.rating} (29)', style: GoogleFonts.manrope(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 14, color: Colors.white,
                      ))
                  ),
                ],
              ),

            SizedBox(height: 10),
            Text('N ${lodge.minPrice} - N ${lodge.maxPrice}/year',
                style: GoogleFonts.manrope(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 23, color: Colors.white,
                    )
                ),),
            Chip(
              label: Text('Tentative Amount',textAlign: TextAlign.end, style:GoogleFonts.manrope(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w500, fontSize: 13, color: Colors.white,
                  )
              ),),backgroundColor: Color(0xFF2D2D2D)

            ),
            SizedBox(height: 5,),
            Text("Anematies", style: GoogleFonts.manrope(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w700, fontSize: 17, color: Colors.white,
                )
            ),),
            Wrap(
              spacing: 8,
              children: lodge.amenities.map((e) => Chip(backgroundColor: Color(0xFF2D2D2D),label: Text(e, style: GoogleFonts.manrope(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w500, fontSize: 13, color: Colors.white,
                  )
              ),))).toList(),
            ),
            Divider(color: Colors.grey[900]),
            Text('Distance from university', style: sectionHeaderStyle()),
            Chip(
              backgroundColor: Color(0xFF2D2D2D),
              label: Text(lodge.distance, style: GoogleFonts.manrope(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w700, fontSize: 17, color: Colors.white,
                  )
              ),),
            ),
            Divider(color: Colors.grey[900]),
            ListTile(
              leading: CircleAvatar( child:Text("C", style: GoogleFonts.manrope(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w700, fontSize: 24, color: Colors.white,
                ),),),),
              title: Text(lodge.caretaker, style: GoogleFonts.manrope(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w700, fontSize: 15, color: Colors.white,
                  )
              ),),
              trailing: GestureDetector(onTap: () => Get.to(CaretakerReviewScreen()),


                child: Text('view profile', style: GoogleFonts.manrope(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 14, color: Colors.white,
                    )
                ),),
              ),
            ),
            Divider(color: Colors.grey),
            Text('Important Notice:', style: sectionHeaderStyle()),
            ...[
              'Hyeve is not associated with the listed references.',
              'ALWAYS verify information and insist on physical inspections.',
              'CAREFULLY review the terms of the lease agreement.',
              'Make payment ONLY to the proprietor after due diligence.'
            ].map((text) => Padding(
              padding:  EdgeInsets.only(bottom: 6.0),
              child: Text('• $text', style: GoogleFonts.manrope(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w700, fontSize: 14, color: Colors.white,
                  ),
              ),),
            )),
            SizedBox(height: 20),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, foregroundColor: Colors.white),
              onPressed: () {
                // Call logic
              },
              icon: Icon(Icons.call),
              label: Text(lodge.phone),
            )
          ],
        ),
      ),
    );
  }

  TextStyle sectionHeaderStyle() {
    return GoogleFonts.manrope(
        fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white
    );
  }
}
