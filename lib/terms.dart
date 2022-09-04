import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    data ??= loadAsset(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        color: Colors.cyan,
        child: Row(
          children: [
            Flexible(flex: 1, child: Container()),
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
                          return const Text('Loading Terms of Service...');
                        }
                      }),
                )),
              ),
            ),
            Flexible(flex: 1, child: Container()),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
