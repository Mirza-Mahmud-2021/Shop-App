import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/components/app_colors_component.dart';
import 'package:shop_app/firebase_auth/auth.dart';
import 'package:shop_app/reusable_widgets/custom_button_widget.dart';

class RegisterForm extends StatefulWidget {

  const RegisterForm({ Key? key }) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {

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
            
              icon:  Icon(Icons.email_rounded, color: AppColorsComponent.textFieldColor),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.r), borderSide:  BorderSide(color: AppColorsComponent.textFieldColor, width: 2)),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20.r), borderSide:  BorderSide(color: AppColorsComponent.textFieldColor, width: 2)),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20.r), borderSide:  BorderSide(color: AppColorsComponent.textFieldColor, width: 2)),

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
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.r), borderSide: BorderSide(color: AppColorsComponent.textFieldColor, width: 2)),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20.r), borderSide: BorderSide(color: AppColorsComponent.textFieldColor, width: 2)),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20.r), borderSide: BorderSide(color: AppColorsComponent.textFieldColor, width: 2)),

              hintText: 'Password',
              hintStyle: GoogleFonts.nunito(color: AppColorsComponent.textFieldColor, fontSize: 15.sp, fontWeight: FontWeight.w600),

              suffixIcon: IconButton(

                icon: _obscureText ? Icon(Icons.visibility_off_rounded, color: AppColorsComponent.textFieldColor) : Icon(Icons.visibility_rounded, color: AppColorsComponent.textFieldColor),
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

          SizedBox(height: 30.h),

          CustomButton(

            buttonColor: AppColorsComponent.registerButtonColor,
            buttonText: "Register",
            buttonTextColor: AppColorsComponent.loginButtonColor,
            onPressed: (){

              if(formKey.currentState!.validate()){

                Auth().userRegister(emailController.text, passwordController.text, context);
              }
            },
          ),
        ]
      ),
    );
  }
}