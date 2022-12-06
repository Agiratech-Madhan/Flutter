import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:weatherapp/pages/app_bar_function.dart';
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
  ScrollPosition? _position;
  bool visibleValues = false;
  double? heightValue;
  bool search = false;
  String? countryName;
  bool autoComplete = false;
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
    heightValue = MediaQuery.of(context).size.height * 0.3;
    print(heightValue);

    var autocomplete = Consumer<DataProvider>(
        builder: (context, provider, child) => Autocomplete<Country>(
              optionsBuilder: (TextEditingValue textEditingValue) {
                if (textEditingValue.text == '') {
                  search = false;
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
                controller: controller,
                focusNode: node,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  // border: const OutlineInputBorder(
                  //   borderSide: BorderSide(color: Colors.white),
                  //   // borderRadius: BorderRadius.circular(20.0),
                  // ),
                  // focusedBorder: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(10),
                  //   borderSide: const BorderSide(width: 3, color: Colors.white),
                  // ),
                  // fillColor: Colors.white,
                  filled: true,

                  // border: InputBorder.none,
                  hintStyle: const TextStyle(color: Colors.black),
                ),
              ),
              onSelected: (selection) async {
                try {
                  setState(() {
                    provider.getVisible(false);
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
            ));
    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        body: CustomScrollView(
          slivers: [
            Consumer<DataProvider>(
              builder: (context, provider, child) => SliverAppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                centerTitle: true,
                title: provider.visibleValue
                    ? autocomplete
                    : TextButton(
                        onPressed: (() {
                          provider.getVisible(true);
                        }),
                        child: Text(
                          countryName ?? 'India',
                          style: TextStyle(fontSize: 27),
                        )),

                // provider.visibleValue
                //     ?
                //     AppBarFunction(
                //   autoComplete: true,
                // ),
                // : Text('${countryName ?? 'India'}'),
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                    fit: BoxFit.cover,
                    provider.getImage('${provider.data?.condition}'),
                  ),
                  centerTitle: true,
                  // title: AppBarFunction(
                  //   fullscreen: Text('data'),
                  // )
                  // AppBarFunction(
                  //   action: '${countryName ?? 'India1'}',
                  // )
                ),
                pinned: true,
                expandedHeight: MediaQuery.of(context).size.height * 0.3,
                // actions: [AppBarFunction(action: 'search', search: search,a)],
              ),
            ),
            SliverFillRemaining(
              child: Stack(
                children: [
                  Consumer<DataProvider>(builder: (context, provider, child) {
                    String x = '2022-12-05 4:49';
                    String dateValue = (provider.data?.num) ?? x;
                    DateTime getDate =
                        DateFormat("yyyy-MM-dd hh:mm").parse(dateValue);
                    String formatedDate = DateFormat("E,d MMM").format(getDate);

                    return Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(provider.getImage(
                                  true ? '${provider.data?.condition}' : '')))),
                      child: Center(
                        child: Column(
                          children: [
                            SizedBox(height: 100),
                            const Text(
                              'Today',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 30),
                            Text(formatedDate,
                                style: const TextStyle(
                                  color: Colors.black54,
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
                      ),
                    );
                  })
                ],
              ),
            )
          ],
        ));
  }
}
