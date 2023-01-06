import 'package:app/feature/bookmark/bookmark_page_model.dart';
import 'package:app/model/resource.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class BookmarkPageView extends BasePageViewWidget<BookmarkViewModel> {
  BookmarkPageView(ProviderBase<BookmarkViewModel> model) : super(model);

  @override
  Widget build(BuildContext context, BookmarkViewModel model) {
    return AppStreamBuilder<Resource<List<JokeDetails>>>(
        stream: model.bookmarkedJokeResponse,
        initialData: Resource.none(),
        dataBuilder: (context, data) {
          return PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: data!.data!.length,
            itemBuilder: (contex, index) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Card(
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(data!.data![index].type == 'single'
                            ? data!.data![index].joke
                            : data!.data![index].setup),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Visibility(
                            visible: data!.data![index].type == 'twopart',
                            child: Text(data!.data![index].delivery)),
                      ),
                    ],
                  ),
                ),),
              );
            },
          );
        });
  }
}
