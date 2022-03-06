import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:internativeapp/core/init/navigation/navigation_service.dart';
import 'package:internativeapp/view/_app/favorite_info.dart';
import 'package:internativeapp/view/home/model/category_response_model.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/base/base_view.dart';
import '../../../core/extension/context_extension.dart';
import '../viewModel/home_view_model.dart';
import 'package:sizer/sizer.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final String _defultImage = '';

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
          leading: IconButton(
            onPressed: () {},
            icon: Image.asset("assets/images/search.png"),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 4,
          title: Text(
            " Home",
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
                _topHeader(context, viewModel),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      " Blog",
                      style: context.textTheme.headline6!.copyWith(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                gridview(context, viewModel),
              ],
            ),
          ),
        ));
  }

  Widget _topHeader(BuildContext context, HomeViewModel viewModel) {
    return Observer(builder: (_) {
      return viewModel.isLoading
          ? Center(child: _circularProgress())
          : SizedBox(
              width: double.infinity,
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: viewModel.categoryList.length,
                itemBuilder: (context, index) {
                  return listArray(
                      context, viewModel.categoryList[index], viewModel);
                },
              ));
    });
  }

  Center _buildCircularProgres() => const Center(
        child: CircularProgressIndicator(),
      );

  CircularProgressIndicator _circularProgress() =>
      const CircularProgressIndicator();

  // ignore: non_constant_identifier_names
  Widget gridview(BuildContext context, HomeViewModel viewModel) {
    return Observer(builder: (_) {
      return viewModel.isBlogLoading
          ? _buildCircularProgres()
          : GridView.builder(
              itemCount: viewModel.blogList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 1.0,
              ),
              shrinkWrap: true,
              primary: false,
              itemBuilder: (context, index) {
                return InkWell(
                  hoverColor: Colors.black,
                  onTap: () => NavigationService.instance.navigateToPage(
                      path: '/detail', data: viewModel.blogList[index]),
                  child: Material(
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
                                  viewModel.blogList[index].image ??
                                      'Loading...',
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  viewModel.blogList[index].title ??
                                      'Loading...',
                                  style: context.textTheme.caption!.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              )),
                        ]),
                        buildIcon(viewModel, index)
                      ])),
                );
              });
    });
  }

  buildIcon(HomeViewModel viewModel, int index) {
    return Observer(builder: (_) {
      return Align(
          alignment: Alignment.topRight,
          child: IconButton(
            onPressed: () {
              setState(() {
                viewModel.toggleFavorite(index, viewModel.blogList[index]);
              });
            },
            icon: Provider.of<FavoriteInfo>(context).homeFavList[index]
                ? const Icon(
                    Icons.favorite_rounded,
                    color: Colors.red,
                  )
                : const Icon(
                    Icons.favorite_border,
                  ),
            iconSize: 30,
          ));
    });
  }

  Widget listArray(BuildContext context, Data data, HomeViewModel viewModel) {
    return Observer(builder: (_) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => viewModel.blogOfCategory(data.id!),
            child: Container(
              height: 100,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                  image: DecorationImage(
                      image: NetworkImage(data.image ?? _defultImage),
                      fit: BoxFit.cover)),
              margin: const EdgeInsets.only(right: 5),
            ),
          ),
          const SizedBox(height: 5),
          Text(data.title ?? '')
        ],
      );
    });
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
