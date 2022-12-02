import 'package:counter/provider/data_provider.dart';
import 'package:flutter/material.dart';
import '../routes/routes.dart' as route;

import 'package:provider/provider.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  double rating = 10;
  RangeValues selectRange = const RangeValues(10, 20);
  @override
  Widget build(BuildContext context) {
    final value = Provider.of<DataProvider>(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(route.fourthPage);
              },
              icon: const Icon(Icons.arrow_forward))
        ],
        title: const Text('ThirdPage'),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            height: 70,
            child: Card(
              color: Colors.blue.withOpacity(0.3),
              child: Center(
                child: Text('Counter Value  ${value.countValue}'),
              ),
            ),
          ),
          Slider.adaptive(
            value: rating,
            onChanged: (x) {
              setState(() {
                rating = x;
              });
            },
            activeColor: Colors.pink,
            mouseCursor: MouseCursor.uncontrolled, //
            thumbColor: Colors.green,
            onChangeStart: (value) {
              print('from $value to starting value $rating');
            },
            onChangeEnd: (value) {
              print(value);
            },
            min: 1.0,
            max: 100,
            divisions: 10,
            label: rating.toString(),
          ),
          RangeSlider(
            values: selectRange,
            max: 100,
            divisions: 5,
            inactiveColor: Colors.red,
            labels: RangeLabels(
              '${selectRange.start}',
              '${selectRange.end}',
            ),
            onChanged: (RangeValues values) {
              setState(() {
                selectRange = values;
              });
            },
          ),
          Expanded(
              child: DraggableScrollableSheet(
                  expand: false,
                  builder: ((context, scrollController) {
                    return SingleChildScrollView(
                      controller: scrollController,
                      child: Column(
                        children: [
                          Image.network(
                              'https://pbs.twimg.com/media/Eu7m692XIAEvxxP.png'),
                          Container(
                            color: Colors.red,
                            height: 200,
                          )
                        ],
                      ),
                    );
                  })))
        ],
      ),
    );
  }
}
