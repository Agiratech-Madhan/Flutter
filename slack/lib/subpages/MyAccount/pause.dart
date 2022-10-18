import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

class Pause extends StatefulWidget {
  const Pause({super.key});

  @override
  State<Pause> createState() => _PauseState();
}

enum Place { one, two, three, four, five }

class _PauseState extends State<Pause> {
  dynamic _options;

  TextEditingController dateInput = TextEditingController();
  TextEditingController timeinput = TextEditingController();

  bool isselected = false;
  bool isCustom = false;
  bool _homeFieldVisible = false;
  void update(value) {
    setState(() {
      isselected = value == Place.five;
      _options = value as dynamic;
      _homeFieldVisible = value == Place.five;
    });
  }

  @override
  void initState() {
    dateInput.text = "";
    timeinput.text = "";
    super.initState();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.cancel)),
                Flexible(
                    child: Text(
                  "Pause  Notifications",
                  style: GoogleFonts.notoSans(
                      fontWeight: FontWeight.bold, fontSize: 18),
                )),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Save",
                      style: GoogleFonts.notoSans(
                          color: isselected ? Colors.black : Colors.grey)),
                )
              ],
            ),
            const Divider(
              color: Colors.grey,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RadioListTile(
                    title: const Text('30  minutes'),
                    value: Place.one,
                    groupValue: _options,
                    onChanged: ((value) => update(value))),
                RadioListTile(
                    toggleable: true,
                    title: const Text('1 hour'),
                    value: Place.two,
                    groupValue: _options,
                    onChanged: ((value) => update(value))),
                RadioListTile(
                    title: const Text('2 hour'),
                    value: Place.three,
                    groupValue: _options,
                    onChanged: ((value) => update(value))),
                RadioListTile(
                    title: const Text('Until tomorrow'),
                    value: Place.four,
                    groupValue: _options,
                    onChanged: ((value) => update(value))),
                RadioListTile(
                    title: const Text('Custom'),
                    value: Place.five,
                    groupValue: _options,
                    onChanged: ((value) => update(value))),
              ],
            ),
            if (_homeFieldVisible)
              Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.30,
                    right: MediaQuery.of(context).size.width * 0.05),
                child: Column(
                  children: [
                    TextField(
                      controller: dateInput,
                      readOnly: true,
                      decoration: InputDecoration(
                          labelText: "Date",
                          suffixIcon: Icon(Icons.arrow_drop_down)),
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100));

                        if (pickedDate != null) {
                          print(pickedDate);
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          print(formattedDate);
                          setState(() {
                            dateInput.text = formattedDate;
                          });
                        } else {}
                      },
                    ),
                    TextField(
                      controller: timeinput,
                      decoration: InputDecoration(
                          labelText: "Time",
                          suffixIcon: Icon(Icons.arrow_drop_down)),
                      onTap: () async {
                        TimeOfDay? newtime = await showTimePicker(
                            context: context, initialTime: TimeOfDay.now());
                        if (newtime != null) {
                          DateTime parsedTime = DateFormat.jm()
                              .parse(newtime.format(context).toString());

                          String formattedTime =
                              DateFormat.jm().format(parsedTime);

                          setState(() {
                            timeinput.text = formattedTime;
                          });
                        }
                      },
                      readOnly: true,
                    )
                  ],
                ),
              )
          ],
        ),
      )),
    );
  }
}
