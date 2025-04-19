import 'package:flutter/material.dart';
import 'chatbot_page.dart';

class HomeMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool exitApp = await _showExitDialog(context);
        return exitApp;
      },
      child: Scaffold(
        appBar: AppBar(title: Text("الرئيسية"), backgroundColor: Colors.blue),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  " MedEase! مرحبا بك في ",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: Text(
                  "اختر ما تحتاجه من الخيارات التالية",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: [
                    _buildHomeCard(
                      Icons.local_hospital,
                      "الأمراض",
                      context,
                      "/diseases",
                    ),
                    _buildHomeCard(
                      Icons.health_and_safety,
                      "التحاليل",
                      context,
                      "/labtest",
                    ),
                    _buildHomeCard(
                      Icons.calculate,
                      "حاسبات طبية",
                      context,
                      "/calculator",
                    ),
                    _buildHomeCard(
                      Icons.smart_toy,
                      "Chatbot",
                      context,
                      "/chatbot",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHomeCard(
    IconData icon,
    String title,
    BuildContext context,
    String route,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Colors.blue),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> _showExitDialog(BuildContext context) async {
    return await showDialog(
          context: context,
          builder:
              (context) => AlertDialog(
                title: Text("تأكيد الخروج"),
                content: Text("هل تريد الخروج من التطبيق؟"),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: Text("إلغاء"),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: Text("نعم"),
                  ),
                ],
              ),
        ) ??
        false;
  }
}
