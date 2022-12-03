import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:weather/model/country_model.dart';
import 'package:weather/model/weather_model.dart';
import 'package:weather/provider/data_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Counties? countries;
  // Future<void> loadData() async {
  //   await Provider.of<DataProvider>(context, listen: false).load('London');
  // }

  Future<void> loadCountry() async {
    countries =
        await Provider.of<DataProvider>(context, listen: false).loadCountries();
  }

  @override
  void initState() {
    super.initState();
    // loadData();
    loadCountry();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DataProvider>(context);
    print(provider.counties?.data?[0].country);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Autocomplete<Country>(
            // fieldViewBuilder:(context, textEditingController, focusNode, onFieldSubmitted) => ,
            optionsBuilder: (TextEditingValue textEditingValue) {
              if (textEditingValue.text == '') {
                return List.empty();
              } else {
                return countries!.data!
                    .where((element) => element.country!
                        .toLowerCase()
                        .contains(textEditingValue.text.toLowerCase()))
                    .toList();
              }
            },
            fieldViewBuilder: (BuildContext context,
                    TextEditingController controller,
                    FocusNode node,
                    Function onSubmit) =>
                TextField(
              style: TextStyle(color: Colors.white),
              controller: controller,
              focusNode: node,
              decoration: InputDecoration(
                counterStyle: TextStyle(color: Colors.white),
                hintText: 'Type here...',
                hintStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                suffixIcon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
            ),
            onSelected: (selection) {
              provider.load('${selection.country}');
              print('You just selected ${selection.country}');
            },
            displayStringForOption: (Country d) => '${d.country!}',
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.filter_list))
          ],
        ),
        body: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Image.network(
              'https://cdn.wallpapersafari.com/43/98/7hfVLN.jpg',
              height: MediaQuery.of(context).size.height * 1,
              fit: BoxFit.fitHeight,
              filterQuality: FilterQuality.high,
            ),
            Positioned(
                top: 90,
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 30,
                        // left: MediaQuery.of(context).size.width * 0.3,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            'Today',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text('${provider.Data?.num ?? 456789}',
                              style: const TextStyle(
                                color: Colors.grey,
                              )),
                          const SizedBox(
                            height: 50,
                          ),
                          SizedBox(
                            height: 100,
                            child: Text(
                              '${provider.Data?.temperature ?? 7}°',
                              style: const TextStyle(
                                fontSize: 100,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ))
          ],
        ));
  }
}
