// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  final _$isLoadingAtom = Atom(name: '_HomeViewModelBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$isBlogLoadingAtom = Atom(name: '_HomeViewModelBase.isBlogLoading');

  @override
  bool get isBlogLoading {
    _$isBlogLoadingAtom.reportRead();
    return super.isBlogLoading;
  }

  @override
  set isBlogLoading(bool value) {
    _$isBlogLoadingAtom.reportWrite(value, super.isBlogLoading, () {
      super.isBlogLoading = value;
    });
  }

  final _$categoryListAtom = Atom(name: '_HomeViewModelBase.categoryList');

  @override
  List<Data> get categoryList {
    _$categoryListAtom.reportRead();
    return super.categoryList;
  }

  @override
  set categoryList(List<Data> value) {
    _$categoryListAtom.reportWrite(value, super.categoryList, () {
      super.categoryList = value;
    });
  }

  final _$blogListAtom = Atom(name: '_HomeViewModelBase.blogList');

  @override
  List<BlogData> get blogList {
    _$blogListAtom.reportRead();
    return super.blogList;
  }

  @override
  set blogList(List<BlogData> value) {
    _$blogListAtom.reportWrite(value, super.blogList, () {
      super.blogList = value;
    });
  }

  final _$likesAtom = Atom(name: '_HomeViewModelBase.likes');

  @override
  List<bool> get likes {
    _$likesAtom.reportRead();
    return super.likes;
  }

  @override
  set likes(List<bool> value) {
    _$likesAtom.reportWrite(value, super.likes, () {
      super.likes = value;
    });
  }

  final _$favoriteCountAtom = Atom(name: '_HomeViewModelBase.favoriteCount');

  @override
  int get favoriteCount {
    _$favoriteCountAtom.reportRead();
    return super.favoriteCount;
  }

  @override
  set favoriteCount(int value) {
    _$favoriteCountAtom.reportWrite(value, super.favoriteCount, () {
      super.favoriteCount = value;
    });
  }

  final _$_HomeViewModelBaseActionController =
      ActionController(name: '_HomeViewModelBase');

  @override
  dynamic toggleFavorite(int index, BlogData data) {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.toggleFavorite');
    try {
      return super.toggleFavorite(index, data);
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isLoadingChange() {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.isLoadingChange');
    try {
      return super.isLoadingChange();
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isBlogLoadingChange() {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.isBlogLoadingChange');
    try {
      return super.isBlogLoadingChange();
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isBlogLoading: ${isBlogLoading},
categoryList: ${categoryList},
blogList: ${blogList},
likes: ${likes},
favoriteCount: ${favoriteCount}
    ''';
  }
}
