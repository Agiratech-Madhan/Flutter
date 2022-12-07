import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movieapp/provider/movie_list_provider.dart';
import 'package:provider/provider.dart';

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
    print('id value${provider.movies?.item[0].id}');
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('${provider.movies?.item[0].id}'),
      ),
    );
  }
}
