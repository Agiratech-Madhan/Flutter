import 'package:apiwithfactory/models/photomodel.dart';
import 'package:apiwithfactory/provider/photoprovider.dart';
// import 'package:apiwithfactory/widgets/editphoto.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController titlecontroller = TextEditingController();
  final TextEditingController idcontroller = TextEditingController();
  late Future<Photos> _futureAlbum;
  late Future<Photo> _album;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<PhotoProvider>(context, listen: false).getvalues();
  }

  @override
  Widget build(BuildContext context) {
    final providervalue = Provider.of<PhotoProvider>(
      context,
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('api'),
        actions: [
          IconButton(
              onPressed: () async {
                await showdialogue(context, providervalue, 0);
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: Center(
          child: (providervalue.photodata != null)
              ? ListView.builder(
                  itemCount: providervalue.photodata!.photos!.length,
                  itemBuilder: ((context, index) => ListTile(
                        leading: Text(providervalue
                            .photodata!.photos![index].title
                            .toString()),
                        trailing: IconButton(
                            onPressed: () async {
                              print(providervalue.photodata!.photos![index]);
                              int? ids =
                                  providervalue.photodata!.photos![index].id;
                              await showdialogue(context, providervalue, ids);
                            },
                            icon: Icon(Icons.edit)),
                      )),
                )
              : CircularProgressIndicator()),
    );
  }

  showdialogue(
      BuildContext context, PhotoProvider providervalue, int? ids) async {
    showDialog(
        context: (context),
        builder: ((context) => AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: titlecontroller,
                        decoration: const InputDecoration(
                          hintText: 'Enter Title',
                        ),
                      ),
                      TextField(
                        controller: idcontroller,
                        decoration: const InputDecoration(
                          hintText: 'Enter id',
                        ),
                      ),
                    ],
                  ),
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Cancel')),
                        TextButton(
                            onPressed: () async {
                              Photo photonew = Photo(
                                  title: titlecontroller.text,
                                  id: int.parse(idcontroller.text));
                              if (ids == 0) {
                                // providervalue
                                providervalue.createAlbum(
                                    photonew, idcontroller.text);
                              } else {
                                Photo photosdd =
                                    Photo(title: titlecontroller.text);
                                await providervalue.updateAlbum(photosdd, ids!);
                              }

                              idcontroller.text = '';
                              titlecontroller.text = '';
                              return Navigator.of(context).pop();
                            },
                            child: Text('Okay'))
                      ],
                    )
                  ],
                )

            //  EditPhoto(id: id!,)

            ));
  }
}
