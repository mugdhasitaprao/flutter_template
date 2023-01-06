import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/home/home_page_model.dart';
import 'package:app/feature/home/home_page_view.dart';
import 'package:app/widget/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class HomePage extends BasePage<HomeViewModel> {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends BaseStatefulPage<HomeViewModel, HomePage> {
  @override
  ProviderBase<HomeViewModel> provideBase() {
    return homeViewModelProvider;
  }

  @override
  void onModelReady(HomeViewModel model) async {
    model.getJoke();
  }

  @override
  PreferredSizeWidget? buildAppbar() {
    return AppBarUtil.instance.appBar(context,
        title: 'Joke App',
        automaticallyImplyLeading: false,
        showBookmark: true);
  }

  @override
  Widget buildView(BuildContext context, HomeViewModel model) {
    return HomePageView(provideBase());
  }
}
