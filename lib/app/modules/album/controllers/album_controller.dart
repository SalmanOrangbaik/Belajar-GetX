import 'package:belajar_getx/app/data/models/album_model.dart';
import 'package:get/get.dart';

class AlbumController extends GetxController {
  var albums = <AlbumModel>[].obs;
  RxBool isLoading = true.obs;

  final GetConnect getConnect = GetConnect();

  Future<List<AlbumModel>> fetchPosts() async {
    final response =
        await getConnect.get("https:/jsonplaceholder.typicode.com/albums");

    if (response.status.hasError) {
      return Future.error(response.statusText ?? "Error fetching Albums");
    } else {
      final List<dynamic> data = response.body;
      return data.map((e) => AlbumModel.fromJson(e)).toList();
    }
  }

  @override
  void onInit() {
    super.onInit();
    getPosts();
  }

  void getPosts() async {
    try {
      isLoading;
      var result = await fetchPosts();
      albums.assignAll(result);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }
}
