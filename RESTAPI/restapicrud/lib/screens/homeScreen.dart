import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restapicrud/models/info_model.dart';
import 'package:restapicrud/models/custom_exception.dart';
import '../providers/detailsprovider.dart';
import '../routes/routes.dart' as route;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<User>>? futureUser;
  bool isLoading = false;
  bool isadd = true;
  bool isedit = true;
  // Users? users;
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), () {
      futureUser =
          Provider.of<DetailsProvider>(context, listen: false).fetchusers();
    });
    super.initState();
  }

  void showMessage(String message) {
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

  @override
  Widget build(BuildContext context) {
    final userValues = Provider.of<DetailsProvider>(
      context,
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('API'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(route.editUser, arguments: {
                  'id': '',
                  'isAdd': true,
                  'showMessage': showMessage
                });
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: FutureBuilder(
        future: futureUser,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: ((context, index) => ListTile(
                    title: Text('${snapshot.data![index].name}'),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('${snapshot.data![index].email}'),
                        const Padding(
                          padding: EdgeInsets.only(left: 8.0),
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
                                final id =
                                    userValues.users[index].id.toString();
                                Navigator.of(context).pushNamed(route.editUser,
                                    arguments: {
                                      'id': id,
                                      'isAdd': false,
                                      'showMessage': showMessage
                                    });
                              },
                              icon: const Icon(Icons.edit)),
                          IconButton(
                              color: Colors.red,
                              onPressed: () async {
                                try {
                                  await userValues.deleteUser(
                                      userValues.users[index].id.toString());
                                } on CustomException catch (e) {
                                  showMessage(e.toString());
                                }
                              },
                              icon: const Icon(Icons.delete)),
                        ],
                      ),
                    ),
                  )),
            );
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error occured in server'));
          } else if (snapshot.data == null) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              const Center(
                child: Text('No Data found'),
              );
            }
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).pushNamed(route.editUser,
              arguments: {'id': '', 'isAdd': true, 'showMessage': showMessage});
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
