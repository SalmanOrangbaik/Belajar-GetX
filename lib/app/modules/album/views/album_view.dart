import 'package:belajar_getx/app/data/models/post_model.dart';
import 'package:belajar_getx/app/modules/album/controllers/album_controller.dart';
import 'package:belajar_getx/app/modules/album/views/album_detail_view.dart';
import 'package:belajar_getx/app/modules/post/views/post_detail_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/album_controller.dart';

class AlbumView extends StatelessWidget {
  final AlbumController controller = Get.put(AlbumController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Album (GetX + GetConnect)")),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (controller.albums.isEmpty) {
          return Center(
            child: Text("No posts available"),
          );
        }
        return ListView.builder(
          itemCount: controller.albums.length,
          itemBuilder: (context, index) {
            final album = controller.albums[index];
            return Card(
              margin: EdgeInsets.all(8),
              child: ListTile(
                title: Text("User Id: ${album.userId}"),
                subtitle: Text(
                  "Id: ${album.id}\n title: ${album.title}",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                onTap: () {
                  //pindah ke detail view
                  Get.to(() => AlbumDetailView(
                        albumModel: album,
                      ));
                },
              ),
            );
          },
        );
      }),
    );
  }
}
