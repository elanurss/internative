import 'package:flutter/material.dart';
import 'package:internativeapp/core/base/base_view_model.dart';
import 'package:internativeapp/view/_app/favorite_info.dart';
import 'package:mobx/mobx.dart';
import '../../home/model/blog_response_model.dart';
import 'package:provider/provider.dart';
part 'favorite_view_model.g.dart';

class FavoriteViewModel = _FavoriteViewModelBase with _$FavoriteViewModel;

abstract class _FavoriteViewModelBase with Store, BaseViewModel {
  BuildContext? context;

  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {
    getFavList();
  }

  @observable
  List<BlogData> blogData = [];

  @observable
  List<bool> likes = [];

  @action
  removeFavorite(int index, BlogData data) {
    likes[index] = false;
    Provider.of<FavoriteInfo>(context!, listen: false).removeFavCount();
    Provider.of<FavoriteInfo>(context!, listen: false).removeFavList(data);
    Provider.of<FavoriteInfo>(context!, listen: false).homeFavList[index] =
        false;
  }

  getFavList() {
    final response = Provider.of<FavoriteInfo>(context!).favList;
    blogData = response;
    setFavoriteIcon(blogData);
  }

  setFavoriteIcon(List<BlogData> blogList) {
    for (var item in blogList) {
      likes.add(true);
    }
  }
}
