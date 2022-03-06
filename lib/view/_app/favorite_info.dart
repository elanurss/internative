import 'package:flutter/material.dart';
import '../home/model/blog_response_model.dart';

class FavoriteInfo extends ChangeNotifier {
  int favCount = 0;
  List<BlogData> favList = [];
  List<bool> homeFavList = [];

  void addFavCount() {
    favCount++;
    notifyListeners();
  }

  void removeFavCount() {
    if (favCount > 0) favCount--;
    notifyListeners();
  }

  void addFavList(BlogData data) {
    favList.add(data);
    notifyListeners();
  }

  void removeFavList(BlogData data) {
    favList.remove(data);
    notifyListeners();
  }

  void addHomeFavList(List<BlogData> data) {
    for (var item in data) {
      homeFavList.add(false);
    }
    notifyListeners();
  }
}
