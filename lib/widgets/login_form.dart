import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/components/app_colors_component.dart';
import 'package:shop_app/firebase_auth/auth.dart';
import 'package:shop_app/reusable_widgets/custom_button_widget.dart';

class LoginForm extends StatefulWidget {

  const LoginForm({ Key? key }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _obscureText = true;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Form(
      
      key: formKey,
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,
        children: [

          TextFormField(

            style: GoogleFonts.nunito(color: AppColorsComponent.textFieldColor, fontSize: 15.sp, fontWeight: FontWeight.w600),
            cursorColor: AppColorsComponent.textFieldColor,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            controller: emailController,

            decoration: InputDecoration(
            
              icon: Icon(Icons.email_rounded, color: AppColorsComponent.textFieldColor),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.r), borderSide: BorderSide(color: AppColorsComponent.textFieldColor, width: 2)),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20.r), borderSide: BorderSide(color: AppColorsComponent.textFieldColor, width: 2)),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20.r), borderSide: BorderSide(color: AppColorsComponent.textFieldColor, width: 2)),

              hintText: 'Email',
              hintStyle: GoogleFonts.nunito(color: AppColorsComponent.textFieldColor, fontSize: 15.sp, fontWeight: FontWeight.w600)
            ),

            validator: (value){

              if(value!.isEmpty){

                return "Please, enter your email";
              }
              else if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){

                return "Please, use valid email";
              }

              return null;
            },
          ),
          
          SizedBox(height: 20.h),

           TextFormField(
            
            obscureText: _obscureText,
            style: GoogleFonts.nunito(color: AppColorsComponent.textFieldColor, fontSize: 15.sp, fontWeight: FontWeight.w600),
            cursorColor: AppColorsComponent.textFieldColor,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            controller: passwordController,

            decoration: InputDecoration(

              icon: Icon(Icons.password_rounded, color: AppColorsComponent.textFieldColor),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.r), borderSide:  BorderSide(color: AppColorsComponent.textFieldColor, width: 2)),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20.r), borderSide:  BorderSide(color: AppColorsComponent.textFieldColor, width: 2)),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20.r), borderSide:  BorderSide(color: AppColorsComponent.textFieldColor, width: 2)),

              hintText: 'Password',
              hintStyle: GoogleFonts.nunito(color: AppColorsComponent.textFieldColor, fontSize: 15.sp, fontWeight: FontWeight.w600),

              suffixIcon: IconButton(

                icon: _obscureText ? Icon(Icons.visibility_off_rounded, color: AppColorsComponent.loginButtonColor) : Icon(Icons.visibility_rounded, color: AppColorsComponent.loginButtonColor),
                onPressed: (){

                  setState(() {
                    
                    _obscureText = !_obscureText;
                  });
                },
              )
            ),

            validator: (value){

              if(value!.isEmpty){

                return "Please, enter your password.";
              }
              else if(value.length < 6){

                return "Please, use 6 characters long password.";
              }

              return null;
            },
          ),

          SizedBox(height: 10.h),

          Row(

            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(

                onPressed: (){


                },
                child: Text(

                  "Forgot Password?", textAlign: TextAlign.center, 
                  style: GoogleFonts.nunito(color: AppColorsComponent.startScreenTextColor, fontSize: 16.sp, fontWeight: FontWeight.w600)
                ),
              ),
            ],
          ),

          SizedBox(height: 15.h),

          CustomButton(

            buttonColor: AppColorsComponent.loginButtonColor,
            buttonText: "Login",
            buttonTextColor: Colors.grey.shade200,
            onPressed: (){

              if(formKey.currentState!.validate()){

                Auth().userLogin(emailController.text, passwordController.text, context);
              }
            },
          ),
        ]
      ),
    );
  }
}