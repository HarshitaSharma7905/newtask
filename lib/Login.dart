import 'package:flutter/material.dart';
import 'package:newtaskharshita/Home.dart';
import 'package:newtaskharshita/Signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey=GlobalKey<FormState>();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  //email validator
  bool isValidEmail(String email) {
    // Regular expression for a simple email pattern
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    return emailRegex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        backgroundColor:Colors.blue ,
        title: Text('Login',style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      backgroundColor:Colors.blue ,
      body: Center(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: 450,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: Text('Login', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),)),
                    SizedBox(height: 30,),
                    TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter an email address';
                        }
                        if (!isValidEmail(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null; // Return null to indicate no error
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        fillColor: Colors.white,
                        filled: true,
                        errorStyle: TextStyle(color: Colors.white),
                        hintText: 'Enter Your Email Address',
                        prefixIcon: Icon(Icons.email,color: Colors.black,),
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),


                      ),

                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      controller: passwordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a password';
                        }
                        if (value!.length < 6) {
                          return 'Password must be at least 6 characters long';
                        }
                        // You can add more validation criteria here, such as requiring special characters, numbers, etc.
                        return null; // Return null to indicate no error

                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        fillColor: Colors.white,
                        filled: true,
                        errorStyle: TextStyle(color: Colors.white),
                        hintText: 'Enter Password',
                        prefixIcon: Icon(Icons.email,color: Colors.black,),
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),


                      ),

                    ),
                    SizedBox(height: 10,),
                    TextButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Signup(),));
                    }, child: Text('Dont have account Sign Up Here',style: TextStyle(color: Colors.black),)),
                    SizedBox(height: 10,),
                    Container(
                      width: 450,
                      height: 40,
                      child: ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.black)),onPressed: () async {
                        if(_formKey.currentState!.validate()){
                          String email=emailController.text.trim();
                          String password=passwordController.text.trim();
                          try{

                            UserCredential userCredential=await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
                            if(userCredential !=null){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Search()));
                            }else
                            {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("Enter Valid Details"),
                              ));
                            }
                          }on FirebaseAuthException catch(err){
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(err.toString()),
                            ));
                          }
                        }
                      },child: Text('Login')),
                    )


                  ],),
              ),
            ),
          )
      ),
    );
  }
}
