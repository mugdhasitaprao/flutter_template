import 'package:app/feature/home/home_page_model.dart';
import 'package:app/model/resource.dart';
import 'package:app/utils/stream_builder/app_stream_builder.dart';
import 'package:app/widget/data_status_widget.dart';
import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class HomePageView extends BasePageViewWidget<HomeViewModel> {
  HomePageView(ProviderBase<HomeViewModel> model) : super(model);

  @override
  Widget build(BuildContext context, HomeViewModel model) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: AppStreamBuilder<Resource<JokeDetails>>(
        initialData: Resource.none(),
        stream: model.jokeResponse,
        dataBuilder: (context, data) {
          return DataStatusWidget(
              status: data?.status ?? Status.none,
              loadingWidget: () {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                  ),
                );
              },
              errorWidget: () {
                return Column(
                  children: [
                    const Text("Something went wrong"),
                    ElevatedButton(
                        onPressed: () {
                          model.getJoke();
                        },
                        child: const Text("Reload"))
                  ],
                );
              },
              successWidget: () {
                return Card(
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Text(data!.data!.type == 'single'
                                    ? data!.data!.joke
                                    : data!.data!.setup),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Visibility(
                                    visible: data!.data!.type == 'twopart',
                                    child: Text(data!.data!.delivery)),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  model.bookmarkJoke(data.data);
                                },
                                child: AppStreamBuilder<bool>(
                                    stream: model.bookmarkJokeResponse,
                                    initialData: false,
                                    dataBuilder: (context, bookmarkData) {
                                      var bookmarked = bookmarkData;
                                      return bookmarked!
                                          ? const Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                              size: 30,
                                            )
                                          : const Icon(
                                              Icons.star_border_outlined,
                                              color: Colors.grey,
                                              size: 30,
                                            );
                                    }),
                              ),
                              SizedBox(width: 10,),
                              ElevatedButton(
                                onPressed: () {
                                  model.getJoke();
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(), //<-- SEE HERE
                                  padding: EdgeInsets.all(10),
                                ),
                                child: const Icon(
                                  Icons.refresh,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
