import 'package:apiwithfactory/models/custom_exception.dart';

import '../provider/photoprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'show_dialog.dart';

class HomePage extends StatefulWidget {
  final ShowDialog sample;
  const HomePage({required this.sample, super.key});

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
    // isLoading = false;
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
                  await widget.sample.showdialogue(context, providerValue, 0);
                },
                icon: const Icon(Icons.add))
          ],
        ),
        body: Center(
            child: (isLoading && providerValue.photoData == null)
                ? const CircularProgressIndicator()
                : (!isLoading && providerValue.photoData == null)
                    ? const Center(
                        child: Text('No data found'),
                      )
                    : ListView.builder(
                        itemCount: providerValue.photoData?.photos!.length,
                        itemBuilder: ((context, index) => ListTile(
                              leading: Text(
                                  '${providerValue.photoData?.photos![index].id}'),
                              title: Text(
                                '${providerValue.photoData?.photos![index].title}',
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                      onPressed: () async {
                                        int? ids = providerValue
                                            .photoData?.photos![index].id;
                                        await widget.sample.showdialogue(
                                            context, providerValue, ids);
                                      },
                                      icon: const Icon(Icons.edit)),
                                  IconButton(
                                      onPressed: () async {
                                        int? ids = providerValue
                                            .photoData?.photos![index].id;
                                        try {
                                          await providerValue.deleteUser(ids!);
                                        } on CustomException catch (e) {
                                          widget.sample.showMessage(
                                              context, e.toString());
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
