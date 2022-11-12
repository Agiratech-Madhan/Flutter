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
  bool isadd = true;
  bool isedit = true;
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
    // print(userValues);
    // print('${userValues.users[1].id}');
    // print('${userValues.users[0].name}');
    // print('${userValues.users[0].password}');
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('data'),
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
            ? CircularProgressIndicator()
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
                            child: Text(
                                userValues.users[index].phoneNo.toString()),
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
                                  // Navigator.of(context).push(MaterialPageRoute(
                                  //   builder: (context) => EditScreen(),
                                  // ));
                                },
                                icon: Icon(Icons.edit)),
                            IconButton(
                                color: Colors.red,
                                onPressed: () {
                                  Provider.of<DetailsProvider>(context,
                                          listen: false)
                                      .deleteUser(userValues.users[index].id
                                          .toString());
                                },
                                icon: Icon(Icons.delete)),
                          ],
                        ),
                      ),
                      //  final productId = ModalRoute.of(context)!.settings.arguments as String;
                      //Navigator.of(context).pushNamed(EditProductScreen.routeName,
                      // arguments: {'id': id, 'isAdd': true});
                      // trailing: Expanded(
                      //   child: Row(
                      //     children: [
                      //       IconButton(
                      //           onPressed: () {}, icon: Icon(Icons.edit)),
                      //     ],
                      //   ),
                      // ),
                    ))));
  }
}
