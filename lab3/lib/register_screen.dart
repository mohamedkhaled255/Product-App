import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lab3/login_screen.dart';

class RegisterScreen extends StatefulWidget {
   const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
   bool ispasswordVisible = true;

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formkey = GlobalKey();

  @override
   Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(),
        body: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                spacing: 20,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Register",
                    style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email must not be empty";
                      }
      
                    /*  final bool emailValid = RegExp(
                        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                      ).hasMatch(value);
      
                      if (!emailValid) {
                        return "Please enter a valid email";
                      }*/
      
                      return null;
                    },
                    inputFormatters: [FilteringTextInputFormatter.deny('')],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                      hintText: "Email",
                      labelText: "Email",
                    ),
                  ),
                  TextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: ispasswordVisible,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password must not be empty';
                      }
      
                    /*  final bool passwordValid = RegExp(
                        r'^[0-9]{6,}$',
                      ).hasMatch(value);
      
                      if (!passwordValid) {
                        return 'Password must be at least 6 digits and only numbers';
                      }
      */
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "password",
                      hintText: "password",
                      prefixIcon: Icon(Icons.password),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            ispasswordVisible = !ispasswordVisible;
                          });
                        },
                        icon: Icon(
                          ispasswordVisible == true
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue,
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        if(formkey.currentState!.validate()){
                        print("Email ${emailController.text}");
                        print("password ${passwordController.text}");
                        FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text);
                       }
                      },
                      child: Text(
                        "Register",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
      
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        " have an account?",
                        style: TextStyle(fontSize: 25),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder:  (context)=>LoginScreen()));
                        },
                        child: Text(
                          "login Now",
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                    ],
                  ),
                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
