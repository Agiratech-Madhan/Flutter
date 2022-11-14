import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/editScreen.dart';
import '../providers/detailsprovider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;
  bool isadd = true;
  bool isedit = true;
  @override
  void initState() {
    super.initState();
    isLoading = true;

    Provider.of<DetailsProvider>(context, listen: false).fetchusers();
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    final userValues = Provider.of<DetailsProvider>(
      context,
    );
    // print(userValues.users[0].phoneNo);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('API'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(EditScreen.routeName,
                    arguments: {'id': '', 'isAdd': true});
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: isLoading
          ? const CircularProgressIndicator()
          : ListView.builder(
              itemCount: userValues.users.length,
              itemBuilder: ((context, index) => ListTile(
                    title: Text('${userValues.users[index].name}'),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('${userValues.users[index].email}'),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          // child: Text(userValues.users[index].phoneNo!),
                        )
                      ],
                    ),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(
                              color: Colors.blue,
                              onPressed: () {
                                print(
                                    'id of edited product${userValues.users[index].id}');
                                final id =
                                    userValues.users[index].id.toString();
                                Navigator.of(context).pushNamed(
                                    EditScreen.routeName,
                                    arguments: {'id': id, 'isAdd': false});
                              },
                              icon: Icon(Icons.edit)),
                          IconButton(
                              color: Colors.red,
                              onPressed: () {
                                Provider.of<DetailsProvider>(context,
                                        listen: false)
                                    .deleteUser(
                                        userValues.users[index].id.toString());
                              },
                              icon: Icon(Icons.delete)),
                        ],
                      ),
                    ),
                  )),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).pushNamed(EditScreen.routeName,
              arguments: {'id': '', 'isAdd': true});
        },
        label: Row(
          children: const [
            Icon(Icons.add),
            Text(' ADD'),
          ],
        ),
      ),
    );
  }
}
