import 'package:bubblesmapper_web/page_route_transition.dart';
import 'package:bubblesmapper_web/privacy.dart';
import 'package:bubblesmapper_web/routes.dart';
import 'package:bubblesmapper_web/terms.dart';
import 'package:flutter/material.dart';

import 'material_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BubblesMapper',
      routes: Routes.routes, //
      theme: ThemeData(
        primarySwatch: createMaterialColor(Colors.cyan),
        appBarTheme: const AppBarTheme(
            foregroundColor: Colors.white //here you can give the text color
            ),
        //brightness: Brightness.light,
        primaryTextTheme: const TextTheme(
          headline6: TextStyle(color: Colors.white),
        ),
        primaryIconTheme: const IconThemeData.fallback().copyWith(
          color: Colors.white,
        ),
        //cardColor: Colors.white,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
        //scaffoldBackgroundColor: Colors.white,
      ),
      home: const MyHomePage(title: 'BubblesMapper'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

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
                  Navigator.push(
                      context,
                      FadeRoute(
                        page: const PrivacyScreen(),
                      ));
                },
                child: const Text('Privacy policy')),
            SizedBox(width: 48),
            OutlinedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      FadeRoute(
                        page: const TermsScreen(),
                      ));
                },
                child: const Text('Terms of service')),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
