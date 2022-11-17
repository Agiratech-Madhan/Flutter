import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restapicrud/models/Info_model.dart';
import '../providers/detailsprovider.dart';

class EditScreen extends StatefulWidget {
  static const routeName = '/edit-screen';

  const EditScreen({super.key});
  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  User _editedUser =
      User(id: '', name: '', email: '', password: '', phoneNo: '');

  Map initValue = {'name': '', 'email': '', 'password': '', 'phoneNo': ''};
  bool isLoading = false;
  Future<void> _save(bool isadd) async {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState!.save();
    setState(() {
      isLoading = true;
    });
    if (isadd) {
      await Provider.of<DetailsProvider>(context, listen: false)
          .addUser(_editedUser);
    } else {
      await Provider.of<DetailsProvider>(context, listen: false)
          .updateUser(_editedUser.id!, _editedUser);
    }
    setState((() {
      isLoading = false;
    }));
  }

  bool _isInit = true;
  dynamic uservalues;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      uservalues =
          ModalRoute.of(context)!.settings.arguments as Map<String, Object>;

      if (uservalues['id'] != '') {
        _editedUser = Provider.of<DetailsProvider>(context, listen: false)
            .findById(uservalues['id']);
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
    return Scaffold(
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : SingleChildScrollView(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
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
                                        const InputDecoration(hintText: 'Name'),
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
                                    decoration: const InputDecoration(
                                        hintText: 'email'),
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
                                    decoration: const InputDecoration(
                                        hintText: 'password'),
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
                                    decoration: const InputDecoration(
                                        hintText: 'Phone'),
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
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Cancel')),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 10),
                                      child: ElevatedButton(
                                          onPressed: () {
                                            _save(uservalues['isAdd']);
                                            Navigator.pop(context);
                                          },
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
