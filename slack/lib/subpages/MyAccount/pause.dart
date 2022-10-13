import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Pause extends StatefulWidget {
  const Pause({super.key});

  @override
  State<Pause> createState() => _PauseState();
}

enum Place { one, two, three, four, five }

class _PauseState extends State<Pause> {
  // int? _result;
  dynamic _options;
  // TimeOfDay time = TimeOfDay(hour: 10, minute: 30);
  // final _titlecontroller = TextEditingController();
  TextEditingController dateInput = TextEditingController();
  TextEditingController timeinput = TextEditingController();

  dynamic _selectedDate;
  void _presentdatepicker() async {
    // showDatePicker(
    //   context: context,
    //   initialDate: DateTime.now(),
    //   firstDate: DateTime(2019),
    //   lastDate: DateTime.now(),
    // ).then((pickedDate) {
    //   if (pickedDate == null) {
    //     return;
    //   }
    //   setState(() {
    //     _selectedDate = pickedDate;
    //   });
    // });
  }

  // TextEditingController dateInput = TextEditingController();
  bool isselected = false;
  bool isCustom = false;
  bool _homeFieldVisible = false;
  // void handleSelection(Place? value) {
  //   setState(() {
  //     _options = value;
  // _homeFieldVisible = value == Place.five;
  //   });
  // }
  @override
  void initState() {
    dateInput.text = "";
    timeinput.text = "";
    //set the initial value of text field
    super.initState();
  }

  Widget build(BuildContext context) {
    // final hours = time.hour.toString().padLeft(2, '0');
    // final minutes = time.minute.toString().padLeft(2, '0');
    return MaterialApp(
      // theme: ThemeData(primarySwatch: null),
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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                )),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Save",
                      style: TextStyle(
                          color: isselected ? Colors.black : Colors.grey)),
                )
              ],
            ),
            Divider(
              color: Colors.grey,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RadioListTile(
                    title: const Text('30  minutes'),
                    value: 1,
                    groupValue: _options,
                    onChanged: (value) {
                      setState(() {
                        isselected = true;
                        _homeFieldVisible = false;
                        _options = value as dynamic;
                      });
                    }),
                RadioListTile(
                    title: const Text('1 hour'),
                    value: 2,
                    groupValue: _options,
                    onChanged: (value) {
                      setState(() {
                        isselected = true;

                        _homeFieldVisible = false;
                        _options = value as dynamic;
                      });
                    }),
                RadioListTile(
                    title: const Text('2 hour'),
                    value: 3,
                    groupValue: _options,
                    onChanged: (value) {
                      setState(() {
                        isselected = true;

                        _homeFieldVisible = false;
                        _options = value as dynamic;
                      });
                    }),
                RadioListTile(
                    title: const Text('Until tomorrow'),
                    value: 4,
                    groupValue: _options,
                    onChanged: (value) {
                      setState(() {
                        isselected = true;

                        _homeFieldVisible = false;
                        _options = value as dynamic;
                      });
                    }),
                RadioListTile(
                    title: const Text('Custom'),
                    value: Place.five,
                    // selected: isCustom,
                    groupValue: _options,
                    onChanged: (value) {
                      setState(() {
                        isselected = true;

                        _options = value as dynamic;
                        _homeFieldVisible = value == Place.five;

                        // isCustom = value=_result.'Custom';
                      });
                    }),

                // const SizedBox(height: 25),
                // Text(_result == 7 ? 'Correct!' : 'Please chose the right answer!')
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
                            firstDate: DateTime(1950),
                            //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2100));

                        if (pickedDate != null) {
                          print(
                              pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          print(
                              formattedDate); //formatted date output using intl package =>  2021-03-16
                          setState(() {
                            dateInput.text =
                                formattedDate; //set output date to TextField value.
                          });
                        } else {}
                      },
                    ),
                    // TextField(
                    //   decoration: InputDecoration(
                    //       labelText: "Time",
                    //       suffixIcon: Icon(Icons.arrow_drop_down)),
                    // )
                    TextField(
                      controller: timeinput,
                      decoration: InputDecoration(
                          //icon of text field
                          labelText: "Time",
                          suffixIcon: Icon(Icons.arrow_drop_down)
                          //label text of field
                          ),
                      onTap: () async {
                        TimeOfDay? newtime = await showTimePicker(
                            context: context, initialTime: TimeOfDay.now());
                        if (newtime != null) {
                          // print(newtime.format(context)); //output 10:51 PM
                          DateTime parsedTime = DateFormat.jm()
                              .parse(newtime.format(context).toString());
                          //converting to DateTime so that we can further format on different pattern.
                          // print(parsedTime); //output 1970-01-01 22:53:00.000
                          String formattedTime =
                              DateFormat.jm().format(parsedTime);
                          // print(formattedTime); //output 14:59:00
                          //DateFormat() is from intl package, you can format the time on any pattern you need.

                          setState(() {
                            timeinput.text =
                                formattedTime; //set the value of text field.
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
