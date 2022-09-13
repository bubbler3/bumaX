import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

import 'package:get/get_utils/src/platform/platform.dart';

class TermsScreen extends StatefulWidget {
  static const id = '/terms';
  const TermsScreen({Key? key}) : super(key: key);

  @override
  _TermsScreenState createState() => _TermsScreenState();
}

class _TermsScreenState extends State<TermsScreen> {
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
            ),
      body: Container(
        color: Colors.cyan,
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
                                      color: Colors.cyan,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),
                                ),
                                const SizedBox(height: 24),
                                Text(snapshot.requireData),
                              ],
                            ),
                          );
                        } else {
                          return const Text('Loading Terms of Service...',
                              style: TextStyle(
                                  color: Colors.cyan,
                                  backgroundColor: Colors.cyan));
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
