import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../provider/movie_list_provider.dart';

class StackWidget extends StatefulWidget {
  const StackWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  State<StackWidget> createState() => _StackWidgetState();
}

class _StackWidgetState extends State<StackWidget> {
  Color coloValue = Colors.amber;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MovieListProvider>(context);
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://image.tmdb.org/t/p/w185/${provider.movies?.item[widget.index].posterPath}')),
              borderRadius: BorderRadius.circular(20)),
          margin: const EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width * 0.7,
          height: MediaQuery.of(context).size.height * 0.6,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.7,
          margin: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
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
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Chip(
                          backgroundColor: coloValue,
                          labelStyle: const TextStyle(
                              fontSize: 17, color: Colors.black),
                          label: Text(
                              'IMDB ${provider.movies?.item[widget.index].voteAverage}'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
