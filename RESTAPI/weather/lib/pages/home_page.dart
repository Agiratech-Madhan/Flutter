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
          title: Autocomplete<Country>(
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
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white),
              controller: controller,
              focusNode: node,
              decoration: const InputDecoration(
                border: InputBorder.none,
                counterStyle: TextStyle(color: Colors.white),
                hintText: 'India',
                hintStyle: TextStyle(color: Colors.white),
              ),
            ),
            onSelected: (selection) async {
              try {
                await provider.load('${selection.country}');
              } catch (e) {
                Exception('error to load data');
              } finally {
                FocusScope.of(context).unfocus();
              }
            },
            displayStringForOption: (Country d) => d.country!,
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
