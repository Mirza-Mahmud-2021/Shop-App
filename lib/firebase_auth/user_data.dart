import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/controller/bottom_nav_controller.dart';

class UserData{

  // send user data into firebase firestore
  sendUserDataToDB(String userName, String userPhoneNo, String userBirthDate, String userGender, String userAddress, BuildContext _context) async{

    final FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    var currentUser = _auth.currentUser;

    // create data collection for users
    CollectionReference collectionReference = _firestore.collection("users-information");

    return collectionReference.doc(currentUser!.email).set({

      "user-id" : currentUser.uid,
      "username" : userName,
      "phone no" : userPhoneNo,
      "date of birth" : userBirthDate,
      "gender" : userGender,
      "address" : userAddress
    }).then(

      (value) => Navigator.pushReplacement(_context, MaterialPageRoute(builder: (_) => const BottomNavController()))
    ).catchError((e){

      ScaffoldMessenger.of(_context).showSnackBar(

        SnackBar(

          content: Text("$e", style: GoogleFonts.nunito(color: Colors.white, fontSize: 14.sp)),
          backgroundColor: Colors.red,
          padding: const EdgeInsets.all(8),
        )
      );
    });
  }
}