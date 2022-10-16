import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:language_picker/languages.dart';
import 'package:language_picker/language_picker.dart';
import 'package:slack/subpages/Home/SelectLanguage.dart';

class Preferences extends StatefulWidget {
  const Preferences({super.key});

  @override
  State<Preferences> createState() => _PreferencesState();
}

class _PreferencesState extends State<Preferences> {
  bool times = false;
  bool _animatedemoji = true;
  bool links = false;
  bool _indicators = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: Transform.rotate(
              angle: 0.8,
              child: Icon(
                Icons.add,
                size: 30,
              )),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Preference',
          style:
              GoogleFonts.notoSans(fontWeight: FontWeight.bold, fontSize: 17),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              top: 20,
            ),
            child: Row(
              children: [
                Text('Time and place',
                    style: GoogleFonts.notoSans(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          SelectLangauge(),
          SwitchListTile(
            activeColor: const Color(0xff002A36),
            title: const Text('Set time zone automatically'),
            subtitle: Text('(UTC+5:30) CHennai, Kolkata,Mumbai,NewDelhi'),
            value: times,
            onChanged: (bool value) {
              setState(() {
                times = value;
              });
            },
            secondary: Container(
              child: Icon(Icons.timelapse),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.withOpacity(0.1)),
            ),
          ),
          Divider(color: Colors.grey),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              top: 20,
            ),
            child: Row(
              children: [
                Text('Look and feel',
                    style: GoogleFonts.notoSans(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: ListTile(
              minVerticalPadding: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              contentPadding: EdgeInsets.only(left: 5),
              onTap: () {},
              leading: Container(
                child: Center(
                    child: Text(
                  '\u{270B}',
                  style: GoogleFonts.notoSans(fontSize: 20),
                )),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.1)),
              ),
              title: Text(
                'Default wmoji skin tone',
                style: GoogleFonts.notoSans(fontSize: 16),
              ),
              subtitle: Text(
                'hand',
                style: GoogleFonts.notoSans(),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: ListTile(
              minVerticalPadding: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              contentPadding: EdgeInsets.only(left: 5),
              onTap: () {},
              leading: Container(
                child: Icon(Icons.dark_mode_outlined),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.1)),
              ),
              title: Text(
                'Dark mode',
                style: GoogleFonts.notoSans(fontSize: 16),
              ),
              subtitle: Text(
                'System default',
                style: GoogleFonts.notoSans(),
              ),
            ),
          ),
          Divider(color: Colors.grey),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              top: 20,
            ),
            child: Row(
              children: [
                Text('Accessibility',
                    style: GoogleFonts.notoSans(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          SwitchListTile(
            activeColor: const Color(0xff002A36),
            title: const Text('Allow animated images & emoji'),
            subtitle: Text('This only affects what you see'),
            value: _animatedemoji,
            onChanged: (bool value) {
              setState(() {
                _animatedemoji = value;
              });
            },
            secondary: Container(
              child: Icon(Icons.visibility_outlined),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.withOpacity(0.1)),
            ),
          ),
          SwitchListTile(
            activeColor: const Color(0xff002A36),
            title: const Text('Underlined links'),
            subtitle: Text(
                'Websites and hyperlinks will be underlined in coversations'),
            value: links,
            onChanged: (bool value) {
              setState(() {
                links = value;
              });
            },
            secondary: Container(
              child: Icon(Icons.link),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.withOpacity(0.1)),
            ),
          ),
          SwitchListTile(
            activeColor: const Color(0xff002A36),
            title: const Text('Display typing indicators'),
            subtitle: Text('See when someone is typing'),
            value: _indicators,
            onChanged: (bool value) {
              setState(() {
                _indicators = value;
              });
            },
            secondary: Container(
              child: Icon(Icons.link),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.withOpacity(0.1)),
            ),
          ),
          Divider(color: Colors.grey),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              top: 20,
            ),
            child: Row(
              children: [
                Text('Privacy &visibility',
                    style: GoogleFonts.notoSans(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: ListTile(
              minVerticalPadding: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              contentPadding: EdgeInsets.only(left: 5),
              onTap: () {},
              leading: Container(
                child: Icon(Icons.lock_outlined),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.1)),
              ),
              title: Text(
                'Slack Connect discoverability',
                style: GoogleFonts.notoSans(fontSize: 16),
              ),
              subtitle: Text(
                'Choose who can see that you use Slack',
                style: GoogleFonts.notoSans(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
