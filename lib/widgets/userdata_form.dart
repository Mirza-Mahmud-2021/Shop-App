import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/components/app_colors_component.dart';
import 'package:shop_app/firebase_auth/user_data.dart';
import 'package:shop_app/reusable_widgets/custom_button_widget.dart';

class UserDataForm extends StatefulWidget {

  const UserDataForm({ Key? key }) : super(key: key);

  @override
  State<UserDataForm> createState() => _UserDataFormState();
}

class _UserDataFormState extends State<UserDataForm> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  List<String> gender = ["Male", "Female", "Other"];

  // date of birth function
  Future<void> _selectDateFromPicker(BuildContext context) async {

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(DateTime.now().year - 20),
      firstDate: DateTime(DateTime.now().year - 30),
      lastDate: DateTime(DateTime.now().year),
    );
    if (picked != null){

      setState(() {

        dobController.text = "${picked.day}/ ${picked.month}/ ${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Form(
      
      key: _formKey,
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,
        children: [

          TextFormField(

            style: GoogleFonts.nunito(color: AppColorsComponent.textFieldColor, fontSize: 15.sp, fontWeight: FontWeight.w600),
            cursorColor: AppColorsComponent.textFieldColor,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            controller: usernameController,

            decoration: InputDecoration(
            
              icon:  Icon(Icons.account_circle_rounded, color: AppColorsComponent.textFieldColor),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.r), borderSide:  BorderSide(color: AppColorsComponent.textFieldColor, width: 2)),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20.r), borderSide:  BorderSide(color: AppColorsComponent.textFieldColor, width: 2)),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20.r), borderSide:  BorderSide(color: AppColorsComponent.textFieldColor, width: 2)),

              hintText: 'Username',
              hintStyle: GoogleFonts.nunito(color: AppColorsComponent.textFieldColor, fontSize: 15.sp, fontWeight: FontWeight.w600)
            ),

            validator: (value){

              if(value!.isEmpty){

                return "Please, enter your name";
              }

              return null;
            },
          ),
          SizedBox(height: 20.h),

          TextFormField(

            style: GoogleFonts.nunito(color: AppColorsComponent.textFieldColor, fontSize: 15.sp, fontWeight: FontWeight.w600),
            cursorColor: AppColorsComponent.textFieldColor,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            controller: phoneController,

            decoration: InputDecoration(
            
              icon:  Icon(Icons.phone_rounded, color: AppColorsComponent.textFieldColor),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.r), borderSide:  BorderSide(color: AppColorsComponent.textFieldColor, width: 2)),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20.r), borderSide:  BorderSide(color: AppColorsComponent.textFieldColor, width: 2)),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20.r), borderSide:  BorderSide(color: AppColorsComponent.textFieldColor, width: 2)),

              hintText: 'Phone No.',
              hintStyle: GoogleFonts.nunito(color: AppColorsComponent.textFieldColor, fontSize: 15.sp, fontWeight: FontWeight.w600)
            ),

            validator: (value){

              if(value!.isEmpty){

                return "Please, enter your phone no.";
              }

              return null;
            },
          ),
          SizedBox(height: 20.h),

          TextFormField(

            style: GoogleFonts.nunito(color: AppColorsComponent.textFieldColor, fontSize: 15.sp, fontWeight: FontWeight.w600),
            cursorColor: AppColorsComponent.textFieldColor,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            controller: dobController,

            decoration: InputDecoration(
            
              icon:  Icon(Icons.calendar_month_rounded, color: AppColorsComponent.textFieldColor),
              suffixIcon: IconButton(

                onPressed: (){

                  _selectDateFromPicker(context);
                },
                icon: Icon(Icons.edit_calendar_rounded, color: AppColorsComponent.textFieldColor),
              ),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.r), borderSide:  BorderSide(color: AppColorsComponent.textFieldColor, width: 2)),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20.r), borderSide:  BorderSide(color: AppColorsComponent.textFieldColor, width: 2)),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20.r), borderSide:  BorderSide(color: AppColorsComponent.textFieldColor, width: 2)),

              hintText: 'Date of Birth',
              hintStyle: GoogleFonts.nunito(color: AppColorsComponent.textFieldColor, fontSize: 15.sp, fontWeight: FontWeight.w600)
            ),

            validator: (value){

              if(value!.isEmpty){

                return "Please, enter your date of birth";
              }

              return null;
            },
          ),
          SizedBox(height: 20.h),

          TextFormField(

            style: GoogleFonts.nunito(color: AppColorsComponent.textFieldColor, fontSize: 15.sp, fontWeight: FontWeight.w600),
            cursorColor: AppColorsComponent.textFieldColor,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            controller: genderController,

            decoration: InputDecoration(
            
              icon:  Icon(Icons.male_rounded, color: AppColorsComponent.textFieldColor),
              suffixIcon: Padding(

                padding: const EdgeInsets.only(right: 15),

                child: DropdownButton<String>(

                  borderRadius: BorderRadius.circular(15.r),
                  items: gender.map((String value) {

                    return DropdownMenuItem<String>(

                      value: value,
                      child: Text(value),
                      onTap: () {

                        setState(() {

                          genderController.text = value;
                        });
                      },
                    );
                  }).toList(),

                  onChanged: (_) {},
                ),
              ),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.r), borderSide:  BorderSide(color: AppColorsComponent.textFieldColor, width: 2)),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20.r), borderSide:  BorderSide(color: AppColorsComponent.textFieldColor, width: 2)),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20.r), borderSide:  BorderSide(color: AppColorsComponent.textFieldColor, width: 2)),

              hintText: 'Gender',
              hintStyle: GoogleFonts.nunito(color: AppColorsComponent.textFieldColor, fontSize: 15.sp, fontWeight: FontWeight.w600)
            ),

            validator: (value){

              if(value!.isEmpty){

                return "Please, enter your gender";
              }

              return null;
            },
          ),
          SizedBox(height: 20.h),

          TextFormField(

            style: GoogleFonts.nunito(color: AppColorsComponent.textFieldColor, fontSize: 15.sp, fontWeight: FontWeight.w600),
            cursorColor: AppColorsComponent.textFieldColor,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            controller: addressController,

            decoration: InputDecoration(
            
              icon:  Icon(Icons.place, color: AppColorsComponent.textFieldColor),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.r), borderSide:  BorderSide(color: AppColorsComponent.textFieldColor, width: 2)),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20.r), borderSide:  BorderSide(color: AppColorsComponent.textFieldColor, width: 2)),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20.r), borderSide:  BorderSide(color: AppColorsComponent.textFieldColor, width: 2)),

              hintText: 'Address',
              hintStyle: GoogleFonts.nunito(color: AppColorsComponent.textFieldColor, fontSize: 15.sp, fontWeight: FontWeight.w600)
            ),

            validator: (value){

              if(value!.isEmpty){

                return "Please, enter your address";
              }

              return null;
            },
          ),

          SizedBox(height: 30.h),

          CustomButton(

            buttonColor: AppColorsComponent.submitButtonColor,
            buttonText: "Submit",
            buttonTextColor: Colors.white,
            onPressed: (){

              if(_formKey.currentState!.validate()){

                UserData().sendUserDataToDB(

                  usernameController.text, phoneController.text, dobController.text,
                  genderController.text, addressController.text, context
                );
              }
            },
          ),
        ],
      ),
    );
  }
}