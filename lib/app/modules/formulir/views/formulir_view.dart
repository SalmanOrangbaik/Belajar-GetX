// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/formulir_controller.dart';
import 'formulir_output_view.dart';

class FormulirView extends StatelessWidget {
  FormulirView({Key? key}) : super(key: key);

  final FormulirController controller = Get.put(FormulirController());

  final Color accentColor = Colors.blue[700]!; // warna aksen lembut

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text('Formulir'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            _buildCard(
              child: TextField(
                controller: controller.nameController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person, color: accentColor),
                  labelText: 'Nama',
                  labelStyle: TextStyle(color: accentColor),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            _buildCard(
              child: Obx(
                () => DropdownButtonFormField<String>(
                  value: controller.selectedCourse.value == ''
                      ? null
                      : controller.selectedCourse.value,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.book, color: accentColor),
                    labelText: 'Pilih Kursus',
                    labelStyle: TextStyle(color: accentColor),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  items: controller.courses
                      .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                      .toList(),
                  onChanged: (value) =>
                      controller.selectedCourse.value = value!,
                ),
              ),
            ),
            SizedBox(height: 16),
            _buildCard(
              child: Obx(
                () => Column(
                  children: [
                    RadioListTile(
                      activeColor: accentColor,
                      title: Text('Laki-laki'),
                      value: 'Laki-laki',
                      groupValue: controller.gender.value,
                      onChanged: (v) => controller.gender.value = v!,
                    ),
                    RadioListTile(
                      activeColor: accentColor,
                      title: Text('Perempuan'),
                      value: 'Perempuan',
                      groupValue: controller.gender.value,
                      onChanged: (v) => controller.gender.value = v!,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            _buildCard(
              child: TextField(
                readOnly: true,
                controller: controller.dateController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.date_range, color: accentColor),
                  labelText: 'Tanggal Lahir',
                  labelStyle: TextStyle(color: accentColor),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onTap: () => controller.pickDate(),
              ),
            ),
            SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.to(() => FormulirOutputView()),
                child: Text('Submit'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: accentColor,
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({required Widget child}) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: child,
    );
  }
}
