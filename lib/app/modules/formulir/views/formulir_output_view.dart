// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/formulir_controller.dart';
import 'formulir_view.dart';

class FormulirOutputView extends StatelessWidget {
  FormulirOutputView({Key? key}) : super(key: key);

  final FormulirController controller = Get.find<FormulirController>();
  final Color accentColor = Colors.blue[700]!; // warna aksen

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text('Hasil Formulir'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Data Anda',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800]),
            ),
            SizedBox(height: 20),
            _buildCard(title: 'Nama', value: controller.nameController.text),
            _buildCard(title: 'Kursus', value: controller.selectedCourse.value),
            _buildCard(title: 'Tanggal Lahir', value: controller.formattedDate),
            _buildCard(title: 'Gender', value: controller.gender.value),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                controller.clearForm();
                Get.off(() => FormulirView());
              },
              child: Text('Kembali'),
              style: ElevatedButton.styleFrom(
                backgroundColor: accentColor,
                padding: EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({required String title, required String value}) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Row(
        children: [
          Icon(Icons.info_outline, color: accentColor),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey[800])),
                SizedBox(height: 4),
                Text(value.isEmpty ? '-' : value,
                    style: TextStyle(color: Colors.grey[900])),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
