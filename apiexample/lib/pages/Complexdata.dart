import 'package:apiexample/providers/page_provider.dart';
import 'package:apiexample/providers/providerexample.dart';
import 'package:apiexample/widgets/pagedetail.dart';
import 'package:apiexample/widgets/pageslist.dart';

import '../models/pagemodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ComplexData extends StatefulWidget {
  const ComplexData({super.key});

  @override
  State<ComplexData> createState() => _ComplexDataState();
}

class _ComplexDataState extends State<ComplexData> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProviderExample>(context, listen: false).getvalues();
  }

  @override
  Widget build(BuildContext context) {
    final values = Provider.of<PageProvider>(context);
    final medaquery = MediaQuery.of(context).size;

    return Scaffold(
        body: Column(
      children: [PageList(), PageDetail()],
    ));
  }
}
