import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NameController = TextEditingController();
  final EmailController = TextEditingController();
  final MobileController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: NameController,
              decoration: InputDecoration(hintText: "Name"),
            ),
            TextField(
              controller: EmailController,
              decoration: InputDecoration(hintText: "Email"),
            ),
            TextField(
              controller: MobileController,
              decoration: InputDecoration(hintText: "Mobile"),
            ),
            ElevatedButton(
                onPressed: () {
                  // var collection_ref =
                  //     FirebaseFirestore.instance.collection('client');
                  // collection_ref.add({
                  //   'name': NameController.text,
                  //   'Email': EmailController.text,
                  //   "mobile": MobileController.text
                  // });

                  Future<void> add_data_to_db() async {
                    CollectionReference collection_ref =
                        FirebaseFirestore.instance.collection('client');
                    Map<String, String> data_map = {
                      'Name': NameController.text,
                      'Email': EmailController.text,
                      "Mobile": MobileController.text
                    };
                    await collection_ref.add(data_map);
                  }

                  add_data_to_db();
                },
                child: Text('add')),
          ],
        ),
      ),
    );
  }
}
