import 'package:flutter/material.dart';

class Channel {
  final Widget icon;
  final String name;

  Channel(this.icon, this.name);
}

List<Channel> channeldata = [
  Channel(Icon(Icons.star_border_outlined), "Agirateam"),
  Channel(Icon(Icons.lock), "team-ui-mobile"),
  Channel(Icon(Icons.star_border_outlined), "Random"),
  Channel(Icon(Icons.lock), "project training"),
  Channel(Icon(Icons.add), 'Add Channel')
];
