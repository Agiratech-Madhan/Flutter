import 'package:apiexample/providers/photo_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PhotoExample extends StatefulWidget {
  const PhotoExample({super.key});

  @override
  State<PhotoExample> createState() => _PhotoExampleState();
}

class _PhotoExampleState extends State<PhotoExample> {
  @override
  void initState() {
    // TODO: implement initState

    Provider.of<PhotoProvider>(context, listen: false).getvalues();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final photosData = Provider.of<PhotoProvider>(context);
    print('photosData${photosData}');
    print('photosDataLen${photosData.photodata!.photos!.length}');
    print('photosDataLen${photosData.photodata!.photos![0].albumId}');

    return const Scaffold(
      body: Center(
        child: Text('data'),
      ),
    );
  }
}
