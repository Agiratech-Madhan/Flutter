import 'package:apiwithfactory/models/custom_exception.dart';

import '../models/photomodel.dart';
import '../provider/photoprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController titlecontroller = TextEditingController();
  final TextEditingController idcontroller = TextEditingController();
  bool isLoading = false;
  void loadData() async {
    try {
      await Provider.of<PhotoProvider>(context, listen: false).getvalues();
    } on CustomException catch (e) {
      showMessage(e.toString());
    } finally {
      isLoading = false;
    }
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
          textColor: Colors.blue,
          label: 'OKAY',
          onPressed: () {},
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    isLoading = true;
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    final providervalue = Provider.of<PhotoProvider>(
      context,
    );
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('API EXAMPLE'),
          actions: [
            IconButton(
                onPressed: () async {
                  await showdialogue(context, providervalue, 0);
                },
                icon: const Icon(Icons.add))
          ],
        ),
        body: Center(
            child: (isLoading)
                ? const CircularProgressIndicator()
                : ListView.builder(
                    itemCount: providervalue.photodata?.photos!.length,
                    itemBuilder: ((context, index) => ListTile(
                          leading: Text(
                              '${providervalue.photodata?.photos![index].id}'),
                          title: Text(
                            '${providervalue.photodata?.photos![index].title}',
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                  onPressed: () async {
                                    int? ids = providervalue
                                        .photodata?.photos![index].id;
                                    await showdialogue(
                                        context, providervalue, ids);
                                  },
                                  icon: const Icon(Icons.edit)),
                              IconButton(
                                  onPressed: () {
                                    int? ids = providervalue
                                        .photodata?.photos![index].id;
                                    providervalue.deleteUser(ids!);
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ))
                            ],
                          ),
                        )),
                  )));
  }

  Future<void> showdialogue(
      BuildContext context, PhotoProvider providervalue, int? ids) async {
    int photodataIndex = providervalue.photodata!.photos!
        .indexWhere((element) => element.id == ids);
    int? exisId;
    String? existtitle;
    if (ids != 0) {
      existtitle = providervalue.photodata?.photos![photodataIndex].title;
      exisId = providervalue.photodata?.photos![photodataIndex].id;
    } else {}
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
                if (ids != 0)
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
                      child: const Text('Cancel')),
                  TextButton(
                      onPressed: () async {
                        Photo photonew = Photo(
                          title: titlecontroller.text,
                        );
                        if (ids == 0) {
                          providervalue.createAlbum(
                              photonew, idcontroller.text);
                        } else {
                          Photo photosdd = Photo(
                              title: titlecontroller.text,
                              id: int.parse(idcontroller.text));
                          providervalue.updateAlbum(photosdd, ids!);
                        }
                        idcontroller.text = '';
                        titlecontroller.text = '';
                        Navigator.of(context).pop();
                      },
                      child: Text(ids == 0 ? 'Add' : 'Update'))
                ],
              )
            ],
          )),
    );
  }
}
