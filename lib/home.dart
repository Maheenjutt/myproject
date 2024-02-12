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
  String fajr = "",
      sunrise = "",
      dhuhr = "",
      asr = "",
      sunset = "",
      maghrib = "",
      isha = "",
      imsak = "",
      midnight = "",
      frstthird = "",
      lstthird = "",
      hijri = "",
      holiday = "";

  // ignore: prefer_typing_uninitialized_variables
  var data;
  Future<void> api() async {
    http.Response response = await http.get(Uri.parse(
        'http://api.aladhan.com/v1/timingsByCity/12-02-2024?city=Multan&country=Pakistan&method=8'));
    if (response.statusCode == 200) {
      setState(() {
        data = response.body;
        fajr = jsonDecode(data)["data"]["timings"]["Fajr"].toString();
        sunrise = jsonDecode(data)["data"]["timings"]["Sunrise"].toString();
        dhuhr = jsonDecode(data)["data"]["timings"]["Dhuhr"].toString();
        asr = jsonDecode(data)["data"]["timings"]["Asr"].toString();
        sunset = jsonDecode(data)["data"]["timings"]["Sunset"].toString();
        maghrib = jsonDecode(data)["data"]["timings"]["Maghrib"].toString();
        isha = jsonDecode(data)["data"]["timings"]["Isha"].toString();
        imsak = jsonDecode(data)["data"]["timings"]["Imsak"].toString();
        midnight = jsonDecode(data)["data"]["timings"]["Midnight"].toString();
        frstthird = jsonDecode(data)["data"]["timings"]["Firstthird"].toString();
        lstthird = jsonDecode(data)["data"]["timings"]["Lastthird"].toString();
        hijri = jsonDecode(data)["year"].toString();
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
              Row(
                children: [
                  const Text(
                    "Fajr:",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Center(child: Text(fajr,style: const TextStyle(fontSize: 24,),)),
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                children: [
                  const Text(
                    "Sunrise:",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Center(child: Text(sunrise,style: const TextStyle(fontSize: 24,),)),
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                children: [
                  const Text(
                    "Dhuhr:",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                   height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Center(child: Text(dhuhr,style: const TextStyle(fontSize: 24,),)),
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                children: [
                  const Text(
                    "Asr:",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Center(child: Text(asr,style: const TextStyle(fontSize: 24,),)),
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                children: [
                  const Text(
                    "Sunset:",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Center(child: Text(sunset,style: const TextStyle(fontSize: 24,),)),
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                children: [
                  const Text(
                    "Maghrib:",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Center(child: Text(maghrib,style: const TextStyle(fontSize: 24,),)),
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                children: [
                  const Text(
                    "Isha:",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                   height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Center(child: Text(isha,style: const TextStyle(fontSize: 24,),)),
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                children: [
                  const Text(
                    "Imsak:",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                   height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Center(child: Text(imsak,style: const TextStyle(fontSize: 24,),)),
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                children: [
                  const Text(
                    "Midnight:",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                   height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Center(child: Text(midnight,style: const TextStyle(fontSize: 24,),)),
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                children: [
                  const Text(
                    "FirstThird:",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Center(child: Text(frstthird,style: const TextStyle(fontSize: 24,),)),
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                children: [
                  const Text(
                    "Lastthird:",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Center(child: Text(lstthird,style: const TextStyle(fontSize: 24,),)),
                  ),
                ],
              ),
              const SizedBox(height: 10,),
               Row(
                children: [
                  const Text(
                    "Hijri:",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Center(child: Text(hijri,style: const TextStyle(fontSize: 24,),)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
