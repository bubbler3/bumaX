import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

import 'package:get/get_utils/src/platform/platform.dart';

class TermsProScreen extends StatefulWidget {
  static const id = '/terms';

  const TermsProScreen({Key? key}) : super(key: key);

  @override
  _TermsProScreenState createState() => _TermsProScreenState();
}

class _TermsProScreenState extends State<TermsProScreen> {
  final String title = 'Terms of Service';
  Future<String>? data;

  Future<String> loadAsset(BuildContext context) async {
    return await DefaultAssetBundle.of(context)
        .loadString('assets/res/terms.txt');
  }

  @override
  Widget build(BuildContext context) {
    bool isPhone = context.isPhone;
    data ??= loadAsset(context);
    return Scaffold(
      appBar: isPhone
          ? null
          : AppBar(
              title: Text(title),
              backgroundColor: const Color(0XFFE91E63),
            ),
      body: Container(
        color: Color(0XFFE91E63),
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
                                  'BUBBLESMAPPER GENERAL TERMS OF SERVICE',
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
                          return const Text(
                            'Loading Terms of Service...',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                backgroundColor: Color(0XFFE91E63)),
                          );
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
