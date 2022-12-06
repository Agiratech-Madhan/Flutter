import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../pages/app_bar_function.dart';
import '../pages/data_widget.dart';
import '../model/country_model.dart';

import '../provider/data_provider.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool visibleValues = false;
  bool search = false;
  String? countryName = 'India';
  bool autoComplete = false;
  bool loading = false;
  Counties? countries;
  Future<void> loadData() async {
    await Provider.of<DataProvider>(context, listen: false).load(countryName!);
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
                style: const TextStyle(color: Colors.white),
                controller: controller,
                focusNode: node,
                decoration: InputDecoration(
                  suffixIcon: (provider.visibleValue)
                      ? IconButton(
                          onPressed: () {
                            controller.text = '';
                            search = false;
                            provider.getVisible(false);
                          },
                          icon: const Icon(Icons.close, color: Colors.white))
                      : null,
                  border: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintStyle: const TextStyle(color: Colors.white),
                ),
              ),
              onSelected: (selection) async {
                try {
                  setState(() {
                    provider.getVisible(false);
                    autoComplete = true;
                  });
                  // countryName = selection.country;
                  loading = true;
                  await provider.load('${selection.country}');
                  autoComplete = true;
                  setState(() {
                    loading = false;
                  });
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
        body: loading
            ? const Center(child: CircularProgressIndicator())
            : CustomScrollView(
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
                                style: const TextStyle(
                                    fontSize: 27,
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal),
                              )),
                      flexibleSpace: FlexibleSpaceBar(
                          background: Image.network(
                            fit: BoxFit.cover,
                            provider.getImage('${provider.data?.condition}'),
                          ),
                          centerTitle: true,
                          title: AppBarFunction(
                            fullscreen: const Text(''),
                          )),
                      pinned: true,
                      expandedHeight: MediaQuery.of(context).size.height * 0.3,
                    ),
                  ),
                  SliverFillRemaining(
                    child: Consumer<DataProvider>(
                        builder: (context, provider, child) {
                      String x = '2022-12-05 4:49';
                      String dateValue = (provider.data?.num) ?? x;
                      DateTime getDate =
                          DateFormat("yyyy-MM-dd hh:mm").parse(dateValue);
                      String formatedDate =
                          DateFormat("E,d MMM").format(getDate);
                      return Stack(
                        children: [
                          AppBarFunction(
                            context: context,
                            fullscreen: imageMethod(
                                context,
                                provider,
                                provider.x
                                    ? '${provider.data?.condition}'
                                    : 'color'),
                          ),
                          DataWidget(formatedDate: formatedDate),
                        ],
                      );
                    }),
                  )
                ],
              ));
  }

  Image imageMethod(BuildContext context, DataProvider provider, String v) {
    return Image.network(
      height: MediaQuery.of(context).size.height * 1,
      fit: BoxFit.cover,
      provider.getImage(v),
    );
  }
}
