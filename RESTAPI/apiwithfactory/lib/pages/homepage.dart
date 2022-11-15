import 'package:apiwithfactory/models/photomodel.dart';
import 'package:apiwithfactory/provider/photoprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController titlecontroller = TextEditingController();
  final TextEditingController idcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('api'),
      ),
      body: Center(
        child: FutureBuilder<Photos>(
          future: Provider.of<PhotoProvider>(context).loadphoto(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data!.photos![0].title);
              return ListView.builder(
                itemBuilder: ((context, index) => ListTile(
                      leading: Text(snapshot.data!.photos![index].title!),
                      trailing: Icon(Icons.edit),
                    )),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
