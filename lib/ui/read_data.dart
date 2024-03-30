import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:namer_app/ui/write_data.dart';


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
    var size = MediaQuery.of(context).size; 

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Records"),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('records').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot?> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          // Use ?. operator to access docs safely
          return GridView.builder(

            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1, // Number of columns
              crossAxisSpacing: 1.0, // Spacing between columns
              mainAxisSpacing: 1.0, // Spacing between rows
              childAspectRatio: (size.width / 50.0),
            ),

            padding: EdgeInsets.all(8.0),

            itemCount: snapshot.data!.docs.length,

            itemBuilder: (BuildContext context, int index) {
              // Retrieve data from Firestore documents
              var document = snapshot.data!.docs[index];
              var name = document['name'];
              var bike = document['bike'];
              var start = document['start'];

              // Return a widget for each item
              return Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(name),
                    Text(bike),
                    Text(start),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
           Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Writedata()),
              );
        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat, 
    );
  }
}
