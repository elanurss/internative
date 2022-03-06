import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import '../../../core/base/base_view_model.dart';
import '../../_app/favorite_info.dart';
import '../model/blog_response_model.dart';
import '../model/category_response_model.dart';
import '../service/home_service.dart';
part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store, BaseViewModel {
  BuildContext? context;
  HomeService? service;

  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {
    service = HomeService();
    getCategories();
    getAllBlog();
  }

  @observable
  bool isLoading = false;

  @observable
  bool isBlogLoading = false;

  @observable
  List<Data> categoryList = [];

  @observable
  List<BlogData> blogList = [];

  @observable
  List<bool> likes = [];

  @observable
  int favoriteCount = 0;

  @action
  toggleFavorite(int index, BlogData data) {
    Provider.of<FavoriteInfo>(context!, listen: false).homeFavList[index] =
        !Provider.of<FavoriteInfo>(context!, listen: false).homeFavList[index];
    if (Provider.of<FavoriteInfo>(context!, listen: false).homeFavList[index]) {
      Provider.of<FavoriteInfo>(context!, listen: false).addFavCount();
      Provider.of<FavoriteInfo>(context!, listen: false).addFavList(data);
    } else {
      Provider.of<FavoriteInfo>(context!, listen: false).removeFavCount();
      Provider.of<FavoriteInfo>(context!, listen: false).removeFavList(data);
    }
  }

  @action
  void isLoadingChange() => isLoading = !isLoading;

  @action
  void isBlogLoadingChange() => isBlogLoading = !isBlogLoading;

  getCategories() async {
    isLoadingChange();
    final response = await service?.fetchCategories();
    if (response != null) categoryList = response.data!;
    isLoadingChange();
  }

  getAllBlog() async {
    isBlogLoadingChange();
    final response = await service?.fetchBlogs(null);
    if (response != null) {
      blogList = response.data!;
      Provider.of<FavoriteInfo>(context!, listen: false)
          .addHomeFavList(blogList);

      //  setFavoriteIcon(blogList);
    }
    isBlogLoadingChange();
  }

  blogOfCategory(String categoryId) async {
    isBlogLoadingChange();
    final response = await service?.fetchBlogs(categoryId);

    if (response != null) {
      blogList = response.data!;
      setFavoriteIcon(blogList);
    }

    isBlogLoadingChange();
  }

  setFavoriteIcon(List<BlogData> blogList) {
    for (var item in blogList) {
      likes.add(false);
    }
  }
}
