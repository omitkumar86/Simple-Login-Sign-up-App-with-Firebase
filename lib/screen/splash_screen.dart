import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';
import 'package:simple_login_app/const/style.dart';
import 'package:simple_login_app/pages/signin_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(
        Duration(seconds: 6),
        () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => SignInPage())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Lottie.asset("assets/loading1.json", height: 90.h),
        ]),
      ),
    );
  }
}

// viewProgressIndicator() {
//   return SpinKitFadingCircle(
//     itemBuilder: (BuildContext context, int index) {
//       return DecoratedBox(
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           color: index.isEven ? Colors.white : Colors.grey,
//         ),
//       );
//     },
//   );
// }
