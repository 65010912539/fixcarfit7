import 'package:flutter/material.dart';

class BookingServiceScreen extends StatefulWidget {
  const BookingServiceScreen({super.key});

  @override
  _BookingServiceScreenState createState() => _BookingServiceScreenState();
}

class _BookingServiceScreenState extends State<BookingServiceScreen> {
  // เก็บชื่อบริการที่เลือก
  final List<String> services = [
    'เปลี่ยนน้ำมันเครื่อง',
    'เปลี่ยนยาง',
    'ล้างรถ',
    'ทำสี',
    'วัดไมล์',
    'ตั้งศูนย์ล้อ',
    'แต่งรถ',
    'ลงเคลือบแก้ว',
    'ฝากขาย',
    'ตรวจเช็คเครื่องยนต์',
    'เปลี่ยนผ้าเบรก',
    'ล้างระบบแอร์',
    'เปลี่ยนแบตเตอรี่',
    'ซ่อมระบบไฟฟ้า',
    'เช็คช่วงล่าง',
    'บริการขัดเคลือบสีรถ',
    'บริการเปลี่ยนยางอะไหล่',
    'บริการพ่นกันสนิม',
    'บริการล้างตู้แอร์',
  ];

  List<String> selectedServices = []; // เก็บบริการที่ถูกเลือก

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('บริการจอง'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'เลือกบริการที่ต้องการ:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: services.map((service) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 16.0), // เพิ่มระยะห่าง
                    child: SizedBox(
                      width: double.infinity, // ให้ปุ่มกว้างเต็มขอบจอ
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: selectedServices.contains(service)
                              ? Colors.blue
                              : Colors.grey, // เปลี่ยนสีตามสถานะ
                          foregroundColor: Colors.white, // สีตัวหนังสือ
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(8), // ความเหลี่ยมของปุ่ม
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 20), // ความสูงของปุ่ม
                        ),
                        onPressed: () {
                          _onServiceSelected(
                              service); // เรียกใช้ฟังก์ชันเมื่อกดปุ่ม
                        },
                        child: Text(service,
                            style: const TextStyle(
                                fontSize: 16)), // แสดงชื่อบริการ
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // ไม่ทำการนำทางไปที่หน้า PaymentScreen
                if (selectedServices.isNotEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text(
                            'บริการที่เลือก: ${selectedServices.join(', ')}')),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('กรุณาเลือกบริการ')));
                }
              },
              child: const Text('ยืนยัน'),
            ),
          ),
        ],
      ),
    );
  }

  void _onServiceSelected(String serviceName) {
    setState(() {
      if (selectedServices.contains(serviceName)) {
        selectedServices.remove(serviceName); // ลบบริการที่ไม่เลือก
      } else {
        selectedServices.add(serviceName); // เพิ่มบริการที่เลือก
      }
    });
  }
}
