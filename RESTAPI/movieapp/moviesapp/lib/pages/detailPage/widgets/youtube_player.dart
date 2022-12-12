// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePage extends StatefulWidget {
  const YoutubePage({
    Key? key,
    required this.youtubeKey,
  }) : super(key: key);
  final String? youtubeKey;

  @override
  State<YoutubePage> createState() => _YoutubePageState();
}

class _YoutubePageState extends State<YoutubePage> {
  YoutubePlayerController? controller;
  bool empty = false;

  void loadVideo(String value) async {
    controller = YoutubePlayerController(
        initialVideoId: value,
        flags: const YoutubePlayerFlags(
            autoPlay: false, mute: true, isLive: false));
  }

  @override
  void initState() {
    String? videoId = widget.youtubeKey;
    loadVideo(videoId!);

    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: controller!,
          showVideoProgressIndicator: true,
        ),
        builder: (context, player) {
          return player;
        });
  }
}
