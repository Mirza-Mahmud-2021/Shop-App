import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/components/app_colors_component.dart';
import 'package:shop_app/views/login_screen.dart';
import 'package:shop_app/views/register_screen.dart';
import 'package:shop_app/reusable_widgets/custom_button_widget.dart';

class StartScreen extends StatelessWidget {

  const StartScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      
      designSize: const Size(375, 750),
      builder: () => Scaffold(

        backgroundColor: AppColorsComponent.startScreenScaffoldColor,
        body: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              
              height: 400.h, width: MediaQuery.of(context).size.width.w,
              decoration: BoxDecoration(

                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30.r), bottomRight: Radius.circular(30.r)),
                image: const DecorationImage(

                  image: AssetImage("assets/images/banner_1.jpg"),
                  fit: BoxFit.fill
                )
              ),
            ),

            SizedBox(height: 20.h),

            Padding(

              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(

                "Welcome, User", style: GoogleFonts.nunito(color: AppColorsComponent.startScreenTextColor, fontSize: 22.sp, fontWeight: FontWeight.w600),
              ),
            ),

            SizedBox(height: 8.0.h),

            Padding(

              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(

                "Let's start your journey with us", style: GoogleFonts.nunito(color: AppColorsComponent.startScreenSloganColor, fontSize: 15.sp, fontWeight: FontWeight.w600),
              ),
            ),

            SizedBox(height: 50.h),

            Center(

              child: Padding(

                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(

                  mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    CustomButton(

                      buttonText: "Login",
                      buttonColor: AppColorsComponent.startScreenLoginButtonColor,
                      buttonTextColor: Colors.white,
                      onPressed: (){

                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                      },
                    ),

                    SizedBox(height: 15.h),

                    CustomButton(

                      buttonText: "Register",
                      buttonColor: AppColorsComponent.startScreenRegisterButtonColor,
                      buttonTextColor: Colors.white,
                      onPressed: (){

                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const RegisterScreen()));
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}