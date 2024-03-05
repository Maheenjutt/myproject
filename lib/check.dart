import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';

class chk extends StatefulWidget {
  const chk({super.key});

  @override
  State<chk> createState() => _chkState();
}

class _chkState extends State<chk> {
  String name = "My Name";
  save() {
    FirebaseFirestore.instance
        .collection("Old Collection")
        .doc("doc1")
        .set({"name": "Amjad"}, SetOptions(merge: true)).then((value) {
      setState(() {});
    });
  }

  getdata() {
    FirebaseFirestore.instance
        .collection("Old Collection")
        .doc("doc1")
        .get()
        .then((value) {
      setState(() {
        name = value.get("name");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: TextButton(
          onPressed: () {
            save();
          },
          child: Text("Click Me"),
        ),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              getdata();
            },
            child: Text(
              name,
              style: TextStyle(color: Colors.white, fontSize: 48),
            ),
          )
        ],
      ),
    );
  }
}
