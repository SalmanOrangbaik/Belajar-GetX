import 'package:belajar_getx/app/modules/produk/controllers/produk_controller.dart';
import 'package:belajar_getx/app/modules/produk/views/output_produk_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TokoView extends GetView<ProdukController> {
  const TokoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Form Penjualan Produk"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                // Nama Produk
                TextField(
                  controller: controller.namaBarangC,
                  decoration: const InputDecoration(
                    labelText: "Nama Produk",
                    prefixIcon: Icon(Icons.shopping_bag),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),

                // Jumlah
                TextField(
                  controller: controller.jumlahC,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Jumlah",
                    prefixIcon: Icon(Icons.format_list_numbered),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),

                // Harga
                TextField(
                  controller: controller.hargaC,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Harga per Unit",
                    prefixIcon: Icon(Icons.price_change),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),

                // Kategori
                Obx(() => DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        labelText: "Kategori Produk",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.category),
                      ),
                      value: controller.selectedKategori.value.isEmpty
                          ? null
                          : controller.selectedKategori.value,
                      items: controller.kategoriList.map((kategori) {
                        return DropdownMenuItem(
                          value: kategori,
                          child: Text(kategori),
                        );
                      }).toList(),
                      onChanged: (value) {
                        controller.selectedKategori.value = value!;
                      },
                    )),
                const SizedBox(height: 24),

                // Tombol Simpan
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.calculate),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 218, 217, 217),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      controller.hitungTotal();
                      Get.to(() => const ProdukOutput());
                    },
                    label: const Text(
                      "Hitung & Lihat Hasil",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
