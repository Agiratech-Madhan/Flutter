import 'package:apiwithfactory/models/custom_exception.dart';
import 'package:apiwithfactory/pages/edit_page.dart';

import '../models/photomodel.dart';
import '../provider/photoprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'show_dialog.dart';

class HomePage extends StatefulWidget {
  // ShowDialog? sample;
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;
  void loadData() async {
    try {
      await Provider.of<PhotoProvider>(context, listen: false).getvalues();
    } on CustomException catch (e) {
      ShowDialog().showMessage(context, e.toString());
    } finally {
      isLoading = false;
    }
    isLoading = false;
  }

  @override
  void initState() {
    super.initState();
    isLoading = true;
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    final providerValue = Provider.of<PhotoProvider>(
      context,
    );
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('API EXAMPLE'),
          actions: [
            IconButton(
                onPressed: () async {
                  await ShowDialog().showdialogue(context, providerValue, 0);
                },
                icon: const Icon(Icons.add))
          ],
        ),
        body: Center(
            child: (isLoading)
                ? const CircularProgressIndicator()
                : ListView.builder(
                    itemCount: providerValue.photodata?.photos!.length,
                    itemBuilder: ((context, index) => ListTile(
                          leading: Text(
                              '${providerValue.photodata?.photos![index].id}'),
                          title: Text(
                            '${providerValue.photodata?.photos![index].title}',
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                  onPressed: () async {
                                    int? ids = providerValue
                                        .photodata?.photos![index].id;
                                    // await showdialogue(context, providerValue, ids)
                                    await ShowDialog().showdialogue(
                                        context, providerValue, ids);
                                  },
                                  icon: const Icon(Icons.edit)),
                              IconButton(
                                  onPressed: () async {
                                    int? ids = providerValue
                                        .photodata?.photos![index].id;
                                    try {
                                      await providerValue.deleteUser(ids!);
                                    } on CustomException catch (e) {
                                      ShowDialog()
                                          .showMessage(context, e.toString());
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
}
