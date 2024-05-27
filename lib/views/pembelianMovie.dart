import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:proyek_mobile_danielhanselc_123210063/models/DetailUserModel.dart';
import 'package:proyek_mobile_danielhanselc_123210063/views/homepage.dart';

class PurchaseDetailPage extends StatefulWidget {
  final Movie movieData;

  const PurchaseDetailPage({Key? key, required this.movieData})
      : super(key: key);

  @override
  _PurchaseDetailPageState createState() => _PurchaseDetailPageState();
}

class _PurchaseDetailPageState extends State<PurchaseDetailPage> {
  String selectedCurrency = 'IDR';
  late double priceInIDR;
  String selectedTimezone = 'WIB';
  DateTime purchaseTime = DateTime.now();
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  Map<String, double> currencyRates = {
    'IDR': 1,
    'USD': 0.00007,
    'EUR': 0.00006,
  };

  Map<String, String> timezoneOffsets = {
    'WIB': '+07:00',
    'WITA': '+08:00',
    'WIT': '+09:00',
    'LONDON': '+00:00',
  };

  @override
  void initState() {
    super.initState();
    setPriceBasedOnYear(widget.movieData.year);
  }

  void setPriceBasedOnYear(String? year) {
    if (year != null) {
      int releaseYear = int.parse(year);
      if (releaseYear > 2022) {
        priceInIDR = 150000;
      } else if (releaseYear >= 2020 && releaseYear <= 2022) {
        priceInIDR = 100000;
      } else {
        priceInIDR = 50000;
      }
    } else {
      priceInIDR = 50000;
    }
  }

  double get convertedPrice =>
      priceInIDR * (currencyRates[selectedCurrency] ?? 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text('Detail Pembelian Film',
            style: TextStyle(color: Colors.white)),
      ),
      body: Container(
        color: const Color.fromRGBO(25, 25, 25, 25),
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'Nama Film: ${widget.movieData.title}',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 10),
            Image.network(
              widget.movieData.poster!,
              height: 150,
            ),
            SizedBox(height: 10),
            TextField(
              controller: usernameController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Nama Pengguna',
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: emailController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Harga:',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                DropdownButton<String>(
                  value: selectedCurrency,
                  dropdownColor: Colors.brown,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedCurrency = newValue!;
                    });
                  },
                  items: currencyRates.keys.map((String key) {
                    return DropdownMenuItem<String>(
                      value: key,
                      child: Text(key, style: TextStyle(color: Colors.white)),
                    );
                  }).toList(),
                ),
                Text(
                  '${convertedPrice.toStringAsFixed(2)} $selectedCurrency',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Jam Pembelian:',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                DropdownButton<String>(
                  value: selectedTimezone,
                  dropdownColor: Colors.brown,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedTimezone = newValue!;
                    });
                  },
                  items: timezoneOffsets.keys.map((String key) {
                    return DropdownMenuItem<String>(
                      value: key,
                      child: Text(key, style: TextStyle(color: Colors.white)),
                    );
                  }).toList(),
                ),
                Text(
                  DateFormat('yyyy-MM-dd – kk:mm')
                      .format(purchaseTime.toUtc().add(Duration(
                          hours: int.parse(timezoneOffsets[selectedTimezone]!
                              .substring(1, 3)))))
                      .toString(),
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: Colors.brown,
                      title: Text('Notification',
                          style: TextStyle(color: Colors.white)),
                      content: Text('Pembelian Berhasil Silahkan Check Email',
                          style: TextStyle(color: Colors.white)),
                      actions: <Widget>[
                        TextButton(
                          child:
                              Text('OK', style: TextStyle(color: Colors.white)),
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => HomePage()),
                            );
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.brown,
              ),
              child: Text('Buy'),
            ),
          ],
        ),
      ),
    );
  }
}
