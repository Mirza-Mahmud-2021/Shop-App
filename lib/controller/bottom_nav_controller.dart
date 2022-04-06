import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/components/app_colors_component.dart';
import 'package:shop_app/views/bottom_navbar_screens/cart_screen.dart';
import 'package:shop_app/views/bottom_navbar_screens/favorite_screen.dart';
import 'package:shop_app/views/bottom_navbar_screens/home_screen.dart';
import 'package:shop_app/views/bottom_navbar_screens/user_profile_screen.dart';

class BottomNavController extends StatefulWidget {

  const BottomNavController({ Key? key }) : super(key: key);

  @override
  State<BottomNavController> createState() => _BottomNavControllerState();
}

class _BottomNavControllerState extends State<BottomNavController> {

  final screens = [const HomeScreen(), const FavotiteScreen(), const CartScreen(), const UserProfileScreen()];
  var _currentScreenIndex = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      
      bottomNavigationBar: BottomNavigationBar(

        elevation: 5,
        backgroundColor: Colors.grey,
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.black,
        currentIndex: _currentScreenIndex,
        selectedLabelStyle: GoogleFonts.nunito(color: Colors.black, fontWeight: FontWeight.bold),

        items: const [

          BottomNavigationBarItem(

            icon: Icon(Icons.home_rounded, size: 25.0),
            label: "Home"
          ),
          BottomNavigationBarItem(

            icon: Icon(Icons.favorite_rounded, size: 25.0),
            label: "Favorite"
          ),
          BottomNavigationBarItem(

            icon: Icon(Icons.shopping_cart_rounded, size: 25.0),
            label: "Cart"
          ),
          BottomNavigationBarItem(

            icon: Icon(Icons.account_circle_rounded, size: 25.0),
            label: "Profile"
          ),
        ],

        onTap: (index){

          setState(() {
            
            _currentScreenIndex = index;
          });
        },
      ),

      body: screens[_currentScreenIndex],
    );
  }
}