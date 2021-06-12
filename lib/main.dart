import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
// Lock orientation
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Piano'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blueGrey[900],
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.question_answer),
          ),
        ],
      ),
      body: MyPiano(),
      backgroundColor: Colors.black,
    );
  }

  // Lock in horizontal mode.
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }
}

class MyPiano extends StatefulWidget {
  const MyPiano({Key? key}) : super(key: key);

  @override
  _MyPianoState createState() => _MyPianoState();
}

class _MyPianoState extends State<MyPiano> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildWhiteTile('C'),
            buildWhiteTile('D'),
            buildWhiteTile('E'),
            buildWhiteTile('F'),
            buildWhiteTile('G'),
            buildWhiteTile('A'),
            buildWhiteTile('B'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: 27),
            buildBlackTile('C#'),
            buildBlackTile('D#'),
            buildEmptyTile(),
            buildBlackTile('F#'),
            buildBlackTile('G#'),
            buildBlackTile('A#'),
            SizedBox(width: 27),
          ],
        ),
      ],
    );
  }

  Container buildEmptyTile() {
    return Container(
      width: 60,
      height: 195,
      color: Colors.transparent,
    );
  }

  Widget buildBlackTile(note) {
    return GestureDetector(
      onTap: () {
        AudioCache audio = AudioCache();
        audio.play('$note.wav');
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
        width: 60,
        height: 195,
      ),
    );
  }

  Widget buildWhiteTile(note) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          AudioCache audio = AudioCache();
          audio.play('$note.wav');
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
            border: Border.all(
              color: Colors.black,
              width: 1.5,
            ),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
