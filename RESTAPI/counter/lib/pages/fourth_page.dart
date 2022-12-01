import 'package:flutter/material.dart';

import '../routes/routes.dart' as route;

class FourthPage extends StatefulWidget {
  const FourthPage({super.key});

  @override
  State<FourthPage> createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                width: double.infinity,
                height: 200,
                child: Card(
                  child: Center(child: Text('data')),
                ),
              ),
              const SizedBox(
                width: double.infinity,
                height: 200,
                child: Card(
                  child: Center(child: Text('data')),
                ),
              ),
              const SizedBox(
                width: double.infinity,
                height: 200,
                child: Card(
                  child: Center(child: Text('data')),
                ),
              ),
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: Card(
                      child: Center(child: Text('Madhan')),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: Card(
                      child: Center(child: Text('Madhan')),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: Card(
                      child: Center(child: Text('Madhan')),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: Card(
                      child: Center(child: Text('Madhan')),
                    ),
                  ),
                ],
              ),
              const Expanded(
                flex: 0,
                child: SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: Card(
                    child: Center(child: Text('Expanded')),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
