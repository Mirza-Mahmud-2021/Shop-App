import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/components/app_colors_component.dart';
import 'package:shop_app/views/register_screen.dart';
import 'package:shop_app/widgets/login_form.dart';
import 'package:shop_app/widgets/login_register_top_widget.dart';

class LoginScreen extends StatefulWidget {

  const LoginScreen({ Key? key }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      
      designSize: const Size(375, 750),
      builder: () => Scaffold(

        backgroundColor: AppColorsComponent.startScreenScaffoldColor,

        body: SingleChildScrollView(

          scrollDirection: Axis.vertical,
          child: Column(
        
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
        
              Container(
        
                height: 300.h, width: MediaQuery.of(context).size.width.w,
                decoration: BoxDecoration(
        
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30.r), bottomRight: Radius.circular(30.r)),
                  image: const DecorationImage(image: AssetImage("assets/images/banner_2.jpg"), fit: BoxFit.fill)
                ),
              ),
        
              SizedBox(height: 20.h),
        
              const LoginRegisterTopWidget(screenName: "Login, Here", screenSlogan: "Enjoy your journey with us"),

              SizedBox(height: 30.h),

              const Center(

                child: Padding(

                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: LoginForm(),
                ),
              ),

              SizedBox(height: 15.h),

              Row(

                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text(

                    "Don't have an Account?", textAlign: TextAlign.center, 
                    style: GoogleFonts.nunito(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w600)
                  ),

                  TextButton(

                    onPressed: (){

                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const RegisterScreen()));
                    },
                    child: Text(
                  
                      "Register", textAlign: TextAlign.center, 
                      style: GoogleFonts.nunito(color: AppColorsComponent.startScreenTextColor, fontSize: 16.sp, fontWeight: FontWeight.w600)
                    ),
                  )
                ],
              ),

              SizedBox(height: 30.h)            
            ],
          ),
        ),
      ),
    );
  }
}