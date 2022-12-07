// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:movieapp/pages/movie_stack.dart';
import 'package:movieapp/provider/movie_list_provider.dart';

import '../routes/routes.dart' as route;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<MovieListProvider>(context, listen: false).load();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MovieListProvider>(context);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black54,
        // extendBodyBehindAppBar: true,
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: ListTile(
              title: RichText(
                  text: const TextSpan(children: [
                TextSpan(text: 'Hello ', style: TextStyle(fontSize: 20)),
                TextSpan(text: 'Flutter', style: TextStyle(fontSize: 20)),
              ])),
              subtitle: const Text(
                'data',
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
              trailing: const CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://image.shutterstock.com/mosaic_250/287881/1768126784/stock-photo-young-handsome-man-with-beard-wearing-casual-sweater-and-glasses-over-blue-background-happy-face-1768126784.jpg')),
            )),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Search',
                    // border: ,

                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    filled: true,
                    fillColor: Colors.grey.withOpacity(0.7),
                    prefixIconColor: Colors.red,
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    suffixIcon: const Icon(Icons.mic_none_rounded),
                    suffixIconColor: Colors.grey),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
              child: Text(
                'Featured Movies',
                style: TextStyle(color: Colors.white, fontSize: 20),
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
                            Navigator.of(context)
                                .pushNamed(route.detailPage, arguments: {
                              'index': index,
                            });
                          },
                          child: StackWidget(
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
