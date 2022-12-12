// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movieapp/models/video_model.dart';
import '../../models/movie_model.dart';
import '../homePage/widgets/movie_stack.dart';
import 'package:provider/provider.dart';

import '../../provider/movie_list_provider.dart';
import '../../../routes/routes.dart' as route;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Movies? movies;
  // TextEditingController controller = TextEditingController();
  bool isSearch = false;

  Future<void> loadData() async {
    movies = await Provider.of<MovieListProvider>(context, listen: false)
        .loadData('');
  }

  @override
  void initState() {
    FocusManager.instance.primaryFocus?.unfocus();
    super.initState();
    loadData();
    // loadVData();
  }

  @override
  void dispose() {
    FocusManager.instance.primaryFocus?.unfocus();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MovieListProvider>(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black54,
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: ListTile(
              title: RichText(
                  text: const TextSpan(children: [
                TextSpan(
                    text: 'Hello ',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                TextSpan(text: 'Flutter', style: TextStyle(fontSize: 20)),
              ])),
              subtitle: const Text(
                'The art of api',
                style: TextStyle(color: Colors.grey, fontSize: 17),
              ),
              trailing: const CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://image.shutterstock.com/mosaic_250/287881/1768126784/stock-photo-young-handsome-man-with-beard-wearing-casual-sweater-and-glasses-over-blue-background-happy-face-1768126784.jpg')),
            )),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                child: Autocomplete<MovieData>(
                  optionsBuilder: (textEditingValue) {
                    if (textEditingValue.text == '') {
                      return List.empty();
                    } else {
                      return provider.movies!.item
                          .where((e) =>
                              // print('Madhan${e.title}');
                              e.title!.toLowerCase().contains(
                                  textEditingValue.text.toLowerCase()))
                          .toList();
                    }
                  },
                  fieldViewBuilder: (BuildContext context,
                      TextEditingController controller,
                      FocusNode focusNode,
                      Function onFieldSubmitted) {
                    // this.controller = controller;
                    return TextField(
                      onSubmitted: (value) async {
                        isSearch = true;
                        await provider.loadData(controller.text);

                        isSearch = false;
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      focusNode: focusNode,
                      controller: controller,
                      decoration: InputDecoration(
                          hintText: 'Search',
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          filled: true,
                          fillColor: Colors.grey.withOpacity(0.7),
                          prefixIconColor: Colors.red,
                          prefixIcon: IconButton(
                              onPressed: (() async {
                                isSearch = true;
                                await provider.loadData(controller.text);

                                isSearch = false;
                                FocusManager.instance.primaryFocus?.unfocus();
                              }),
                              icon: const Icon(
                                Icons.search,
                                color: Colors.white,
                              )),
                          suffixIcon: const Icon(
                            Icons.mic_none_rounded,
                            color: Colors.grey,
                          ),
                          suffixIconColor: Colors.grey),
                    );
                  },
                  onSelected: (option) async {
                    try {
                      isSearch = true;
                      await provider.loadData((option.title)!.toLowerCase());
                      FocusManager.instance.primaryFocus?.unfocus();
                      isSearch = false;
                    } catch (e) {
                      throw 'Error Ocuured';
                    }
                  },
                  displayStringForOption: (MovieData d) {
                    return d.title!;
                  },
                )),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 33.0, vertical: 40),
              child: RichText(
                text: const TextSpan(children: [
                  TextSpan(
                      text: 'Featured Movies',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ]),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: (provider.movies == null)
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: (provider.movies?.item.length),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: ((context, index) {
                        return GestureDetector(
                          onTap: () {
                            provider.loadVideo(
                                provider.movies?.item[index].id as int);
                            Navigator.of(context).pushNamed(route.detailPage,
                                arguments: {
                                  'index': index,
                                  'id': provider.movies?.item[index].id
                                });
                          },
                          child: isSearch
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : StackWidget(
                                  index: index,
                                ),
                        );
                      }),
                    ),
            )
          ],
        ));
  }
}
