import 'package:flutter/material.dart';

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kritik dan Saran'),
        titleTextStyle: TextStyle(fontSize: 30),
        backgroundColor: Colors.brown,
      ),
      backgroundColor: const Color.fromRGBO(25, 25, 25, 25),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Kritik dan Saran Mata Kuliah',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 26),
              Text(
                'Kritik :',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 15),
              Text(
                'Kritik saya untuk matakuliah Teknologi Pemrograman Mobile (TPM) adalah dalam proses pembelajaran ini sangat banyak praktikalnya sehingga dosen memberikan tugas-tugas praktikal, tetapi tugas praktikal sedikit lebih cepat daripada praktikum sehingga tugas sedikit lebih sulit daripada praktikum',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 15),
              Text(
                'Saran :',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 15),
              Text(
                'Saran saya mungkin dalam proses pembalajaran selanjutnya dapat berjalan bersamaan dengan praktikum agar praktikal diterima dari praktikum dan belajar implementasi di teori sehingga tugas yang diberikan tidak terlalu sulit. Secara keseluruhan Matakuliah ini sangat bermanfaat untuk karir kedepannya. TERIMAKASIH',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
