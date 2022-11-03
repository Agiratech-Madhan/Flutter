import 'package:microphone/microphone.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:microphone/microphone.dart';

/// Example app demonstrating how to use the `microphone` plugin and with that
/// a [MicrophoneRecorder].
///
/// The example app listens to realtime updates of the recording and based on
/// that provides functionality to start, stop, and listen to a recording.
class MicExample extends StatefulWidget {
  /// Constructs [MicExample].
  const MicExample({Key? key}) : super(key: key);

  @override
  _MicExampleState createState() => _MicExampleState();
}

class _MicExampleState extends State<MicExample> {
  late MicrophoneRecorder _recorder;
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();

    _initRecorder();
  }

  @override
  void dispose() {
    _recorder.dispose();
    _audioPlayer.dispose();

    super.dispose();
  }

  void _initRecorder() {
    // Dispose the previous recorder.
    _recorder.dispose();

    _recorder = MicrophoneRecorder()
      ..init()
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    final value = _recorder.value;
    Widget result;

    if (value.started) {
      if (value.stopped) {
        result = Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              onPressed: () {
                setState(_initRecorder);
              },
              child: Text('Restart recorder'),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 16,
              ),
              child: OutlinedButton(
                onPressed: () async {
                  _audioPlayer.dispose();

                  _audioPlayer = AudioPlayer();
                  await _audioPlayer.setUrl(value.recording!.url);
                  await _audioPlayer.play();
                },
                child: Text('Play recording'),
              ),
            ),
          ],
        );
      } else {
        result = OutlinedButton(
          onPressed: () {
            _recorder.stop();
          },
          child: Text('Stop recording'),
        );
      }
    } else {
      result = OutlinedButton(
        onPressed: () {
          _recorder.start();
        },
        child: Text('Start recording'),
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: result,
        ),
      ),
    );
  }
}
