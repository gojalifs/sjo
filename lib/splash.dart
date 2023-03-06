import 'dart:async';

import 'package:flutter/material.dart';
import 'package:scaled_app/scaled_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';
import 'page_manager.dart';
import 'pages/login_page.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Timer(const Duration(seconds: 1), getStatus);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).scale(),
      child: Scaffold(
        body: Center(
          child: Image.asset(
            'assets/images/1.png',
            width: 200,
            height: 200,
          ),
        ),
      ),
    );
  }

  void getStatus() async {
    var navigate = Navigator.of(context);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final status = prefs.getString('status');
    if (status == 'logged_in') {
      navigate.pushReplacement(
        MaterialPageRoute(
          builder: (context) => const PageManager(),
        ),
      );
    } else {
      navigate.pushReplacement(
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
      );
    }
  }
}
