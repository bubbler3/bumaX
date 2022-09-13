import 'package:beamer/beamer.dart';
import 'package:bubblesmapper_web/page_route_transition.dart';
import 'package:bubblesmapper_web/bubbles/privacy.dart';
import 'package:bubblesmapper_web/bubbles/terms.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final String title;
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OutlinedButton(
                onPressed: () {
                  Beamer.of(context).beamToNamed('/privacy');
                },
                child: const Text('Privacy policy')),
            SizedBox(width: 48),
            OutlinedButton(
                onPressed: () {
                  Beamer.of(context).beamToNamed('/terms');
                },
                child: const Text('Terms of service')),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
