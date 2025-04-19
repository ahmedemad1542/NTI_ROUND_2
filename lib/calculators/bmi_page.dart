import 'package:flutter/material.dart';

class BmiPage extends StatefulWidget {
  @override
  _BmiPageState createState() => _BmiPageState();
}

class _BmiPageState extends State<BmiPage> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  double bmi = 0;
  String bmiMessage = "";

  void calculateBMI() {
    double height = double.tryParse(heightController.text) ?? 0;
    double weight = double.tryParse(weightController.text) ?? 0;

    if (height > 0 && weight > 0) {
      double heightInMeters = height / 100;
      setState(() {
        bmi = weight / (heightInMeters * heightInMeters);

        // تحديد الرسالة بناءً على قيمة BMI
        if (bmi < 18.5) {
          bmiMessage = "أنت تحت الوزن المطلوب، يجب أن تزيد من سعراتك الحرارية.";
        } else if (bmi >= 18.5 && bmi < 25.0) {
          bmiMessage = "أنت في الوزن المثالي، استمر في الحفاظ على صحتك!";
        } else {
          bmiMessage =
              "لابد أن تنقص القليل من وزنك، حاول تقليل السعرات الحرارية واتبع حمية غذائية!";
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("حاسبة مؤشر كتلة الجسم")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: heightController,
              decoration: InputDecoration(labelText: "الطول (سم)"),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: weightController,
              decoration: InputDecoration(labelText: "الوزن (كجم)"),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: calculateBMI, child: Text("احسب BMI")),
            SizedBox(height: 20),
            Text(
              "مؤشر كتلة الجسم: ${bmi.toStringAsFixed(2)}",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              bmiMessage,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
