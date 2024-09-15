import 'package:flutter/material.dart';
import 'package:labshared_pref/pages/first_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AnotherPage extends StatefulWidget {
  const AnotherPage({super.key});

  @override
  State<AnotherPage> createState() => _AnotherPageState();
}

class _AnotherPageState extends State<AnotherPage> {
  // ตัวแปรสำหรับเก็บข้อมูล
  String? myname;

  // ฟังก์ชันโหลดข้อมูลจาก SharedPreferences
  void loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      myname = prefs.getString("myName");
    });
  }

  // ฟังก์ชันลบข้อมูลจาก SharedPreferences
  void removeData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("myName");
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
          "Another Page",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 195, 98, 240), // สี AppBar
      ),
      backgroundColor: const Color.fromARGB(255, 248, 228, 252), // สีพื้นหลังของ Scaffold
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // แสดงชื่อที่ดึงมาจาก SharedPreferences
              Container(
                padding: const EdgeInsets.all(30.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 20, 20, 20),
                  borderRadius: BorderRadius.circular(50),
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
                  myname ?? "โปรดรอสักครู่....",
                  style: const TextStyle(
                    fontSize: 30,
                    color: Color.fromARGB(255, 202, 98, 240),
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 50),
              // ปุ่มย้อนกลับ
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: const Color.fromARGB(255, 18, 17, 18), // สีพื้นหลังปุ่ม
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                ),
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                label: const Text(
                  'ย้อนกลับ',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              // ปุ่มไปที่หน้าแรก
              ElevatedButton.icon(
                onPressed: () {
                  removeData();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FirstPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: const Color.fromARGB(255, 27, 26, 27), // สีพื้นหลังปุ่ม
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                icon: const Icon(Icons.home, color: Colors.white),
                label: const Text(
                  'หน้าแรก',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
