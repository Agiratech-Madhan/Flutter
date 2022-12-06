import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../provider/data_provider.dart';
import 'package:intl/intl.dart';

class StackWidget extends StatefulWidget {
  StackWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<StackWidget> createState() => _StackWidgetState();
}

class _StackWidgetState extends State<StackWidget> {
  ScrollPosition? _position;

  bool _visible = false;

  @override
  void dispose() {
    _removeListener();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _removeListener();
    _addListener();
  }

  void _addListener() {
    _position = Scrollable.of(context)?.position;
    print('hello$_position');
    _position?.addListener(_positionListener);
    _positionListener();
  }

  void _removeListener() {
    _position?.removeListener(_positionListener);
  }

  void _positionListener() {
    final FlexibleSpaceBarSettings? settings =
        context.dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>();
    bool visible =
        settings == null || settings.currentExtent <= settings.minExtent;

    if (_visible != visible) {
      setState(() {
        _visible = visible;
        print(_visible);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Consumer<DataProvider>(builder: (context, provider, child) {
          String x = '2022-12-05 4:49';
          String dateValue = (provider.data?.num) ?? x;
          DateTime getDate = DateFormat("yyyy-MM-dd hh:mm").parse(dateValue);
          String formatedDate = DateFormat("E,d MMM").format(getDate);

          return Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(true
                        ? provider.getImage('${provider.data?.condition}')
                        : ''))),
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
    );
  }
}
