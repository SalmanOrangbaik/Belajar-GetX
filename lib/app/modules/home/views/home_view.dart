import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> menuItems = [
      {
        "title": "Formulir",
        "icon": Icons.note_alt,
        "route": "/formulir",
        "color": Colors.blueAccent,
      },
      {
        "title": "Counter",
        "icon": Icons.add_circle,
        "route": "/counter",
        "color": Colors.green,
      },
      {
        "title": "Produk",
        "icon": Icons.shopping_cart,
        "route": "/produk",
        "color": Colors.orange,
      },
      {
        "title": "Post",
        "icon": Icons.description,
        "route": "/post",
        "color": Colors.grey,
      },
      {
        "title": "Album",
        "icon": Icons.collections,
        "route": "/album",
        "color": Colors.lightBlueAccent,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Utama'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: menuItems.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            final item = menuItems[index];
            final Color cardColor = item["color"] as Color;

            return GestureDetector(
              onTap: () => Get.toNamed(item["route"] as String),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 4,
                color: cardColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      item["icon"] as IconData,
                      size: 50,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      item["title"] as String,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
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
