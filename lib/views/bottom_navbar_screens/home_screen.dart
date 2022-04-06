import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/components/app_colors_component.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(

      designSize: const Size(375, 750),
      builder: () => Scaffold(

        backgroundColor: AppColorsComponent.screenScaffoldColor,
        body: const Center(

          child: Text("Home Screen", textAlign: TextAlign.center),
        ),
      ),
    );
  }
}