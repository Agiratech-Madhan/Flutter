import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restapicrud/models/Info_model.dart';
import 'package:restapicrud/screens/editScreen.dart';
import '../providers/detailsprovider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;
  @override
  void initState() {
    isLoading = true;
    Provider.of<DetailsProvider>(context, listen: false).fetchusers();
    // Provider.of<DetailsProvider>(context, listen: false).getpost();
    isLoading = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userValues = Provider.of<DetailsProvider>(
      context,
    );
    print(userValues);
    // print('${userValues.users[0].password}');
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('data'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => EditScreen(),
                  ));
                },
                icon: const Icon(Icons.add))
          ],
        ),
        body: isLoading
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount: userValues.users.length,
                itemBuilder: ((context, index) => ListTile(
                      title: Text('${userValues.users[index].name}'),
                      subtitle: Text('${userValues.users[index].email}'),
                      trailing:
                          Text(userValues.users[index].phoneNo.toString()),
                    ))));
  }
}
