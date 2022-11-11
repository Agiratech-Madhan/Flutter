import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restapicrud/models/Info_model.dart';
import 'package:restapicrud/providers/detailsprovider.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  User _editedUser = User(name: '', email: '', password: '', phoneNo: 0);

  Map initValue = {'name': '', 'email': '', 'password': '', 'phoneNo': ''};
  bool isLoading = false;
  Future<void> _save() async {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState!.save();
    setState(() {
      // print('update product');
      isLoading = true;
    });
    Provider.of<DetailsProvider>(context, listen: false)
        .addUser(_editedUser)
        .then((value) => setState((() {
              isLoading = false;
            })));

    Navigator.pop(context);
  }

  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.50,
                child: Card(
                  child: Form(
                      key: _form,
                      child: ListView(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(hintText: 'Name'),
                            initialValue: initValue['name'],
                            keyboardType: TextInputType.name,
                            onSaved: (newValue) {
                              _editedUser = User(
                                name: newValue,
                                email: _editedUser.email,
                                password: _editedUser.password,
                                phoneNo: _editedUser.phoneNo,
                                id: _editedUser.id,
                              );
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'please enter value';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(hintText: 'email'),
                            initialValue: initValue['email'],
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (newValue) {
                              _editedUser = User(
                                name: _editedUser.name,
                                email: newValue,
                                password: _editedUser.password,
                                phoneNo: _editedUser.phoneNo,
                                id: _editedUser.id,
                              );
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'please enter value';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(hintText: 'password'),
                            initialValue: initValue['password'],
                            keyboardType: TextInputType.visiblePassword,
                            onSaved: (newValue) {
                              _editedUser = User(
                                name: _editedUser.name,
                                email: _editedUser.email,
                                password: newValue,
                                phoneNo: _editedUser.phoneNo,
                                id: _editedUser.id,
                              );
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'please enter value';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(hintText: 'Phone'),
                            initialValue: initValue['phoneNo'],
                            keyboardType: TextInputType.number,
                            onSaved: (newValue) {
                              _editedUser = User(
                                name: _editedUser.name,
                                email: _editedUser.email,
                                password: _editedUser.password,
                                phoneNo: int.parse(newValue!),
                                id: _editedUser.id,
                              );
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'please enter value';
                              }
                              return null;
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Cancel')),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 10),
                                  child: ElevatedButton(
                                      onPressed: _save, child: Text('Save')),
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
                ),
              ),
      ),
    );
  }
}
