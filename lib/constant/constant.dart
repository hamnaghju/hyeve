import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_fonts/google_fonts.dart';

class AppIcons extends StatelessWidget {
  final Color? iconcolor;
  final double iconsize;
  final IconData iconimage;
  const AppIcons({super.key, required this.iconcolor, required this.iconsize, required this.iconimage});

  @override
  Widget build(BuildContext context) {
    return Icon(iconimage, color: iconcolor, size: iconsize,);
  }
}

CreateBtn(Color splashcolor, Color textcolor, String text, VoidCallback ontap){
  return  GestureDetector(
    onTap: ontap,
    child: Container(
      margin: EdgeInsets.only( top: 10, bottom: 10),
      height: 52,
      width: double.infinity,
      decoration: BoxDecoration(
          color: splashcolor,
          borderRadius: BorderRadius.circular(27)
      ),
      child: Center(
        child: Text(text,
            style: GoogleFonts.manrope(
              textStyle: TextStyle(color: textcolor,
                  fontWeight: FontWeight.w700, fontSize: 20), )),
      ),
    ),
  );
}



class FavoritesController extends GetxController {
  var favorites = <Map<String, String>>[
    {
      'title': 'New Favor Lodge',
      'subtitle': 'Student Lodging',
    },
    {
      'title': 'Mirnkey Well Apartment',
      'subtitle': 'Studio Apt.',
    },
    {
      'title': 'Isaac Esiagbona Enam...',
      'subtitle': 'Real Estate Agent',
    },
  ].obs;

  void removeFavorite(int index) {
    favorites.removeAt(index);
  }
}