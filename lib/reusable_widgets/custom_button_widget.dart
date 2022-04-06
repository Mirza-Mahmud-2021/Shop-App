import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {

  final String buttonText;
  final Color buttonColor;
  final Color buttonTextColor;
  final VoidCallback onPressed;

  const CustomButton({ 
    Key? key, 
    required this.buttonText, 
    required this.buttonColor, 
    required this.buttonTextColor, 
    required this.onPressed 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SizedBox(

      height: 45.h, width: MediaQuery.of(context).size.width.w,
      child: MaterialButton(
        
        color: buttonColor,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
        onPressed: onPressed,
        child: Text(

          buttonText, textAlign: TextAlign.center,
          style: GoogleFonts.nunito(color: buttonTextColor, fontSize: 16.sp, fontWeight: FontWeight.w600)
        ),
      ),
    );
  }
}