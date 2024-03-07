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
  String name1 = "My Name";
  String name2 = "My Name";
  save() {
    FirebaseFirestore.instance
        .collection("Old Collection")
        .doc("doc1")
        .set({"name": "Saad"}, SetOptions(merge: true)).then((value) {
      setState(() {});
    });
  }

  getdata1() {
    FirebaseFirestore.instance
        .collection("Old Collection")
        .doc("doc1")
        .get()
        .then((value) {
      setState(() {
        name1 = value.get("name");
      });
    });
  }

  getdata2() {
    FirebaseFirestore.instance
        .collection("Old Collection")
        .doc("doc2")
        .get()
        .then((value) {
      setState(() {
        name2 = value.get("name");
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
              getdata1();
            },
            child: Text(
              name1,
              style: TextStyle(color: Colors.white, fontSize: 48),
            ),
          ),
          GestureDetector(
            onTap: () {
              getdata2();
            },
            child: Text(
              name2,
              style: TextStyle(color: Colors.white, fontSize: 48),
            ),
          )
        ],
      ),
    );
  }
}
