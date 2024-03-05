import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class chk extends StatefulWidget {
  const chk({super.key});

  @override
  State<chk> createState() => _chkState();
}

class _chkState extends State<chk> {
  String name = "";
  save() {
    FirebaseFirestore.instance
        .collection("New Collection")
        .doc("col")
        .set({"name": "Maheen"}, SetOptions(merge: true)).then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: TextButton(onPressed: (){
          save();
        }, child: Text("name"),),
      ),
    );
  }
}
