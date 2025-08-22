import 'package:belajar_getx/app/modules/produk/controllers/produk_controller.dart';
import 'package:belajar_getx/app/modules/produk/views/produk_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProdukOutput extends GetView<ProdukController> {
  const ProdukOutput({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Hasil Penjualan"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Obx(
          () => Column(
            children: [
              // Card Informasi Produk
              Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Detail Produk",
                          style: Theme.of(context).textTheme.titleLarge),
                      const Divider(),
                      ListTile(
                        leading: const Icon(Icons.shopping_bag),
                        title: const Text("Nama Produk"),
                        subtitle: Text(controller.namaBarangC.text),
                      ),
                      ListTile(
                        leading: const Icon(Icons.category),
                        title: const Text("Kategori"),
                        subtitle: Text(controller.selectedKategori.value),
                      ),
                      ListTile(
                        leading: const Icon(Icons.format_list_numbered),
                        title: const Text("Jumlah"),
                        subtitle: Text(controller.jumlahC.text),
                      ),
                      ListTile(
                        leading: const Icon(Icons.price_change),
                        title: const Text("Harga per Unit"),
                        subtitle: Text("Rp${controller.hargaC.text}"),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Card Total
              Card(
                color: Colors.deepPurple[50],
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        "Ringkasan Pembayaran",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple[800],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Total Sebelum Diskon"),
                          Text(
                            "Rp${controller.totalSebelumDiskon.value.toStringAsFixed(0)}",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Total Setelah Diskon"),
                          Text(
                            "Rp${controller.totalSetelahDiskon.value.toStringAsFixed(0)}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),

              // Tombol Aksi
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    icon: const Icon(Icons.arrow_back),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                    onPressed: () {
                      Get.off(() => const TokoView());
                    },
                    label: const Text("Kembali"),
                  ),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.refresh),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent),
                    onPressed: () {
                      controller.resetForm();
                      Get.off(() => const TokoView());
                    },
                    label: const Text("Reset Form"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
