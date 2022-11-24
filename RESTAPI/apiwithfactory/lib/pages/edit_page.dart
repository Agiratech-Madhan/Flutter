import 'package:apiwithfactory/models/custom_exception.dart';
import 'package:apiwithfactory/models/photomodel.dart';
import 'package:apiwithfactory/provider/photoprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditPage extends StatefulWidget {
  String? existTitle;
  int? ids;
  int? exisId;
  Function? showMessage;
  EditPage(
      {super.key,
      this.existTitle,
      this.ids,
      this.exisId,
      required this.showMessage});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final provideValue = Provider.of<PhotoProvider>(
      context,
    );
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(
              labelText: widget.existTitle,
              hintText: 'Enter Title',
            ),
          ),
          if (widget.ids != 0)
            TextField(
              controller: idController,
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
                    title: titleController.text,
                  );
                  if (widget.ids == 0) {
                    try {
                      await provideValue.createAlbum(
                          photonew, idController.text);
                    } on CustomException catch (e) {
                      widget.showMessage!(e.toString());
                    } finally {
                      Navigator.of(context).pop();
                    }
                  } else {
                    try {
                      Photo photosdd = Photo(
                          title: titleController.text,
                          id: int.parse(idController.text));
                      await provideValue.updateAlbum(photosdd, widget.ids!);
                    } on CustomException catch (e) {
                      widget.showMessage!(e.toString());
                    } finally {
                      Navigator.of(context).pop();
                    }
                  }
                },
                child: Text(widget.ids == 0 ? 'Add' : 'Update'))
          ],
        )
      ],
    );
  }
}
