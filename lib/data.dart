import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myproject/home.dart';

class Datasrc extends StatefulWidget {
  const Datasrc({super.key});

  @override
  State<Datasrc> createState() => _DatasrcState();
}

class _DatasrcState extends State<Datasrc> {
  TextEditingController citycontroller = TextEditingController();
  TextEditingController countrycontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  DateTime? _selectedDate;
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
      hijri = "";

  var data;
  final box = Hive.box("Box");

  String returnDate(DateTime datepick) {
    String resultString = '';
    var convert = DateFormat('dd-MM-yyyy');

    resultString = convert.format(datepick);
    return resultString;
  }

  void _presentDatePicker() {
    // showDatePicker is a pre-made funtion of Flutter
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(DateTime.now().year + 1))
        .then((pickedDate) {
      // Check if no date is selected
      if (pickedDate == null) {
        return;
      }
      setState(() {
        // using state so that the UI will be rerendered when date is picked
        _selectedDate = pickedDate;
      });
    });
  }

  Future<void> api() async {
    http.Response response = await http.get(Uri.parse(
        'http://api.aladhan.com/v1/timingsByCity/13-02-2024?city=Multan&country=Pakistan&method=8'));
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
        frstthird =
            jsonDecode(data)["data"]["timings"]["Firstthird"].toString();
        lstthird = jsonDecode(data)["data"]["timings"]["Lastthird"].toString();
        hijri = jsonDecode(data)["data"]["date"]["hijri"]["date"].toString();
      });
      // ignore: use_build_context_synchronously
      box.putAll({
        "City": citycontroller.text,
        "Country": countrycontroller.text,
        "Email": emailcontroller.text,
      });
      Navigator.push<void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => Project(
            fajr: fajr,
            sunrise: sunrise,
            dhuhr: dhuhr,
            asr: asr,
            sunset: sunset,
            maghrib: maghrib,
            isha: isha,
            imsak: imsak,
            midnight: midnight,
            frstthird: frstthird,
            lstthird: lstthird,
            hijri: hijri,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        children: [
          GestureDetector(
              onTap: () {
                _presentDatePicker();
              },
              child: Text(_selectedDate.toString())),
          Row(
            children: [
              const Text(
                "Email",
                style: TextStyle(color: Color.fromARGB(255, 255, 230, 0)),
              ),
              const Text(
                textAlign: TextAlign.left,
                "City",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            style: const TextStyle(color: Colors.white),
            controller: citycontroller,
            decoration: const InputDecoration(
              hintStyle: TextStyle(color: Colors.white),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              hintText: 'Enter City',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Row(
            children: [
              Text(
                textAlign: TextAlign.left,
                "Country",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            style: const TextStyle(color: Colors.white),
            controller: countrycontroller,
            decoration: const InputDecoration(
              hintStyle: TextStyle(color: Colors.white),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              hintText: 'Enter Country',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                if (citycontroller.text.isNotEmpty &&
                    countrycontroller.text.isNotEmpty &&
                    _selectedDate != null) {
                  api();
                }
              },
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: const BorderSide(
                              color: Color.fromARGB(255, 255, 230, 0)))),
                  backgroundColor: const MaterialStatePropertyAll(
                      Color.fromARGB(255, 255, 230, 0))),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 100),
                child: Text(
                  "Sign up",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
