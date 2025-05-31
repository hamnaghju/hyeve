import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/controllers.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  final FavoritesController controller = Get.put(FavoritesController());

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight * 0.18),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              left: 16,
              top: screenHeight * 0.03,
              bottom: screenHeight * 0.02,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Favourite',
                style: GoogleFonts.manrope(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Obx(() {
        return controller.favorites.isEmpty
            ? Center(
          child: Text(
            "No favorites yet.",
            style: GoogleFonts.manrope(
              textStyle: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        )
            : ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          itemCount: controller.favorites.length,
          itemBuilder: (context, index) {
            final item = controller.favorites[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: const Color(0xFF2C2C2E),
                borderRadius: BorderRadius.circular(16),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                leading: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.bookmark, color: Colors.indigoAccent),
                ),
                title: Text(
                  item['title']!,
                  style: GoogleFonts.manrope(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 19,
                      color: Colors.white,
                    ),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(
                  item['subtitle']!,
                  style: GoogleFonts.manrope(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                ),
                trailing: GestureDetector(
                  onTap: () => controller.removeFavorite(index),
                  child: const CircleAvatar(
                    radius: 14,
                    backgroundColor: Colors.red,
                    child: Icon(Icons.close, size: 16, color: Colors.white),
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
