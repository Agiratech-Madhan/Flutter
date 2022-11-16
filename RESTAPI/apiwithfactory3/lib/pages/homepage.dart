import '../models/photomodel.dart';
import '../provider/photoprovider.dart';
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
    // Provider.of<PhotoProvider>(context, listen: false).getvalues();
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
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
      ),
      body: Center(
        child: FutureBuilder<Photos>(
          future: providervalue.loadphoto(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(providervalue.photodata!.photos![0].title);
              print(providervalue.photodata!.photos![0].title);
              return ListView.builder(
                itemBuilder: ((context, index) => ListTile(
                      leading:
                          Text(providervalue.photodata!.photos![index].title!),
                      trailing: IconButton(
                          onPressed: () {
                            print(providervalue.photodata!.photos![index]);
                            int? ids =
                                providervalue.photodata!.photos![index].id;
                            showDialog(
                                context: (context),
                                builder: ((context) => AlertDialog(
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              TextField(
                                                controller: titlecontroller,
                                                decoration:
                                                    const InputDecoration(
                                                  hintText: 'Enter Title',
                                                ),
                                              ),
                                              TextField(
                                                controller: idcontroller,
                                                decoration:
                                                    const InputDecoration(
                                                  hintText: 'Enter id',
                                                ),
                                              ),
                                            ],
                                          ),
                                          actions: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text('Cancel')),
                                                TextButton(
                                                    onPressed: () async {
                                                      Photo photosdd = Photo(
                                                          title: titlecontroller
                                                              .text);

                                                      await providervalue
                                                          .updateAlbum(
                                                              photosdd, ids!);

                                                      idcontroller.text = '';
                                                      titlecontroller.text = '';
                                                      return Navigator.of(
                                                              context)
                                                          .pop();
                                                    },
                                                    child: Text('Okay'))
                                              ],
                                            )
                                          ],
                                        )

                                    //  EditPhoto(id: id!,)

                                    ));
                          },
                          icon: Icon(Icons.edit)),
                    )),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
