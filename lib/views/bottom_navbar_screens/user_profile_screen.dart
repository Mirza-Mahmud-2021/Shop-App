import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/components/app_colors_component.dart';

class UserProfileScreen extends StatefulWidget {

  const UserProfileScreen({ Key? key }) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(

      designSize: const Size(375, 750),
      builder: () => Scaffold(

        backgroundColor: AppColorsComponent.screenScaffoldColor,
        body: const Center(

          child: Text("Profile Screen", textAlign: TextAlign.center),
        ),
      ),
    );
  }
}