import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/bookmark/bookmark_page_model.dart';
import 'package:app/feature/bookmark/bookmark_page_view.dart';
import 'package:app/widget/app_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class BookmarkPage extends BasePage<BookmarkViewModel> {
  const BookmarkPage({Key? key}) : super(key: key);

  @override
  BookmarkPageState createState() => BookmarkPageState();
}

class BookmarkPageState
    extends BaseStatefulPage<BookmarkViewModel, BookmarkPage> {
  @override
  ProviderBase<BookmarkViewModel> provideBase() {
    return bookmarkModelProvider;
  }

  @override
  void onModelReady(BookmarkViewModel model) async {
    /*FirebaseFirestore.instance
        .collection('jokes')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        debugPrint("id ${doc["id"].toString()}");
      });
    });*/
    model.getBookmarkedJoke();
  }

  @override
  PreferredSizeWidget? buildAppbar() {
    return AppBarUtil.instance.appBar(context,
        title: "Bookmark List",
        showBookmark: false,
        automaticallyImplyLeading: true);
  }

  @override
  Widget buildView(BuildContext context, BookmarkViewModel model) {
    return BookmarkPageView(provideBase());
  }
}
