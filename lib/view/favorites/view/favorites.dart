import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:internativeapp/core/constants/image/image_constants.dart';
import 'package:internativeapp/view/favorites/viewModel/favorite_view_model.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import '../../../core/base/base_view.dart';
import '../../../core/extension/context_extension.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return BaseView<FavoriteViewModel>(
        viewModel: FavoriteViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (BuildContext context, FavoriteViewModel model) =>
            _scaffold(context, model));
  }

  Scaffold _scaffold(BuildContext context, FavoriteViewModel viewModel) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 25,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 4,
          title: Text(
            " My Favorites",
            style: context.textTheme.headline6!.copyWith(
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                viewModel.blogData.isEmpty
                    ? SvgPicture.asset(
                        ImageConstants.instance.notfound,
                        width: MediaQuery.of(context).size.width * .7,
                      )
                    : const SizedBox(
                        height: 15,
                      ),
                gridview(context, viewModel),
              ],
            ),
          ),
        ));
  }

  // ignore: non_constant_identifier_names
  Widget gridview(BuildContext context, FavoriteViewModel viewModel) {
    return Observer(builder: (_) {
      return GridView.builder(
          itemCount: viewModel.blogData.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 1.0,
          ),
          shrinkWrap: true,
          primary: false,
          itemBuilder: (context, index) {
            return Material(
                borderRadius: BorderRadius.circular(16),
                elevation: 2,
                child: Stack(children: [
                  Column(children: [
                    Expanded(
                      flex: 4,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(16)),
                        child: Image.network(
                            viewModel.blogData[index].image ?? 'Loading...',
                            fit: BoxFit.cover),
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            viewModel.blogData[index].title ?? 'Loading...',
                            style: context.textTheme.caption!.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        )),
                  ]),
                  buildIcon(viewModel, index)
                ]));
          });
    });
  }

  buildIcon(FavoriteViewModel viewModel, int index) {
    return Align(
        alignment: Alignment.topRight,
        child: IconButton(
          onPressed: () async {
            setState(() {
              viewModel.removeFavorite(index, viewModel.blogData[index]);
            });
          },
          icon: viewModel.likes[index]
              ? const Icon(
                  Icons.favorite_rounded,
                  color: Colors.red,
                )
              : const Icon(
                  Icons.favorite_border,
                ),
          iconSize: 30,
        ));
  }

  Padding buildShimmer(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Shimmer.fromColors(
        baseColor: Colors.white,
        highlightColor: Colors.grey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 42.05.w,
              height: 10.78.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16), color: Colors.grey),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                "",
                maxLines: 1,
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.headline1,
              ),
            ))
          ],
        ),
      ),
    );
  }
}
