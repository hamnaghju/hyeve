import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/models.dart';
import '../ui/chatDetail.dart';

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

class ProfileController extends GetxController {
  var trustScore = 64.5.obs;
  var contributions = 96.obs;
  var membership = 'NOBLE'.obs;
}

class ChatsController extends GetxController {
  final chatItems = [
    "List of Student Lodging in Abia S...",
    "Hotels Near Me",
    "3 Bedroom Apartment, Lekki",
  ];
}

class LodgeController extends GetxController {
  final lodge = LodgeModel(
    name: 'Victoria Lodge',
    location: 'Uturu, Abia',
    trustScore: '89%',
    description: 'Located off-campus, this property offers a unique living space with access to solar-powered electricity, providing an alternative power source. Water access is reliable, ensuring daily convenience. The property uses a gas cooker for cooking...',
    rating: 4.3,
    minPrice: 150000,
    maxPrice: 170000,
    amenities: ['Intermittent Light', 'Water', 'Solar Power', '2 max. occupants', 'Gas Cooker'],
    distance: '6–19 min',
    caretaker: 'Caretaker - Victoria',
    phone: '+234 810 123 0129',
  ).obs;
}



class CaretakerController extends GetxController {
  final caretaker = CaretakerModel(
    name: 'Caretaker - Victoria Lodge',
    trustScore: 52,
    rating: 3.9,
    reviewsCount: 3,
    about:
    'A hands-off caretaker known among past tenants for being difficult to reach and slow to respond to maintenance issues. '
        'He insists on full annual rent payment upfront and is known to increase rent unexpectedly without prior notice. '
        'Tenants have reported that he often neglects key repairs, leaving plumbing, wiring, and sanitation issues unresolved for weeks.',
    traits: [
      'Unresponsive to tenant complaints',
      'Poor property maintenance habits',
      'Avoids written agreements or documentation',
      'Disrespectful or dismissive during disputes',
      'Prioritizes money over tenant comfort',
    ],
  ).obs;
}



class CaretakerController2 extends GetxController {
  final caretaker = CaretakerModel(
    name: 'Victoria Lodge',
    trustScore: 89,
    rating: 4.3,
    reviewsCount: 29,
    about: 'No available information yet...',
    traits: [],
  ).obs;
}

final ChatDetailController controller = Get.find(); // NOT Get.put()


