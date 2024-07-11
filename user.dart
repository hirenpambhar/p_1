// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:p_1/user2.dart';
import 'package:http/http.dart' as http;
import 'package:p_1/user3.dart';

class User extends StatefulWidget {
  const User({super.key});

  @override
  State<User> createState() => _Doc2State();
}

class _Doc2State extends State<User> {
  var name = TextEditingController();
  var password = TextEditingController();
  bool _obsecuretext = true;
  Future<void> insert() async {
    if (name.text != "" || password.text != "") {
      try {
        String uri = "http://192.168.1.9/user_api/user_data.php";
        var res = await http.post(Uri.parse(uri), body: {
          "name": name.text,
          "password": password.text,
        });

        var response = jsonDecode(res.body);

        if (response["success"] == "true") {
          print("inserted");
        } else {
          print("Some Isssue");
        }
      } catch (e) {
        print(e);
      }
    } else {
      print("Please Fill All Fields");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purple[50],
        body: SingleChildScrollView(
          child: SafeArea(
              child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.file(
                  File("E:/projects/p_1/assets/images/doctor-5.png"),
                  width: 300,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Log In User",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Welcome back you've been missed!",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: name,
                    decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Enter Name",
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: password,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 10),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "Enter Password",
                      hintStyle: const TextStyle(color: Colors.grey),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obsecuretext
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _obsecuretext = !_obsecuretext;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () {
                      insert();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const User3()));
                    },
                    child: const Text(
                      "Login here",
                      style: TextStyle(fontSize: 25, color: Colors.blue),
                    )),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(fontSize: 25, color: Colors.black),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const User2()));
                        },
                        child: const Text(
                          "Ragister",
                          style: TextStyle(fontSize: 25, color: Colors.black),
                        ))
                  ],
                )
              ],
            ),
          )),
        ));
  }
}
