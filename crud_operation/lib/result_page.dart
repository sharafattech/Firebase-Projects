import 'package:crud_operation/fetch_data.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  final phone_number = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: phone_number,
              decoration: InputDecoration(
                hintText: 'Phone Number',
                labelText: 'Enter Phone Number',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                final phone = phone_number.text.trim();
                if (phone.isNotEmpty) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FetchData(PhoneNumber: phone),
                      ));
                }
              },
              child: Text('Get Result'))
        ],
      )),
    );
  }
}
