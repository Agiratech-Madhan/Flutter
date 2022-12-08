// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:movieapp/provider/movie_list_provider.dart';
import 'package:provider/provider.dart';
import '../../routes/routes.dart' as route;

class DetailPage extends StatefulWidget {
  const DetailPage({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Color coloValue = Colors.amber;

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
                  Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://image.tmdb.org/t/p/w185/${provider.movies?.item[widget.index].posterPath}')),
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
                                  fontSize: 17, color: Colors.black),
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
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            ' (${(provider.movies?.item[widget.index].popularity)!.round()}K reviews)',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
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
    );
  }
}
