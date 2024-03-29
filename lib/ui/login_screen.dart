import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:namer_app/ui/profile_screen.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  //login function
  static Future<User?> loginUsingEmailPassword({required String email, required String password, required BuildContext context}) async{
    FirebaseAuth auth =FirebaseAuth.instance;
    User? user;
    try{
      UserCredential userCredential= await auth.signInWithEmailAndPassword(email: email, password: password);
      user= userCredential.user;

    }on FirebaseAuthException catch (e){
      if(e.code== "user-not-found"){
        print("No user found");
      }
    }
  return user;
}

  @override
  Widget build(BuildContext context) {

    TextEditingController _emailController= TextEditingController();
    TextEditingController _passwordController= TextEditingController();


    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "MyApp Title",
             style: TextStyle(
              color: Colors.red, 
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              ),
            ),
          Text(
              "Login to your app",
              style: TextStyle(
                color: Colors.black,
                fontSize: 44.0,
                fontWeight: FontWeight.bold,
              )
          ),
          SizedBox(
              height: 44.0,
          ),

          TextField(
            controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "User Email",
                prefixIcon : Icon(Icons.mail,color: Colors.black)
              ),
          ),

          const SizedBox(
              height: 44.0
          ),
          TextField(
            controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Password",
                prefixIcon: Icon(Icons.password, color:Colors.black)
              ),
          ),


          const SizedBox(
              height: 12.0,
          ),
          
          Text(
              "Forgot Password?",
              style : TextStyle(color: Colors.blue),
          ),

          const SizedBox(
              height:88.0,
          ),

          Container(
            width: double.infinity,
            child: RawMaterialButton(
              fillColor: Color(0xFF0069FE),
              elevation:0.0 ,
              padding: EdgeInsets.symmetric(vertical:20.0),
              shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(12.0)),
              onPressed: () async{
                User? user= await loginUsingEmailPassword(email: _emailController.text, password: _passwordController.text, context: context);
                if(user!=null){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>ProfileScreen()));
                }
              },
              child: Text("Login", style:TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              )),
            ),
          ),




        ]
      )
    );
  }
}
