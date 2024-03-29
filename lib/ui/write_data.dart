import 'package:flutter/material.dart'; 
import 'package:cloud_firestore/cloud_firestore.dart'; 

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
 @override 
Widget build(BuildContext context) { 

  TextEditingController _name= TextEditingController();
  TextEditingController _bike= TextEditingController();
  TextEditingController _start= TextEditingController();
  TextEditingController _end= TextEditingController();

	return Padding( 
	padding: const EdgeInsets.all(16.0),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children:[
      
    ]

  )


	); 
} 
}