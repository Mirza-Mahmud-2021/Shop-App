import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/components/app_colors_component.dart';

class FavotiteScreen extends StatefulWidget {

  const FavotiteScreen({ Key? key }) : super(key: key);

  @override
  State<FavotiteScreen> createState() => _FavotiteScreenState();
}

class _FavotiteScreenState extends State<FavotiteScreen> {

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(

      designSize: const Size(375, 750),
      builder: () => Scaffold(

        backgroundColor: AppColorsComponent.screenScaffoldColor,
        body: const Center(

          child: Text("Favorite Screen", textAlign: TextAlign.center),
        ),
      ),
    );
  }
}