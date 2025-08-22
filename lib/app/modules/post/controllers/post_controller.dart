import 'package:belajar_getx/app/data/models/post_model.dart';
import 'package:get/get.dart';

class PostController extends GetxController {
  var posts = <PostModel>[].obs;
  RxBool isLoading = true.obs;

  final GetConnect getConnect = GetConnect();

  Future<List<PostModel>> fetchPosts() async {
    final response =
        await getConnect.get("https:/jsonplaceholder.typicode.com/posts");

    if (response.status.hasError) {
      return Future.error(response.statusText ?? "Error fetching Posts");
    } else {
      final List<dynamic> data = response.body;
      return data.map((e) => PostModel.fromJson(e)).toList();
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
      posts.assignAll(result);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }
}
