import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../constant/constant.dart';

class favourite extends StatefulWidget {
  const favourite({super.key});

  @override
  State<favourite> createState() => _favouriteState();
}

class _favouriteState extends State<favourite> {
  final FavoritesController controller = Get.put(FavoritesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
    child: SafeArea(
    child: Padding(
    padding: const EdgeInsets.only(left: 16, top: 16),
    child: Text(
    'Favorites',
    style: TextStyle(
    color: Colors.white,
    fontSize: 24,
    fontWeight: FontWeight.bold,
    ),
    ),
    ),
    ),
    ),
    body: Obx(() {
    return ListView.builder(
    padding: const EdgeInsets.all(16),
    itemCount: controller.favorites.length,
    itemBuilder: (context, index) {
    final item = controller.favorites[index];
    return Padding(
    padding: const EdgeInsets.only(bottom: 16),
    child: Container(
    decoration: BoxDecoration(
    color: Color(0xFF2C2C2E),
    borderRadius: BorderRadius.circular(16),
    ),
    child: ListTile(
    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
    leading: Container(height: 40, width: 40, decoration: BoxDecoration(color: Colors.black87,borderRadius: BorderRadius.circular(10)),child: Icon(Icons.bookmark, color: Colors.indigoAccent)),
    title: Text(
    item['title']!,
    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
    overflow: TextOverflow.ellipsis,
    ),
    subtitle: Text(
    item['subtitle']!,
    style: TextStyle(color: Colors.grey),
    ),
    trailing: GestureDetector(
    onTap: () => controller.removeFavorite(index),
    child: CircleAvatar(
    radius: 14,
    backgroundColor: Colors.red,
    child: Icon(Icons.close, size: 16, color: Colors.white),
    ),
    ),
    ),
    ),
    );
    },
    );
    }
    ),);
  }
}
