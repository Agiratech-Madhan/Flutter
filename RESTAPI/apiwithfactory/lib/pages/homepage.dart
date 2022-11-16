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
                        leading: Text(providervalue.photodata!.photos![index].id
                            .toString()),
                        title: Text(
                          providervalue.photodata!.photos![index].title
                              .toString(),
                          // softWrap: true,
                          // textWidthBasis: TextWidthBasis.parent
                        ),
                        trailing: Row(
                          // mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                onPressed: () async {
                                  print(
                                      providervalue.photodata!.photos![index]);
                                  int? ids = providervalue
                                      .photodata!.photos![index].id;
                                  await showdialogue(
                                      context, providervalue, ids);
                                },
                                icon: Icon(Icons.edit)),
                            IconButton(
                                onPressed: () {
                                  int? ids = providervalue
                                      .photodata!.photos![index].id;

                                  providervalue.deleteUser(ids!);
                                },
                                icon: Icon(Icons.delete))
                          ],
                        ),
                      )),
                )
              : CircularProgressIndicator()),
    );
  }

  showdialogue(
      BuildContext context, PhotoProvider providervalue, int? ids) async {
    final photodataIndex = providervalue.photodata!.photos!
        .indexWhere((element) => element.id == ids);
    int? exisId;
    String? existtitle;
    if (ids != 0) {
      existtitle = providervalue.photodata!.photos![photodataIndex].title;
      exisId = providervalue.photodata!.photos![photodataIndex].id;
    } else {}
    // print(providervalue.photodata!.photos![photodataIndex].title);
    // print(providervalue.photodata!.photos![photodataIndex].id);
    showDialog(
        context: (context),
        builder: ((context) => AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: titlecontroller,
                        decoration: InputDecoration(
                          labelText: existtitle,
                          hintText: 'Enter Title',
                        ),
                      ),
                      TextField(
                        controller: idcontroller,
                        decoration: InputDecoration(
                          labelText: (ids != 0) ? exisId.toString() : null,
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
