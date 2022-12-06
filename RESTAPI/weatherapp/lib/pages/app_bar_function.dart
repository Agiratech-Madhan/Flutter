// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/data_provider.dart';

class AppBarFunction extends StatefulWidget {
  final Widget? fullscreen;
  final BuildContext? context;
  const AppBarFunction({
    Key? key,
    this.fullscreen,
    this.context,
  }) : super(key: key);
  @override
  AppBarFunctionState createState() {
    return AppBarFunctionState();
  }
}

class AppBarFunctionState extends State<AppBarFunction> {
  ScrollPosition? _position;
  bool? _visible;

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
      });
    }
    Provider.of<DataProvider>(context, listen: false).setBool(_visible!);
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _visible!,
      child: widget.fullscreen!,
    );
  }
}
