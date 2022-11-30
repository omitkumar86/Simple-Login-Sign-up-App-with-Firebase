import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:simple_login_app/const/style.dart';
import 'package:simple_login_app/firebase_helper.dart';
import 'package:simple_login_app/pages/sign_up_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

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
                  Container(
                    height: 150.h,
                    width: 260.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(70.r),
                            bottomLeft: Radius.circular(70.r)),
                        color: Color(0xff000080).withOpacity(0.7)),
                    child: Lottie.asset("assets/login.json",
                        height: 50.h, repeat: true, reverse: true),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "Sign In",
                    style: myStyle(25.sp, Color(0xff008000), FontWeight.w700),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Please login to your account",
                    style: myStyle(16.sp, Colors.black54, FontWeight.w700),
                  ),
                  SizedBox(
                    height: 20.h,
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
                      hintText: "Enter Your Email",
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
                      hintText: "Enter Your Password",
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Forgot Password?",
                        style: myStyle(18.sp, Colors.blue.withOpacity(0.8),
                            FontWeight.w700),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  InkWell(
                    onTap: () {
                      FirebaseHelper firebaseHelper = FirebaseHelper();
                      var email = _emailController.text;
                      var password = _passwordController.text;
                      firebaseHelper.signIn(email, password, context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(50.r)),
                      child: Text(
                        "Sign In",
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
                        "Don't have an account? ",
                        style: myStyle(16.sp, Colors.black54, FontWeight.w700),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SignUpPage()));
                        },
                        child: Text(
                          "Sign Up",
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
