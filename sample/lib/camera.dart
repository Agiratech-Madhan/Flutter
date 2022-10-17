//  import 'dart:io';
import 'package:flutter/material.dart';
//  import 'package:image_cropper/image_cropper.dart';
//  import 'package:image_picker/image_picker.dart';

//  class CameraExample extends StatefulWidget {

//   @override
//   _CameraExampleState createState() => _CameraExampleState();
//  }

//  class _CameraExampleState extends State<CameraExample> {
//   late File pickedImage;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Demo"),),
//       body: Column(
//         children: [
//           Container(
//             margin: EdgeInsets.all(29),
//             child: Center(
//               //button to open camera or gallery
//               child: ElevatedButton(
//                 onPressed: ()=> { openDialog },
//                 child: Text("Picture"),
//               ),
//             ),
//           ),

//           //to show the selected image
//           Container(
//             child:   pickedImage != null
//                 ? ClipRRect(
//               borderRadius: BorderRadius.circular(50),
//               child: Image.file(
//                 pickedImage,
//                 width: 100,
//                 height: 100,
//                 fit: BoxFit.fitHeight,
//               ),
//             ) : null
//           ),

//         ],
//       ),
//     );
//   }

//   //show a dialog to open camera or from gallary
//   void openDialog(BuildContext context){
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         content: Column(
//           children: [
//             ListTile(
//               title: Text("Open Camera"),
//               onTap: () {OpenPicker(ImageSource.camera);} ,
//             ),
//             ListTile(
//               title: Text("Take From Gallery"),
//               onTap: () {OpenPicker(ImageSource.gallery);} ,
//             ),
//           ],
//         ),
//       )
//     );

//   }

//   //open picker after selectiong option
//   OpenPicker(ImageSource source) async {
//     pickedImage = (await ImagePicker.pickImage(source: source)) as File;
//     Navigator.pop(context);
//   }

//   //image cropper method

//   _cropImage(File picked) async {
//     File cropped = await ImageCropper.cropImage(
//       androidUiSettings: AndroidUiSettings(
//         toolbarTitle: "Crop Image",
//         statusBarColor: Colors.red,
//         toolbarColor: Colors.red,

//         toolbarWidgetColor: Colors.white,
//       ),
//       sourcePath: picked.path,
//       aspectRatioPresets: [
//         CropAspectRatioPreset.original,
//         CropAspectRatioPreset.ratio4x3,
//         CropAspectRatioPreset.ratio3x2,
//         CropAspectRatioPreset.ratio16x9,

//       ],
//       maxHeight: 100,
//       maxWidth: 100,

//     );
//     if (cropped != null) {
//       setState(() {
//         _pickedImage = cropped;
//         print("profilePath" + _pickedImage.toString());

//       });
//     }
//   }
//  }

class CameraExample extends StatefulWidget {
  const CameraExample({super.key});

  @override
  State<CameraExample> createState() => _CameraExampleState();
}

class _CameraExampleState extends State<CameraExample> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
