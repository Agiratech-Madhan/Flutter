import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:shopapp/providers/product_provider.dart';
import '../providers/product.dart';
import '../providers/product_provider.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = '/edit-product';

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imgUrlController = TextEditingController();
  final _imgUrlFocusnode = FocusNode();
  final _form = GlobalKey<FormState>();
  var _editedProduct =
      Product(id: 'one', title: '', description: '', price: 0, imageUrl: '');
  var _initValue = {
    'title': '',
    'description': '',
    'price': '',
    'imageUrl': ''
  };
  var _isInit = true;
  var productId;
  @override
  void initState() {
    // TODO: implement initState
    _imgUrlFocusnode.addListener(_updateImgUrl);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if (_isInit) {
      productId =
          ModalRoute.of(context)!.settings.arguments as Map<String, Object>;

      print('productId$productId');
      if (productId['isAdd'] == false) {
        if (productId.isNotEmpty) {
          _editedProduct = Provider.of<Products>(context, listen: false)
              .findById(productId['id'] as String);
          _initValue = {
            'title': _editedProduct.title,
            'price': _editedProduct.price.toString(),
            'description': _editedProduct.description,
            // 'imageUrl':_editedProduct.imageUrl
            'imageUrl': ''
          };
          _imgUrlController.text = _editedProduct.imageUrl;
        }
      }
    }
    _isInit = false;

    super.didChangeDependencies();
  }

  void _updateImgUrl() {
    if (!_imgUrlFocusnode.hasFocus) {
      setState(() {});
      if ((!_imgUrlController.text.startsWith('http') &&
              !_imgUrlController.text.startsWith('htpps')) ||
          (!_imgUrlController.text.endsWith('.png') &&
              !_imgUrlController.text.endsWith('.jpg') &&
              !_imgUrlController.text.endsWith('.jpeg'))) {
        return;
      }
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _imgUrlFocusnode.removeListener(_updateImgUrl);
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imgUrlController.dispose();
    _imgUrlFocusnode.dispose();
    super.dispose();
  }

  void _saveForm() {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return; // it terminates the this function , print statemwnts wont work
    }
    _form.currentState!.save();

    if (_editedProduct.id.isNotEmpty) {
      print('_editedProduct.id${_editedProduct.id}');
      Provider.of<Products>(context, listen: false)
          .updateProduct(_editedProduct.id, _editedProduct);
    }
    if (productId['isAdd'] == true) {
      Provider.of<Products>(context, listen: false).addProduct(_editedProduct);
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(productId['isAdd'] == false ? 'Edit product' : 'New Product'),
        actions: [IconButton(onPressed: _saveForm, icon: Icon(Icons.save))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
            key: _form,
            child: ListView(
              children: [
                TextFormField(
                  initialValue: _initValue['title'],
                  decoration: InputDecoration(labelText: 'Title'),
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_priceFocusNode);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter value';
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    _editedProduct = Product(
                        title: newValue!,
                        description: _editedProduct.description,
                        price: _editedProduct.price,
                        imageUrl: _editedProduct.imageUrl,
                        id: _editedProduct.id,
                        isFavorite: _editedProduct.isFavorite);
                  },
                ),
                TextFormField(
                    initialValue: _initValue['price'],
                    decoration: InputDecoration(labelText: 'Price'),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    focusNode: _priceFocusNode,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context)
                          .requestFocus(_descriptionFocusNode);
                    },
                    onSaved: (newprice) {
                      _editedProduct = Product(
                          id: _editedProduct.id,
                          isFavorite: _editedProduct.isFavorite,
                          title: _editedProduct.title,
                          description: _editedProduct.description,
                          price: double.parse(newprice!),
                          imageUrl: _editedProduct.imageUrl);
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a price. ';
                      }
                      if (double.tryParse(value) == null) {
                        return 'Please enter a valid number. ';
                      }
                      if (double.parse(value) <= 0) {
                        return 'Please enter a number greater than zero. ';
                      }
                      return null;
                    }),
                TextFormField(
                  initialValue: _initValue['description'],
                  decoration: InputDecoration(labelText: 'Description'),
                  maxLines: 3,
                  minLines: 1,
                  keyboardType: TextInputType.multiline,
                  // textInputAction: TextInputAction.next,
                  // onFieldSubmitted: (_) {
                  //   FocusScope.of(context).requestFocus(_priceFocusNode);
                  // },
                  focusNode: _descriptionFocusNode,
                  onSaved: (newDescription) {
                    _editedProduct = Product(
                        id: _editedProduct.id,
                        isFavorite: _editedProduct.isFavorite,
                        title: _editedProduct.title,
                        description: newDescription!,
                        price: _editedProduct.price,
                        imageUrl: _editedProduct.imageUrl);
                  },
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return 'enter value';
                    }
                    if (value.length < 5) {
                      return 'enter atleast 20 char long';
                    }
                    return null;
                  }),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      margin: EdgeInsets.only(top: 8, right: 10),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                      ),
                      child: _imgUrlController.text.isEmpty
                          ? Text('Enter a URL')
                          : FittedBox(
                              child: Image.network(
                                  (_imgUrlController.text).toString(),
                                  fit: BoxFit.cover),
                            ),
                    ),
                    Expanded(
                      child: TextFormField(
                        // initialValue: _initValue['imageUrl '],
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.url,
                        controller: _imgUrlController,
                        focusNode: _imgUrlFocusnode,
                        onFieldSubmitted: ((_) => _saveForm()),
                        onSaved: (newImage) {
                          _editedProduct = Product(
                              id: _editedProduct.id,
                              isFavorite: _editedProduct.isFavorite,
                              title: _editedProduct.title,
                              description: _editedProduct.description,
                              price: _editedProduct.price,
                              imageUrl: newImage!);
                        },
                        decoration: InputDecoration(
                          labelText: 'Img URL',
                        ),
                        validator: ((value) {
                          return null;
                        }),
                      ),
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }
}
