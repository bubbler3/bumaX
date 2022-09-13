import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:get/get.dart';

class PrivacyProScreen extends StatefulWidget {
  static const id = '/privacy';
  const PrivacyProScreen({Key? key}) : super(key: key);

  @override
  _PrivacyProScreenState createState() => _PrivacyProScreenState();
}

class _PrivacyProScreenState extends State<PrivacyProScreen> {
  final String title = 'Privacy policy';
  Future<String>? data;

  Future<String> loadAsset(BuildContext context) async {
    return await DefaultAssetBundle.of(context)
        .loadString('assets/res/privacy.txt');
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    data ??= loadAsset(context);
    bool isPhone = context.isPhone;
    return Scaffold(
      appBar: isPhone
          ? null
          : AppBar(
              title: Text(title),
              backgroundColor: const Color(0XFFE91E63),
            ),
      body: Container(
        color: const Color(0XFFE91E63),
        child: Row(
          children: [
            isPhone ? Container() : Flexible(flex: 1, child: Container()),
            Expanded(
              flex: 4,
              child: SingleChildScrollView(
                child: Center(
                    child: Card(
                  child: FutureBuilder<String>(
                      future: data,
                      builder: (BuildContext context,
                          AsyncSnapshot<String> snapshot) {
                        if (snapshot.hasData) {
                          return Padding(
                            padding: const EdgeInsets.all(48.0),
                            child: Column(
                              children: [
                                const Text(
                                  'BUBBLESMAPPER PRIVACY POLICY',
                                  style: TextStyle(
                                      color: Color(0XFFE91E63),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),
                                ),
                                const SizedBox(height: 24),
                                Text(snapshot.requireData),
                              ],
                            ),
                          );
                        } else {
                          return const Text('Loading Privacy Policy...',
                              style: TextStyle(
                                  color: Color(0XFFE91E63),
                                  backgroundColor: Color(0XFFE91E63)));
                        }
                      }),
                )),
              ),
            ),
            isPhone ? Container() : Flexible(flex: 1, child: Container()),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
