import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/components/app_colors_component.dart';
import 'package:shop_app/widgets/userdata_form.dart';

class UserDataScreen extends StatelessWidget {

  const UserDataScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      
      designSize: const Size(375, 750),
      builder: () => Scaffold(

        backgroundColor: AppColorsComponent.startScreenScaffoldColor,

        body: SafeArea(
          
          child: SingleChildScrollView(
        
            child: Padding(
        
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
        
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
        
                  SizedBox(height: 50.h),
        
                  Text(
        
                    "Submit the form to continue",
                    style: GoogleFonts.nunito(color: AppColorsComponent.startScreenTextColor, fontSize: 22.sp, fontWeight: FontWeight.w700),
                  ),
        
                  SizedBox(height: 8.h),
        
                  Text(
        
                    "We don't share your information with anyone.",
                    style: GoogleFonts.nunito(color: AppColorsComponent.startScreenSloganColor, fontSize: 15.sp, fontWeight: FontWeight.w600),
                  ),
        
                  SizedBox(height: 50.h),
        
                  const Center(
        
                    child: UserDataForm(),
                  ),

                  SizedBox(height: 20.h)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}