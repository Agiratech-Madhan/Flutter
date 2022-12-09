import 'package:flutter/material.dart';
import '../../../../provider/movie_list_provider.dart';
import 'package:provider/provider.dart';
// import '../../routes/routes.dart' as route;
import 'package:video_player/video_player.dart';

class VideoPlayerPage extends StatelessWidget {
  const VideoPlayerPage({
    Key? key,
    required VideoPlayerController controller,
  })  : _controller = controller,
        super(key: key);

  final VideoPlayerController _controller;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.8,
      child: VideoPlayer(_controller),
    );
  }
}
