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

    return Scaffold(
        body: Column(
      children: [
        Expanded(
            child: ListView.builder(
                itemCount: photosData.photodata!.photos!.length,
                itemBuilder: (context, index) => Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          // width: 300,
                          // height: 300,
                          // color: Colors.black54,
                          child: Center(
                              child: Image.network(
                            photosData.photodata!.photos![index].url.toString(),
                          )),
                        ),
                        Positioned(
                          bottom: 10,
                          left: 20,
                          right: 20,
                          child: Row(
                            // crossAxisAlignment: Cross,
                            children: [
                              Container(
                                color: Colors.black54,
                                padding: EdgeInsets.all(5),
                                width: 350,
                                child: Text(
                                    photosData.photodata!.photos![index].title
                                        .toString(),
                                    softWrap: true,
                                    // overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white)),
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          top: 20,
                          left: 20,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                photosData.photodata!.photos![index].id
                                    .toString(),
                                style:
                                    TextStyle(color: Colors.red, fontSize: 30),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 200,
                          height: 200,
                          // color: Colors.black54,
                          child: Image.network(
                              photosData.photodata!.photos![index].thumbnailUrl
                                  .toString(),
                              opacity: AlwaysStoppedAnimation(.9)),
                        ),
                      ],
                    )))
      ],
    ));
  }
}
