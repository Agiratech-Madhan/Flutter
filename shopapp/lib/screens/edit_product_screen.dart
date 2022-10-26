import 'package:flutter/material.dart';
import '../providers/product.dart';

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
  var editedProduct = Product(
      id: 'null', title: 'title', description: '', price: 0, imageUrl: '');
  @override
  void initState() {
    // TODO: implement initState
    _imgUrlFocusnode.addListener(_updateImgUrl);
    super.initState();
  }

  void _updateImgUrl() {
    if (!_imgUrlFocusnode.hasFocus) {
      setState(() {});
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
    _form.currentState!.save();
    print(editedProduct.description);
    print(editedProduct.title);

    print(editedProduct.imageUrl);
    print(editedProduct.price);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit product'),
        actions: [IconButton(onPressed: _saveForm, icon: Icon(Icons.save))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
            key: _form,
            child: ListView(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Title'),
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_priceFocusNode);
                  },
                  onSaved: (newValue) {
                    editedProduct = Product(
                        id: '',
                        title: newValue!,
                        description: editedProduct.description,
                        price: editedProduct.price,
                        imageUrl: editedProduct.imageUrl);
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Price'),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  focusNode: _priceFocusNode,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_descriptionFocusNode);
                  },
                  onSaved: (newprice) {
                    editedProduct = Product(
                        id: '',
                        title: editedProduct.title,
                        description: editedProduct.description,
                        price: double.parse(newprice!),
                        imageUrl: editedProduct.imageUrl);
                  },
                ),
                TextFormField(
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
                    editedProduct = Product(
                        id: '',
                        title: editedProduct.title,
                        description: newDescription!,
                        price: editedProduct.price,
                        imageUrl: editedProduct.imageUrl);
                  },
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
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.url,
                        controller: _imgUrlController,
                        focusNode: _imgUrlFocusnode,
                        onFieldSubmitted: ((_) => _saveForm()),
                        onSaved: (newImage) {
                          editedProduct = Product(
                              id: '',
                              title: editedProduct.title,
                              description: editedProduct.description,
                              price: editedProduct.price,
                              imageUrl: newImage!);
                        },
                        decoration: InputDecoration(
                          labelText: 'Img URL',
                        ),
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
