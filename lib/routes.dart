import 'package:bubblesmapper_web/bubbles/privacy.dart';
import 'package:bubblesmapper_web/bubbles/terms.dart';
import 'package:flutter/cupertino.dart';

class Routes {
  Routes._(); //this is to prevent anyone from instantiate this object

  static final routes = <String, WidgetBuilder>{
    PrivacyScreen.id: (context) => const PrivacyScreen(),
    TermsScreen.id: (context) => const TermsScreen(),
  };
}
