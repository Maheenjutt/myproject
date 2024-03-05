import 'package:flutter/material.dart';
import 'package:myproject/check.dart';
import 'package:myproject/data.dart';
import 'package:firebase_core/firebase_core.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAORp5We-knq-eyXWkinnnW41hL8KYIh_w",
      appId: "1:132742749077:android:0f94a9c1fabd8248f4f49c",
      messagingSenderId: "132742749077",
      projectId: "islamicapp-6250a",
      storageBucket: "islamicapp-6250a.appspot.com",
    ),
  );
  runApp(const MyApp());

}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: chk(),
    );
  }
}
