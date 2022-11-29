import 'package:apiwithfactory/models/custom_exception.dart';
import 'package:apiwithfactory/models/photomodel.dart';
import 'package:apiwithfactory/provider/photoprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditPage extends StatefulWidget {
  String? existTitle;
  String? ids;
  String? exisId;
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
  // var uuid = Uuid();

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
          if (widget.ids != '0')
            TextField(
              controller: idController,
              decoration: InputDecoration(
                labelText: (widget.ids != '0') ? widget.exisId.toString() : '0',
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
                  // print('sam ${uuid.v1()}');
                  Photo photonew = Photo(
                    title: titleController.text,
                  );
                  Photo photosdd =
                      Photo(title: titleController.text, id: idController.text);
                  Photo photoMethod = (widget.ids == '0') ? photonew : photosdd;
                  try {
                    await provideValue.createAndUpdate(
                        photoMethod, widget.ids!.toString());
                  } on CustomException catch (e) {
                    widget.showMessage!(e.toString());
                  } finally {
                    Navigator.of(context).pop();
                  }
                },
                child: Text(widget.ids == '0' ? 'Add' : 'Update'))
          ],
        )
      ],
    );
  }
}
