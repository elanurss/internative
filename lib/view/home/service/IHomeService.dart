import '../model/category_response_model.dart';
import '../model/blog_response_model.dart';

abstract class IHomeService {
  Future<CategoryModel?> fetchCategories();
  Future<BlogModel?> fetchBlogs(String? categoryId);
}
