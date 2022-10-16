import 'package:flutter/material.dart';
import 'package:language_picker/languages.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:language_picker/language_picker.dart';

class SelectLangauge extends StatefulWidget {
  @override
  State<SelectLangauge> createState() => _SelectLangaugeState();
}

class _SelectLangaugeState extends State<SelectLangauge> {
  Language _selectedDialogLanguage = Languages.tamil;

  void _openLanguagePickerDialog() => showDialog(
        context: context,
        builder: (context) => LanguagePickerDialog(
          titlePadding: EdgeInsets.all(8.0),
          searchCursorColor: Theme.of(context).primaryColor,
          searchInputDecoration: InputDecoration(hintText: 'Search...'),
          isSearchable: true,
          title: Text('Select your language'),
          onValuePicked: (Language language) => setState(() {
            _selectedDialogLanguage = language;
            print(_selectedDialogLanguage.name);
            print(_selectedDialogLanguage.isoCode);
          }),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      // padding: const EdgeInsets.all(0.0),
      child: ListTile(
        minVerticalPadding: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: EdgeInsets.only(left: 5),
        onTap: () {
          _openLanguagePickerDialog();
        },
        leading: Container(
          child: Icon(Icons.language),
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.withOpacity(0.1)),
        ),
        title: Text(
          'Langu age',
          style: GoogleFonts.notoSans(fontSize: 16),
        ),
        subtitle: Text(
          _selectedDialogLanguage.name,
          style: GoogleFonts.notoSans(),
        ),
      ),
    );
  }
}
