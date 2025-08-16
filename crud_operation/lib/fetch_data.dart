// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class SimpleFetch extends StatefulWidget {
//   const SimpleFetch({super.key});

//   @override
//   State<SimpleFetch> createState() => _SimpleFetchState();
// }

// class _SimpleFetchState extends State<SimpleFetch> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Fetch data from DB'), // Added const for AppBar title
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         // Added type annotation for clarity
//         stream: FirebaseFirestore.instance.collection('client').snapshots(),
//         builder: (context, snapshot) {
//           // 1. Show loading indicator while waiting for data
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }

//           // 2. Handle errors if any occur during fetching
//           if (snapshot.hasError) {
//             return Center(
//               child: Text('Error: ${snapshot.error}'),
//             );
//           }

//           // 3. Check if data is null or empty after loading (optional, but good practice)
//           if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//             return const Center(
//               child: Text('No data found.'),
//             );
//           }

//           // Data has arrived and is ready to be displayed
//           var docs = snapshot.data!.docs;
//           return ListView.builder(
//             itemCount: docs.length,
//             itemBuilder: (context, index) {
//               var data = docs[index].data() as Map<String, dynamic>;
//               return ListTile(
//                 title: Text(data['Name'] ?? 'No name found'),
//                 // Corrected the typo here:
//                 subtitle: Text(data['Post'] ?? 'No Email found'),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_operation/home_page.dart';
import 'package:flutter/material.dart';

class FetchData extends StatefulWidget {
  const FetchData({super.key});

  @override
  State<FetchData> createState() => _FetchDataState();
}

class _FetchDataState extends State<FetchData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fetch Data from Firebase'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('client').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(
                    child: Text('No Data found'),
                  );
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Error:${snapshot.error}'),
                  );
                }
                var docs = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: docs.length,
                  itemBuilder: (context, index) {
                    var data = docs[index].data();
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(color: Colors.green),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data['Name'],
                                style: TextStyle(fontSize: 15),
                              ),
                              Text(
                                data['Email'],
                                style: TextStyle(fontSize: 15),
                              ),
                              Text(
                                data['Mobile'],
                                style: TextStyle(fontSize: 15),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ));
              },
              child: Text('add data'))
        ],
      ),
    );
  }
}
