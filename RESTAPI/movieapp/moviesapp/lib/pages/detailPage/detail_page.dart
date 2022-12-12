// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:movieapp/pages/detailPage/body_page.dart';
import 'package:movieapp/pages/detailPage/widgets/youtube_player.dart';
import 'package:provider/provider.dart';
import 'package:movieapp/models/video_model.dart';
import '../../../provider/movie_list_provider.dart';

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
  Videos? videos;
  String? keyValue;
  FlexibleSpaceBarSettings? setting;
  Future<void> loadVData() async {
    videos = await Provider.of<MovieListProvider>(context, listen: false)
        .loadVideo(widget.id);
  }

  double? heightValue;

  @override
  void initState() {
    loadVData();
    super.initState();
  }

  bool isextent = false;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MovieListProvider>(context);
    return Scaffold(
        backgroundColor: Colors.black,
        body: CustomScrollView(slivers: [
          SliverAppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              centerTitle: true,
              expandedHeight: 200.0,
              floating: true,
              pinned: true,
              flexibleSpace: LayoutBuilder(
                builder: (p0, p1) {
                  var top = p1.biggest.height;
                  if (top < 150) {
                    isextent = true;
                  } else {
                    isextent = false;
                  }
                  heightValue = p1.biggest.height;

                  return FlexibleSpaceBar(
                    centerTitle: true,
                    background: Visibility(
                      visible: videos?.item[0].keyValue != null,
                      child: YoutubePage(
                        youtubeKey: videos?.item[0].keyValue,
                      ),
                    ),
                  );
                },
              )),
          SliverLayoutBuilder(builder: (p0, p1) {
            return SliverFillRemaining(
              child: WidgetBody(
                isextent: isextent,
                index: widget.index,
              ),
            );
          })
        ]));
  }
}
