import 'package:flutter/material.dart'; 
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:namer_app/ui/read_data.dart'; 

class Writedata extends StatefulWidget {
  const Writedata({Key? key}) : super(key: key);

  @override
  State<Writedata> createState() => _WritedataState();
}

class _WritedataState extends State<Writedata> {
  TextEditingController _name= TextEditingController();
  TextEditingController _start= TextEditingController();
  String? _bike; // Move the declaration here

  @override 
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ReadData()),
            );
          },
        ),
        title: Text('Add Record'),
        backgroundColor: Colors.blue,
      ),
      body: Padding( 
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            SizedBox(
              height: 44.0,
            ),
            TextField(
              controller: _name,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                hintText: "Name",
                prefixIcon : Icon(Icons.person,color: Colors.black)
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Radio<String>(
                  value: "FZ",
                  groupValue: _bike,
                  onChanged: (value) {
                    setState(() {
                      _bike = value;
                    });
                  },
                ),
                Text('FZ'),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Radio<String>(
                  value: 'Glamour',
                  groupValue: _bike,
                  onChanged: (value) {
                    setState(() {
                      _bike = value;
                    });
                  },
                ),
                Text('Glamour'),
              ],
            ),
            SizedBox(
              height: 44.0,
            ),
            TextField(
              controller: _start,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                hintText: "Start Distance",
                prefixIcon : Icon(Icons.play_circle_outline_outlined,color: Colors.black)
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            FloatingActionButton( 
              backgroundColor: Color.fromARGB(255, 21, 48, 227), 
              child: Icon(Icons.add), 
              onPressed: () { 
                FirebaseFirestore.instance 
                    .collection('records') 
                    .add({'name': _name.text, "bike":_bike, "start":_start.text}); 
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReadData()),);
              }, 
            ), 
          ]
        ),
      ),
    ); 
  } 
}
