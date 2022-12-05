import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:weather/model/country_model.dart';

import 'package:weather/provider/data_provider.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool search = false;
  String? countryName;
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
    loadCountry();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DataProvider>(context);
    String x = '2022-12-05 4:49';
    String dateValue = (provider.data?.num) ?? x;
    DateTime getDate = DateFormat("yyyy-MM-dd hh:mm").parse(dateValue);
    String formatedDate = DateFormat("E,d MMM").format(getDate);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          title: search
              ? Autocomplete<Country>(
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
                  fieldViewBuilder: (BuildContext context,
                          TextEditingController controller,
                          FocusNode node,
                          Function onSubmit) =>
                      TextField(
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.black),
                    controller: controller..text = countryName!,
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
                      });
                      countryName = selection.country;
                      await provider.load('${selection.country}');
                    } catch (e) {
                      Exception('error to load data');
                    } finally {
                      FocusScope.of(context).unfocus();
                    }
                  },
                  displayStringForOption: (Country d) => d.country!,
                )
              : Text(countryName!),
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
                // IconButton(
                //     onPressed: () {}, icon: const Icon(Icons.filter_list)),
              ],
            )
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
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 30,
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
                          Text(formatedDate,
                              style: const TextStyle(
                                color: Colors.grey,
                              )),
                          const SizedBox(
                            height: 50,
                          ),
                          SizedBox(
                            height: 100,
                            child: Text(
                              '${provider.data?.temperature ?? 7}°',
                              style: const TextStyle(
                                fontSize: 100,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          SizedBox(
                            height: 40,
                            width: 250,
                            child: FittedBox(
                              child: Text(
                                '${provider.data?.condition ?? 'Sunny'}',
                                style: const TextStyle(
                                  fontSize: 40,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ))
          ],
        ));
  }
}
