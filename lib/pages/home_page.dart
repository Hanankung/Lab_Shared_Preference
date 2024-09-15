import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:labshared_pref/pages/another_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ตัวแปรสำหรับเก็บข้อมูลชื่อ
  String? myname;

  // ฟังก์ชันโหลดข้อมูลจาก SharedPreferences
  void loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      myname = prefs.getString("myName");
    });
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home Page",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 212, 98, 240), // สี AppBar
      ),
      backgroundColor: Colors.pink[50], // สีพื้นหลังของ Scaffold
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // แสดงชื่อที่ดึงมาจาก SharedPreferences
              Container(
                padding: const EdgeInsets.all(35.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3), // ตำแหน่งเงา
                    ),
                  ],
                ),
                child: Text(
                  myname ?? "โปรดรอสักครู่...",
                  style: const TextStyle(
                    fontSize: 30,
                    color: Color.fromARGB(255, 223, 98, 240),
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 30), // ระยะห่างระหว่างองค์ประกอบ
              // ปุ่มไปที่หน้า Another Page
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AnotherPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: const Color.fromARGB(255, 216, 98, 240), // สีพื้นหลังปุ่ม
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                ),
                icon: const Icon(Icons.navigate_next, color: Colors.white),
                label: const Text(
                  'ถัดไป',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
