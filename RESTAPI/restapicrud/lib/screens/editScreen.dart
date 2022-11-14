// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restapicrud/models/Info_model.dart';
import '../providers/detailsprovider.dart';

class EditScreen extends StatefulWidget {
  static const routeName = '/edit-screen';
  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  // bool? isAdd;
  User _editedUser =
      User(id: '', name: '', email: '', password: '', phoneNo: '');

  Map initValue = {'name': '', 'email': '', 'password': '', 'phoneNo': ''};
  bool isLoading = false;
  Future<void> _save(bool isadd) async {
    print('save called');
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState!.save();
    setState(() {
      // print('update product');
      isLoading = true;
    });
    if (isadd) {
      await Provider.of<DetailsProvider>(context, listen: false)
          .addUser(_editedUser);
    } else {
      print('editorUser');
      print('editoruser Id${_editedUser.id}');
      print('editoruser name${_editedUser.name}');
      print('editoruser email${_editedUser.email}');
      print('editoruser passwrod${_editedUser.password}');
      await Provider.of<DetailsProvider>(context, listen: false)
          .updateUser(_editedUser.id!, _editedUser);
    }
    setState((() {
      isLoading = false;
    }));
    Navigator.pop(context);
  }

  bool _isInit = true;
  var uservalues;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      uservalues =
          ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
      print('diddependency called');
      print(uservalues['id']);
      if (uservalues['id'] != '') {
        _editedUser = Provider.of<DetailsProvider>(context, listen: false)
            .findById(uservalues['id']);
        print(_editedUser.phoneNo);
        initValue = {
          'name': _editedUser.name,
          'email': _editedUser.email,
          'password': _editedUser.password,
          'phoneNo': _editedUser.phoneNo,
        };
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  final _form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    print(' edit screen${_editedUser.id}');
    return Scaffold(
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : SingleChildScrollView(
                child: SizedBox(
                  // padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width * 0.8,
                  // height: MediaQuery.of(context).size.height * 0.50,
                  child: Card(
                    child: Form(
                        key: _form,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextFormField(
                                    decoration:
                                        InputDecoration(hintText: 'Name'),
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
                                    decoration:
                                        InputDecoration(hintText: 'email'),
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
                                      if (value!.isEmpty ||
                                          !(value.contains('@'))) {
                                        return 'please enter value';
                                      }
                                      return null;
                                    },
                                  ),
                                  TextFormField(
                                    decoration:
                                        InputDecoration(hintText: 'password'),
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
                                      // print(value?.contains('@'));

                                      if (value!.isEmpty) {
                                        return 'please enter value';
                                      }

                                      return null;
                                    },
                                  ),
                                  TextFormField(
                                    decoration:
                                        InputDecoration(hintText: 'Phone'),
                                    initialValue: initValue['phoneNo'],
                                    keyboardType: TextInputType.number,
                                    onSaved: (newValue) {
                                      _editedUser = User(
                                        name: _editedUser.name,
                                        email: _editedUser.email,
                                        password: _editedUser.password,
                                        phoneNo: newValue!,
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
                                ],
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
                                          onPressed: () =>
                                              _save(uservalues['isAdd']),
                                          child: Text(uservalues['isAdd']
                                              ? 'Save'
                                              : 'Update')),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )),
                  ),
                ),
              ),
      ),
    );
  }
}
