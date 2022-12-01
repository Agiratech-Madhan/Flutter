import 'package:flutter/material.dart';

class SeventhPage extends StatefulWidget {
  const SeventhPage({super.key});

  @override
  SeventhPageState createState() => SeventhPageState();
}

class SeventhPageState extends State<SeventhPage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.pink[300],
        title: const Text('Flutter Indexed Stack Demo'),
      ),
      body: Column(
        children: <Widget>[_stackedContainers(), _navigationButtons()],
      ),
    );
  }

  Widget imageNetwork(String url) {
    return Center(child: Image.network(url));
  }

  Widget _stackedContainers() {
    return Expanded(
      child: IndexedStack(
        index: index,
        children: <Widget>[
          imageNetwork('https://pbs.twimg.com/media/Eu7m692XIAEvxxP.png'),
          imageNetwork(
              'https://docs.flutter.dev/assets/images/dash/Dashatars.png'),
          imageNetwork('https://pbs.twimg.com/media/E44jYYkXoAEMlXS.jpg'),
        ],
      ),
    );
  }

  Widget outLinedButton(String key, String text, int indexValue) {
    return OutlinedButton(
        key: Key(key),
        onPressed: () {
          setState(() {
            index = indexValue;
          });
        },
        child: Text(text));
  }

  Widget _navigationButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        outLinedButton('Firstpage', 'Flutter', 0),
        outLinedButton('SecondPage', 'Aeologic', 1),
        outLinedButton('ThirdPage', 'Flutter Devs', 2),
      ],
    );
  }
}
