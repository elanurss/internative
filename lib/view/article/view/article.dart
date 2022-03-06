import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:internativeapp/core/base/base_view.dart';
import 'package:internativeapp/core/extension/context_extension.dart';
import 'package:internativeapp/view/home/viewModel/home_view_model.dart';
import '../../home/model/blog_response_model.dart';

class ArticleDetail extends StatefulWidget {
  final BlogData blogData;
  const ArticleDetail({
    Key? key,
    required this.blogData,
  }) : super(key: key);

  @override
  State<ArticleDetail> createState() => _ArticleDetailState();
}

class _ArticleDetailState extends State<ArticleDetail> {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
        viewModel: HomeViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (BuildContext context, HomeViewModel model) =>
            _scaffold(context, model));
  }

  Scaffold _scaffold(BuildContext context, HomeViewModel viewModel) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 4,
        title: Text(
          widget.blogData.title!,
          style: context.textTheme.caption!.copyWith(
            fontWeight: FontWeight.w800,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue[50],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Image.network(
                          widget.blogData.image ?? 'Loading...',
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: htmlParse(
                  widget.blogData.content.toString(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget htmlParse(String htmlData) {
    return Html(data: htmlData);
  }
}
