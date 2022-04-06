import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/components/app_colors_component.dart';

class LoginRegisterTopWidget extends StatelessWidget {

  final String screenName;
  final String screenSlogan;

  const LoginRegisterTopWidget({ Key? key, required this.screenName, required this.screenSlogan }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(

            screenName, style: GoogleFonts.nunito(color: AppColorsComponent.startScreenTextColor, fontSize: 22.sp, fontWeight: FontWeight.w600),
          ),

          SizedBox(height: 8.h),

          Text(

            screenSlogan, style: GoogleFonts.nunito(color: Colors.black, fontSize: 15.sp, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}