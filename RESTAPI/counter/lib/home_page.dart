import 'package:counter/provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './routes/routes.dart' as route;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DataProvider>(context);
    void showMessage(String message) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Counter value is $message check in ThirdPage'),
          duration: const Duration(seconds: 2),
          action: SnackBarAction(
            textColor: Colors.blue,
            label: 'OKAY',
            onPressed: () {
              Navigator.of(context).pushNamed(route.thirdPage);
            },
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(route.secondPage);
              },
              icon: const Icon(Icons.arrow_forward))
        ],
        centerTitle: true,
        title: const Text('HomePage'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: () {
                    provider.increment();
                    showMessage(provider.countValue.toString());
                  },
                  icon: const Icon(Icons.add)),
              const OutlinedButton(
                  onPressed: null, child: Text('Increment/Decrement')),
              IconButton(
                  onPressed: () {
                    provider.decrement();
                    showMessage(provider.countValue.toString());
                  },
                  icon: const Icon(Icons.remove))
            ],
          ),
        ],
      ),
    );
  }
}
