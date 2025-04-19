import 'package:flutter/material.dart';
import 'package:medease1/pages/chatbot_page.dart';
import 'pages/welcome_page.dart';
import 'pages/register_page.dart';
import 'pages/login_page.dart';
import 'calculators/bmi_page.dart';
import 'calculators/calorie_page.dart';
import 'calculators/calculators_page.dart';
import 'pages/diseases_page.dart';
import 'pages/advices_page.dart';
import 'pages/lab_test_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MedEase',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: WelcomePage(),
      routes: {
        "/register": (context) => RegisterPage(),
        "/login": (context) => LoginPage(),
        "/calculator": (context) => CalculatorsPage(),
        "/bmi": (context) => BmiPage(),
        "/calories": (context) => CaloriePage(),
        "/diseases": (context) => DiseasesPage(),
        "/advices": (context) => AdvicesPage(),
        "/chatbot": (context) => ChatbotPage(),
        "/labtest": (context) => LabTestsPage(),
      },
    );
  }
}

// up