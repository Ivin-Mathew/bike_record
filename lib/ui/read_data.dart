import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class ReadData extends StatelessWidget {
  const ReadData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase',
      home: _ReadDataState(),
    );
  }
}

class _ReadDataState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Records"),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('data').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot?> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          // Use ?. operator to access docs safely
          return ListView(
            children: snapshot.data?.docs.map((document) {
              return Container(
                child: Center(child: Text(document['text'])),
              );
            }).toList() ?? [], // Provide a default value if snapshot.data is null
          );
        },
      ),
    );
  }
}
