import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/controller/bottom_nav_controller.dart';
import 'package:shop_app/views/userdata_screen.dart';

class Auth{

  // register user to firebase
  userRegister(String registerEmail, String registerPassword, BuildContext _context) async{

    try{

      UserCredential _userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(

        email: registerEmail, password: registerPassword
      );

      var _authCredential = _userCredential.user;

      if(_authCredential!.uid.isNotEmpty){

        ScaffoldMessenger.of(_context).showSnackBar(

          SnackBar(

            padding: const EdgeInsets.all(8.0),
            backgroundColor: Colors.green,
            content: Text("Account register successfully", style: GoogleFonts.nunito(color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.w600))
          )
        );
        Navigator.pushReplacement(_context, MaterialPageRoute(builder: (_) => const UserDataScreen()));
      }

      else{

        ScaffoldMessenger.of(_context).showSnackBar(

          SnackBar(

            padding: const EdgeInsets.all(8.0),
            backgroundColor: Colors.redAccent,
            content: Text("Please, checkout above", style: GoogleFonts.nunito(color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.w600))
          )
        );
      }
    } on FirebaseAuthException catch(e){

      if (e.code == 'weak-password') {

        ScaffoldMessenger.of(_context).showSnackBar(

          SnackBar(

            padding: const EdgeInsets.all(8.0),
            backgroundColor: Colors.redAccent,
            content: Text("Please, use strong password", style: GoogleFonts.nunito(color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.w600))
          )
        );
      } else if (e.code == 'email-already-in-use') {

        ScaffoldMessenger.of(_context).showSnackBar(

          SnackBar(

            padding: const EdgeInsets.all(8.0),
            backgroundColor: Colors.redAccent,
            content: Text("This email is already in used", style: GoogleFonts.nunito(color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.w600))
          )
        );
      }
    }catch (e) {

      ScaffoldMessenger.of(_context).showSnackBar(

        SnackBar(

          padding: const EdgeInsets.all(8.0),
          backgroundColor: Colors.redAccent,
          content: Text("$e", style: GoogleFonts.nunito(color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.w600))
        )
      );
    }
  }

  // login user to firebase
  userLogin(String loginEmail, String loginPassword, BuildContext _context) async{

    try{

      UserCredential _userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(

        email: loginEmail, password: loginPassword
      );

      var _authCredential = _userCredential.user;

      if(_authCredential!.uid.isNotEmpty){

        ScaffoldMessenger.of(_context).showSnackBar(

          SnackBar(

            padding: const EdgeInsets.all(8.0),
            backgroundColor: Colors.green,
            content: Text("Account login successfully", style: GoogleFonts.nunito(color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.w600))
          )
        );
        Navigator.pushReplacement(_context, MaterialPageRoute(builder: (_) => const BottomNavController()));
      }

      else{

        ScaffoldMessenger.of(_context).showSnackBar(

          SnackBar(

            padding: const EdgeInsets.all(8.0),
            backgroundColor: Colors.redAccent,
            content: Text("Please, checkout above", style: GoogleFonts.nunito(color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.w600))
          )
        );
      }
    } on FirebaseAuthException catch(e){

      if (e.code == 'user-not-found') {

        ScaffoldMessenger.of(_context).showSnackBar(

          SnackBar(

            padding: const EdgeInsets.all(8.0),
            backgroundColor: Colors.redAccent,
            content: Text("User not found", style: GoogleFonts.nunito(color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.w600))
          )
        );
      } else if (e.code == 'wrong-password') {

        ScaffoldMessenger.of(_context).showSnackBar(

          SnackBar(

            padding: const EdgeInsets.all(8.0),
            backgroundColor: Colors.redAccent,
            content: Text("Wrong password", style: GoogleFonts.nunito(color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.w600))
          )
        );
      }
    }
  }
}