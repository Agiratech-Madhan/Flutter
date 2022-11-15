import 'package:apiwithfactory/models/photomodel.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class EditPhoto extends StatefulWidget {
  static const routeName = '/edit-screen';
  // final int id;
  // EditPhoto({required this.id});
  @override
  State<EditPhoto> createState() => _EditPhotoState();
}

class _EditPhotoState extends State<EditPhoto> {
  final TextEditingController titlecontroller = TextEditingController();
  final TextEditingController idcontroller = TextEditingController();
  late Future<Photos> _futureAlbum;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
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
                                Photo photosdd = Photo(
                                    // id: int.parse(idcontroller.text),
                                    title: titlecontroller.text);
                                setState(() {
                                  // print(
                                  //     'updated values of photo');
                                  // print(photosdd.id);
                                  // print(photosdd.title);
                                  // print(ids);
                                  updateAlbum(photosdd, 6);
                                });
                                // Navigator.of(context)
                                //     .pop();
                              },
                              child: Text('Cancel')),
                          TextButton(onPressed: () {}, child: Text('Okay'))
                        ],
                      )
                    ],
                  )));
        },
        icon: Icon(Icons.edit));
  }
}

// Future<Photo> updateAlbum(Photo photo, int id) async {
//   var x = json.encode(photo.toJson());
//   final response = await http.put(
//     Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: x,
//   );

//   if (response.statusCode == 200) {
//     return Photo.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception('Failed to update album.');
//   }
// }

Future<Photo> updateAlbum(Photo photo, int id) async {
  var x = json.encode(photo.toJson());
  final responses = await http.put(
    Uri.parse('https://jsonplaceholder.typicode.com/albums/6'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: x,
  );
  print(responses.statusCode);
  if (responses.statusCode == 200) {
    print(responses.body);
    return Photo.fromJson(jsonDecode(responses.body));
  } else {
    throw Exception('Failed to update album.');
  }
}
//Photo
///**Album album = Album(
                            // id: int.parse(idcontroller.text),
                            // title: titlecontroller.text);
                            //  */