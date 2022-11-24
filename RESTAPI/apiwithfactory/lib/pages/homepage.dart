import 'package:apiwithfactory/models/custom_exception.dart';
import 'package:apiwithfactory/pages/edit_page.dart';

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
  bool isLoading = false;
  void loadData() async {
    try {
      await Provider.of<PhotoProvider>(context, listen: false).getvalues();
    } on CustomException catch (e) {
      showMessage(e.toString());
    } finally {
      isLoading = false;
    }
    isLoading = false;
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
                                  onPressed: () async {
                                    int? ids = providervalue
                                        .photodata?.photos![index].id;
                                    try {
                                      await providervalue.deleteUser(ids!);
                                    } on CustomException catch (e) {
                                      showMessage(e.toString());
                                    }
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
    String? existTitle;
    if (ids != 0) {
      existTitle = providervalue.photodata?.photos![photodataIndex].title;
      exisId = providervalue.photodata?.photos![photodataIndex].id;
    }
    showDialog(
      context: context,
      builder: ((context) => EditPage(
            existTitle: existTitle,
            ids: ids,
            exisId: exisId,
            showMessage: (String message) {
              showMessage(message);
            },
          )),
    );
  }
}
