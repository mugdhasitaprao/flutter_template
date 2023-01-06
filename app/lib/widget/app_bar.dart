import 'package:app/navigation/route_paths.dart';
import 'package:flutter/material.dart';

class AppBarUtil {
  AppBarUtil._privateConstructor();

  static final AppBarUtil _instance = AppBarUtil._privateConstructor();

  static AppBarUtil get instance {
    return _instance;
  }

  AppBar appBar(BuildContext context,
      {bool automaticallyImplyLeading = false, String title= '',bool showBookmark = false}) {
    return AppBar(
      title: Text(title),
      automaticallyImplyLeading: automaticallyImplyLeading,
      elevation: 5.0,
      actions:  [
        Visibility(
          visible: showBookmark,
          child: InkWell(
            onTap: (){
              Navigator.pushNamed(context, RoutePaths.bookmarkList);
            },
            child: const Icon(
              Icons.bookmark,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
        const SizedBox(width: 10,)
      ],
    );
  }
}
