import 'package:apiwithfactory/pages/edit_page.dart';
import 'package:apiwithfactory/provider/photoprovider.dart';
import 'package:flutter/material.dart';

class ShowDialog {
  void showMessage(BuildContext context, String message) {
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

  Future<void> showdialogue(
      BuildContext context, PhotoProvider providerValue, int? ids) async {
    int photodataIndex = providerValue.photodata!.photos!
        .indexWhere((element) => element.id == ids);
    int? exisId;
    String? existTitle;
    if (ids != 0) {
      existTitle = providerValue.photodata?.photos![photodataIndex].title;
      exisId = providerValue.photodata?.photos![photodataIndex].id;
    }
    showDialog(
      context: context,
      builder: ((context) => EditPage(
            existTitle: existTitle,
            ids: ids,
            exisId: exisId,
            showMessage: (String message) {
              showMessage(context, message);
            },
          )),
    );
  }
}
