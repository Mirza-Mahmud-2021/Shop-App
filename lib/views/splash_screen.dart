import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/components/app_colors_component.dart';
import 'package:shop_app/views/start_screen.dart';

class SplashScreen extends StatefulWidget {

  const SplashScreen({ Key? key }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    
    Timer(

      const Duration(seconds: 3), (){

        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const StartScreen()));
      }
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      
      designSize: const Size(375, 750),
      builder: () => Scaffold(

        backgroundColor: AppColorsComponent.scaffoldBackground,

        body: SafeArea(

          child: Center(

            child: Column(

              mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Image.asset("assets/icons/shop.png", height: 150.h, width: 150.w),

                SizedBox(height: 20.h),

                Text(

                  "Shop App", textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(color: AppColorsComponent.appNameColor, fontSize: 24.sp, fontWeight: FontWeight.w600),
                ),

                SizedBox(height: 8.h),

                Text(

                  "An exciting place for the whole family to shop", textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(color: AppColorsComponent.appNameSologanColor, fontSize: 15.sp, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}