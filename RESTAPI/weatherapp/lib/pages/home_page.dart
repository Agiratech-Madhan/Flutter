import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:weatherapp/pages/image_data.dart';
import '../model/country_model.dart';

import '../provider/data_provider.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool search = false;
  String? countryName;
  static bool? autoComplete = false;
  Counties? countries;
  Future<void> loadData() async {
    await Provider.of<DataProvider>(context, listen: false).load('India');
  }

  Future<void> loadCountry() async {
    countries =
        await Provider.of<DataProvider>(context, listen: false).loadCountries();
  }

  @override
  void initState() {
    super.initState();
    loadData();
    loadCountry();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DataProvider>(context);
    // String selectedItem=
    String x = '2022-12-05 4:49';
    String dateValue = (provider.data?.num) ?? x;
    DateTime getDate = DateFormat("yyyy-MM-dd hh:mm").parse(dateValue);
    String formatedDate = DateFormat("E,d MMM").format(getDate);
    // String selectedItem = '${countries?.data!.first.country}';
    // print('selec$selectedItem');

    var autocomplete = Autocomplete<Country>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          // search = false;
          return List.empty();
        } else {
          return countries!.data!
              .where((element) => element.country!
                  .toLowerCase()
                  .contains(textEditingValue.text.toLowerCase()))
              .toList();
        }
      },
      fieldViewBuilder: (BuildContext context, TextEditingController controller,
              FocusNode node, Function onSubmit) =>
          TextField(
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.black),
        controller: controller,
        focusNode: node,
        decoration: InputDecoration(
          disabledBorder: InputBorder.none,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            // borderRadius: BorderRadius.circular(20.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 3, color: Colors.white),
          ),
          fillColor: Colors.white,
          filled: true,

          // border: InputBorder.none,
          hintStyle: TextStyle(color: Colors.black),
        ),
      ),
      onSelected: (selection) async {
        try {
          setState(() {
            search = false;
            autoComplete = true;
          });
          countryName = selection.country;

          await provider.load('${selection.country}');
          autoComplete = false;
        } catch (e) {
          Exception('error to load data');
        } finally {
          FocusScope.of(context).unfocus();
        }
      },
      displayStringForOption: (Country d) => d.country!,
    );
    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          title: search ? autocomplete : Text('${countryName ?? 'India'}'),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            Row(
              children: [
                !search
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            search = true;
                          });
                        },
                        icon: const Icon(Icons.search))
                    : (search)
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                search = false;
                              });
                            },
                            icon: const Icon(Icons.close))
                        : Container(),
              ],
            )
          ],
        ),
        body: ImageData(
            provider: provider,
            autoComplete: autoComplete,
            formatedDate: formatedDate));
  }
}
