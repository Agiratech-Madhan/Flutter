import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:movieapp/provider/movie_list_provider.dart';

class WidgetBody extends StatefulWidget {
  final int? index;
  final bool? isextent;
  const WidgetBody({
    Key? key,
    required this.index,
    required this.isextent,
  }) : super(key: key);

  @override
  State<WidgetBody> createState() => _WidgetBodyState();
}

class _WidgetBodyState extends State<WidgetBody> {
  final coloValue = Colors.amber;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MovieListProvider>(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [
                    if (widget.isextent!)
                      Container(
                        height: MediaQuery.of(context).size.height * 0.6,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w185/${provider.movies?.item[widget.index!].posterPath}'))),
                      ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 6.0),
                          child: Chip(
                            backgroundColor: coloValue,
                            labelStyle: const TextStyle(
                                fontSize: 14, color: Colors.black),
                            label: Text(
                                'IMDB ${provider.movies?.item[widget.index!].voteAverage}'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Icon(
                            Icons.star,
                            size: 30,
                            color: coloValue,
                          ),
                        ),
                        Text(
                          '${provider.movies?.item[widget.index!].voteAverage}',
                          style: TextStyle(
                              color: coloValue,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 0),
                          child: Text(
                            ' (${(provider.movies?.item[widget.index!].popularity)!.round()}K reviews)',
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
                      '${provider.movies?.item[widget.index!].title}',
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 25),
                      child: SizedBox(
                        // height: 135,
                        child: Text(
                          '${provider.movies?.item[widget.index!].overview}',
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
    );
  }
}
