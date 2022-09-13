import 'package:beamer/beamer.dart';
import 'package:bubblesmapper_web/page_route_transition.dart';
import 'package:bubblesmapper_web/bubbles/privacy.dart';
import 'package:bubblesmapper_web/routes.dart';
import 'package:bubblesmapper_web/bubbles/terms.dart';
import 'package:flutter/material.dart';

import 'bubble_pro/privacy_pro.dart';
import 'bubble_pro/terms_pro.dart';
import 'home.dart';
import 'material_color.dart';

void main() {
  runApp(const MyHomePage());
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final BeamerDelegate routerDelegate;
  final String title = 'BubblesMapper';
  @override
  void initState() {
    routerDelegate = BeamerDelegate(
      locationBuilder: RoutesLocationBuilder(
        routes: {
          // Return either Widgets or BeamPages if more customization is needed
          '/': (context, state, data) => HomeScreen(title: title),
          '/privacy': (context, state, data) => PrivacyScreen(),
          '/terms': (context, state, data) => TermsScreen(),
          '/pro/privacy': (context, state, data) => PrivacyProScreen(),
          '/pro/terms': (context, state, data) => TermsProScreen(),
        },
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: title,
      routeInformationParser: BeamerParser(),
      routerDelegate: routerDelegate,
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
    );
  }
}
