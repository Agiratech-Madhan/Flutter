import 'package:apiwithfactory/models/custom_exception.dart';
import 'package:apiwithfactory/models/photomodel.dart';
import 'package:apiwithfactory/provider/photoprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditPage extends StatefulWidget {
  String? existtitle;
  int? ids;
  int? exisId;
  Function? showMessage;
  EditPage(
      {super.key,
      this.existtitle,
      this.ids,
      this.exisId,
      required this.showMessage});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  // void showMessage(BuildContext context, String message) {
  //   print('object');
  //   // showDialog(
  //   //   context: context,
  //   //   builder: (context) => AlertDialog(
  //   //     content: Text(message),
  //   //     actions: [
  //   //       TextButton(
  //   //           onPressed: () => Navigator.of(context).pop(), child: Text('Okay'))
  //   //     ],
  //   //   ),
  //   // );
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text(message),
  //       duration: const Duration(seconds: 2),
  //       action: SnackBarAction(
  //         textColor: Colors.blue,
  //         label: 'OKAY',
  //         onPressed: () {},
  //       ),
  //     ),
  //   );
  // }

  final TextEditingController titlecontroller = TextEditingController();

  final TextEditingController idcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final providervalue = Provider.of<PhotoProvider>(
      context,
    );
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: titlecontroller,
            decoration: InputDecoration(
              labelText: widget.existtitle,
              hintText: 'Enter Title',
            ),
          ),
          if (widget.ids != 0)
            TextField(
              controller: idcontroller,
              decoration: InputDecoration(
                labelText: (widget.ids != 0) ? widget.exisId.toString() : null,
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
                  if (widget.ids == 0) {
                    try {
                      await providervalue.createAlbum(
                          photonew, idcontroller.text);
                      //          idcontroller.text = '';
                      // titlecontroller.text = '';
                    } on CustomException catch (e) {
                      // showMessage(context, e.toString());
                      widget.showMessage!(e.toString());
                    }
                    // Navigator.of(context).pop();
                  } else {
                    try {
                      Photo photosdd = Photo(
                          title: titlecontroller.text,
                          id: int.parse(idcontroller.text));
                      await providervalue.updateAlbum(photosdd, widget.ids!);
                    } on CustomException catch (e) {
                      // showMessage(context, e.toString());
                      widget.showMessage!(e.toString());
                    }
                  }

                  Navigator.of(context).pop();
                },
                child: Text(widget.ids == 0 ? 'Add' : 'Update'))
          ],
        )
      ],
    );
  }
}
