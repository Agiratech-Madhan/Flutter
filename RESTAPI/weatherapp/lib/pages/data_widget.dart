import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../provider/data_provider.dart';

class DataWidget extends StatelessWidget {
  const DataWidget({
    Key? key,
    required this.formatedDate,
  }) : super(key: key);

  final String formatedDate;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DataProvider>(context);
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 100),
          const Text(
            'Today',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
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
          const SizedBox(
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
    );
  }
}
