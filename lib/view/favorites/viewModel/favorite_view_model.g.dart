// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FavoriteViewModel on _FavoriteViewModelBase, Store {
  final _$blogDataAtom = Atom(name: '_FavoriteViewModelBase.blogData');

  @override
  List<BlogData> get blogData {
    _$blogDataAtom.reportRead();
    return super.blogData;
  }

  @override
  set blogData(List<BlogData> value) {
    _$blogDataAtom.reportWrite(value, super.blogData, () {
      super.blogData = value;
    });
  }

  final _$likesAtom = Atom(name: '_FavoriteViewModelBase.likes');

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

  final _$_FavoriteViewModelBaseActionController =
      ActionController(name: '_FavoriteViewModelBase');

  @override
  dynamic removeFavorite(int index, BlogData data) {
    final _$actionInfo = _$_FavoriteViewModelBaseActionController.startAction(
        name: '_FavoriteViewModelBase.removeFavorite');
    try {
      return super.removeFavorite(index, data);
    } finally {
      _$_FavoriteViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
blogData: ${blogData},
likes: ${likes}
    ''';
  }
}
