import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:internativeapp/core/constants/enums/preferences_key_enum.dart';
import 'package:internativeapp/core/init/cache/locale_manager.dart';
import 'package:internativeapp/view/home/model/blog_response_model.dart';
import '../../../core/constants/enums/network_enum.dart';
import '../model/category_response_model.dart';
import 'IHomeService.dart';

class HomeService extends IHomeService {
  @override
  Future<CategoryModel?> fetchCategories() async {
    final response =
        await http.get(Uri.parse(NetworkUrl.GetCategories.rawValue), headers: {
      "Content-Type": "application/json",
      'Accept': 'application/json',
      'Authorization':
          'Bearer ${LocaleManager.instance.getStringValue(PreferencesKeys.TOKEN)}',
    });

    if (response.statusCode == 200) {
      return categoryModelFromJson(response.body);
    }
  }

  @override
  Future<BlogModel?> fetchBlogs(String? categoryId) async {
    Map data = {"CategoryId": categoryId};

    String body = json.encode(data);
    final response = await http.post(Uri.parse(NetworkUrl.GetBlogs.rawValue),
        headers: {
          "Content-Type": "application/json",
          'Accept': 'application/json',
          'Authorization':
              'Bearer ${LocaleManager.instance.getStringValue(PreferencesKeys.TOKEN)}',
        },
        body: body);

    if (response.statusCode == 200) {
      return blogModelFromJson(response.body);
    }
  }
}
