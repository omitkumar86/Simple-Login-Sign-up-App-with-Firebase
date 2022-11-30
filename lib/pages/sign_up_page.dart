import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:simple_login_app/const/style.dart';
import 'package:simple_login_app/pages/signin_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  Future addUser() async {
    CollectionReference _user =
        FirebaseFirestore.instance.collection("sign_up");

    return _user.add(({
      "name": _nameController.text,
      "email": _emailController.text,
      "phone": _phoneController.text,
      "age": _ageController.text,
      "address": _addressController.text,
    }));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Sign Up",
                    style: myStyle(25.sp, Color(0xff008000), FontWeight.w700),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Create a new account",
                    style: myStyle(16.sp, Colors.black54, FontWeight.w700),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      suffix: Icon(
                        Icons.person_outline,
                        color: Colors.black,
                        size: 18.sp,
                      ),
                      contentPadding: EdgeInsets.only(left: 20, right: 20),
                      hintText: "Full Name",
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.3),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(50.r)),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      suffix: Icon(
                        Icons.email_outlined,
                        color: Colors.black,
                        size: 18.sp,
                      ),
                      contentPadding: EdgeInsets.only(left: 20, right: 20),
                      hintText: "Email",
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.3),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(50.r)),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextField(
                    controller: _phoneController,
                    decoration: InputDecoration(
                      suffix: Icon(
                        Icons.call,
                        color: Colors.black,
                        size: 18.sp,
                      ),
                      contentPadding: EdgeInsets.only(left: 20, right: 20),
                      hintText: "Mobile",
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.3),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(50.r)),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextField(
                    controller: _ageController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 20, right: 20),
                      hintText: "Age",
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.3),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(50.r)),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextField(
                    controller: _addressController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 20, right: 20),
                      hintText: "Address",
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.3),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(50.r)),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      suffix: Icon(
                        Icons.visibility_off_outlined,
                        color: Colors.black,
                        size: 18.sp,
                      ),
                      contentPadding: EdgeInsets.only(left: 20, right: 20),
                      hintText: "Password",
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.3),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(50.r)),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      suffix: Icon(
                        Icons.visibility_off_outlined,
                        color: Colors.black,
                        size: 18.sp,
                      ),
                      contentPadding: EdgeInsets.only(left: 20, right: 20),
                      hintText: "Confirm Password",
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.3),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(50.r)),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  InkWell(
                    onTap: () {
                      addUser();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SignInPage()));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(50.r)),
                      child: Text(
                        "Sign Up",
                        style: myStyle(20.sp, Colors.white, FontWeight.w700),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: myStyle(16.sp, Colors.black54, FontWeight.w700),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SignInPage()));
                        },
                        child: Text(
                          "Sign In",
                          style: myStyle(18.sp, Colors.blue.withOpacity(0.8),
                              FontWeight.w700),
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
