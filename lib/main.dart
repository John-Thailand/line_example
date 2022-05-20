import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_line_sdk/flutter_line_sdk.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  LineSDK.instance.setup("1657147826").then((_) {
    print("LineSDK prepared");
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _signIn() async {
    try {
      final result = await LineSDK.instance.login();
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Line Login'),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _signIn(),
        tooltip: 'Line Login',
        child: const Text('ログイン'),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
