import 'package:belajar_getx/app/data/models/album_model.dart';
import 'package:flutter/material.dart';

class AlbumDetailView extends StatelessWidget {
  final AlbumModel albumModel;

  const AlbumDetailView({super.key, required this.albumModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Album #${albumModel.id}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              albumModel.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              "User ID: ${albumModel.userId}",
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
