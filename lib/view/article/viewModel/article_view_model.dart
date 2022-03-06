import 'package:flutter/material.dart';
import 'package:internativeapp/core/base/base_view_model.dart';
import 'package:mobx/mobx.dart';
part 'article_view_model.g.dart';

class ArticleViewModel = _ArticleViewModelBase with _$ArticleViewModel;

abstract class _ArticleViewModelBase with Store, BaseViewModel {
  BuildContext? context;

  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  void init() {}
}
