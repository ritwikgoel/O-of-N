// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;

class bionicpage extends StatefulWidget {
  const bionicpage({Key? key}) : super(key: key);

  @override
  State<bionicpage> createState() => _bionicpageState();
}

/*
const req = unirest("POST", "https://bionic-reading1.p.rapidapi.com/convert");

req.headers({
	"content-type": "application/x-www-form-urlencoded",
	"X-RapidAPI-Key": "40dacf4c5fmsh5afa0d4cdb8acd2p1a87c8jsne82618c7c2c9",
	"X-RapidAPI-Host": "bionic-reading1.p.rapidapi.com",
	"useQueryString": true
});

 */

class _bionicpageState extends State<bionicpage> {
  //bionify() async {
    // var uri = Uri.https('bionic-reading1.p.rapidapi.com', '/convert', {
    //   "content":
    //       "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.",
    //   "response_type": "html",
    //   "request_type": "html",
    //   "fixation": "1",
    //   "saccade": "10"
    // });

    // final response = await http.post(uri, headers: {
    //   "content-type": "application/x-www-form-urlencoded",
    //   "X-RapidAPI-Key": "40dacf4c5fmsh5afa0d4cdb8acd2p1a87c8jsne82618c7c2c9",
    //   "X-RapidAPI-Host": "bionic-reading1.p.rapidapi.com",
    //   "useQueryString": "true"
    // });
    // print(response.body);

    Future<void> bionify() async {
      final url = Uri.parse("https://bionic-reading1.p.rapidapi.com/convert");
      final headers = {
	"content-type": "application/x-www-form-urlencoded",
	"X-RapidAPI-Key": "40dacf4c5fmsh5afa0d4cdb8acd2p1a87c8jsne82618c7c2c9",
	"X-RapidAPI-Host": "bionic-reading1.p.rapidapi.com",
	"useQueryString": "true"
};
      const json =
          {
	"content": "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.",
	"response_type": "html",
	"request_type": "html",
	"fixation": "1",
	"saccade": "10"
};
      final response = await post(url, headers: headers, body: json);
      String jsonsDataString = response.toString(); // toString of Response's body is assigned to jsonDataString
      
      print(response.body);
      print('Status code: ${response.statusCode}');
      //print(response);
    }
  

  @override
  Widget build(BuildContext context) {
    TextEditingController bionicController = TextEditingController();

    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.black,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 5,
                ),
                Lottie.asset(
                  "assets/magnify.json",
                  height: MediaQuery.of(context).size.height / 5,
                ),
                TextField(
                  // ignore: prefer_const_constructors
                  style: TextStyle(color: Colors.white),
                  controller: bionicController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyan),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyan),
                    ),
                    contentPadding: EdgeInsets.all(30),
                    labelText: 'Enter Text to Bionify!',
                    labelStyle: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontStyle: FontStyle.italic),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 10,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28.0),
                          side: const BorderSide(
                              color: Color.fromARGB(255, 51, 72, 135))),
                      primary: Colors.transparent,
                      minimumSize: const Size(200, 75),
                    ),
                    onPressed: () {
                      bionify();
                    },
                    child: const Text(
                      "Bionify!",
                    )),
              ],
            ),
          )),
    );
  }
}
