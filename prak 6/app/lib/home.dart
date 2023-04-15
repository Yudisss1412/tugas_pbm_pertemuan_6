import 'dart:math';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double bmiresult = 0.0;

  void getBMIResult() {
    if (weightController.text.isNotEmpty && heightController.text.isNotEmpty) {
      setState(() {
        bmiresult = double.parse(weightController.text) /
            (pow((double.parse(heightController.text) / 100), 2));
      });
    }
  }

  final weightController = TextEditingController();
  final heightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final name = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("BMI Calculator"),
        actions: [
          IconButton(
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, '/login'),
              icon: const Icon(Icons.logout))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              const Text(
                'Welcome,',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              ),
              Text(
                name,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              ),
              const SizedBox(
                height: 100,
              ),
              TextField(
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: "Weight (kg)"),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: heightController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: "Height (cm)"),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: getBMIResult, child: const Text('Get BMI Result')),
              const SizedBox(
                height: 40,
              ),
              const Text(
                'Your BMI result :',
                style: TextStyle(fontSize: 20),
              ),
              Text(bmiresult.toStringAsFixed(2),
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
