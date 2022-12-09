// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chewie/chewie.dart';

import 'package:movieapp/models/video_model.dart';
import 'package:movieapp/pages/detailPage/widgets/video_player.dart';

import '../../../provider/movie_list_provider.dart';
import '../../routes/routes.dart' as route;
import 'package:video_player/video_player.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    Key? key,
    required this.index,
    required this.id,
  }) : super(key: key);
  final int index;
  final int id;
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Color coloValue = Colors.amber;
  late VideoPlayerController _controller;
  Videos? videos;

  Future<void> loadVData() async {
    print(widget.id);
    videos = await Provider.of<MovieListProvider>(context, listen: false)
        .loadVideo(widget.id);
    print(videos?.item[0].keyValue);
  }

  ChewieController? chewiController;
  //  'https://www.youtube.com/watch?v=${videos.item[index].}')
//https://www.youtube.com/embed/1ozGKlOzEVc"
  //  'https://www.youtube.com/watch?v=${videos?.item[0].keyValue}'
//
//https://youtu.be/te59zBWKXQI

  @override
  void initState() {
    super.initState();
    loadVData();
    _controller = VideoPlayerController.network(
// https://www.youtube.com/embed/1ozGKlOzEVc"

        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..initialize();
    chewiController = ChewieController(
        looping: true,
        aspectRatio: 0.7,
        videoPlayerController: _controller,
        autoInitialize: true);
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MovieListProvider>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back)),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _controller.value.isInitialized
                      ? AspectRatio(
                          aspectRatio: 0.7,
                          child: Chewie(controller: chewiController!),
                        )
                      : const AspectRatio(
                          aspectRatio: 0.8,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Chip(
                              backgroundColor: coloValue,
                              labelStyle: const TextStyle(
                                  fontSize: 16, color: Colors.black),
                              label: Text(
                                  'IMDB ${provider.movies?.item[widget.index].voteAverage}'),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Icon(
                              Icons.star,
                              size: 30,
                              color: coloValue,
                            ),
                          ),
                          Text(
                            '${provider.movies?.item[widget.index].voteAverage}',
                            style: TextStyle(
                                color: coloValue,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text(
                              ' (${(provider.movies?.item[widget.index].popularity)!.round()}K reviews)',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          )
                          // const Spacer(),
                        ],
                      ),
                      Text(
                        '${provider.movies?.item[widget.index].title}',
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 25),
                        child: SizedBox(
                          // height: 135,
                          child: Text(
                            '${provider.movies?.item[widget.index].overview}',
                            style: const TextStyle(
                                fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            // print(_controller.value.isPlaying);
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
