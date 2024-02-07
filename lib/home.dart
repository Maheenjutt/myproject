import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Project extends StatefulWidget {
  const Project({super.key});

  @override
  State<Project> createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
  TextEditingController nameController = TextEditingController();
  TextEditingController codecontroller = TextEditingController();
  TextEditingController positioncontoller = TextEditingController();
  TextEditingController territoryidcontoller = TextEditingController();
  TextEditingController territorynamecontoller = TextEditingController();
  TextEditingController branchidcontroller = TextEditingController();
  TextEditingController bplnamecontoller = TextEditingController();
  TextEditingController bplshortnamecontroller = TextEditingController();
  TextEditingController expensegroupcontroller = TextEditingController();
  TextEditingController expenseflagcontroller = TextEditingController();
  String name = "",
      code = "",
      pos = "",
      terid = "",
      tername = "",
      branid = "",
      bplname = "",
      bplsname = "",
      expgrp = "",
      expflag = "";
    // ignore: prefer_typing_uninitialized_variables
    var data;
 Future<void> api() async {
    http.Response response = await http.get(Uri.parse(
        'http://edp.evyolgroup.com//Service1.asmx/GetLoginInformation?UserName=1594&Password=9753&DbEngine=HANA&Token=\$\$\$&CompanyName=E&UserType=E '));
    if (response.statusCode == 200) {
      setState(() {
       data = response.body;
       name = jsonDecode(data)[0]["Name"].toString();
      });
    }
  }
  @override
  void initState() {
    api();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Text(
                "Name:",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.left,
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  controller: nameController,
                  decoration:  InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: name,
                    hintText: 'Enter Name',
                  ),
                ),
              ),
               const Text(
                "Code",
                style: TextStyle(fontSize: 18),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  controller: codecontroller,
                  decoration:  const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'code',
                    hintText: 'Enter Code',
                  ),
                ),
              ),
              const Text(
                "Position:",
                style: TextStyle(fontSize: 18),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  controller: positioncontoller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Position',
                    hintText: 'Enter Position',
                  ),
                ),
              ),
              const Text(
                "TerritoryID:",
                style: TextStyle(fontSize: 18),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  controller: territoryidcontoller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'TerritoryID',
                    hintText: 'Enter TerritoryID',
                  ),
                ),
              ),
              const Text(
                "TerritoryName:",
                style: TextStyle(fontSize: 18),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  controller: territorynamecontoller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'TerritoryName',
                    hintText: 'Enter TerritoryName',
                  ),
                ),
              ),
              const Text(
                "BranchId:",
                style: TextStyle(fontSize: 18),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  controller: branchidcontroller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'BranchId',
                    hintText: 'Enter BranchId',
                  ),
                ),
              ),
              const Text(
                "BPLName:",
                style: TextStyle(fontSize: 18),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  controller: bplnamecontoller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'BPLName',
                    hintText: 'Enter BPLName',
                  ),
                ),
              ),
              const Text(
                "BPLShortName:",
                style: TextStyle(fontSize: 18),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  controller: bplshortnamecontroller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'BPLShortName',
                    hintText: 'Enter BPLShortName',
                  ),
                ),
              ),
              const Text(
                "EXPENSEGROUP:",
                style: TextStyle(fontSize: 18),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  controller: expensegroupcontroller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'EXPENSEGROUP',
                    hintText: 'Enter EXPENSEGROUP',
                  ),
                ),
              ),
              const Text(
                "EXPENSEFLAG:",
                style: TextStyle(fontSize: 18),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  controller: expenseflagcontroller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'EXPENSEFLAG',
                    hintText: 'Enter EXPENSEFLAG',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
