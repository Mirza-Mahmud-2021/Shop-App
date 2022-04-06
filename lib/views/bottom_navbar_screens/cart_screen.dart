import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/components/app_colors_component.dart';

class CartScreen extends StatefulWidget {

  const CartScreen({ Key? key }) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(

      designSize: const Size(375, 750),
      builder: () => Scaffold(

        backgroundColor: AppColorsComponent.screenScaffoldColor,
        body: const Center(

          child: Text("Cart Screen", textAlign: TextAlign.center),
        ),
      ),
    );
  }
}