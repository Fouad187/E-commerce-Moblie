import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///D:/FCIS_2020/Rab3aaa/Gp/flutter_app1/lib/providers/cartitem.dart';
import 'package:flutter_app1/Screens/addproduct.dart';
import 'package:flutter_app1/Screens/Detailsofproduct.dart';
import 'package:flutter_app1/Screens/Homepagetest.dart';
import 'package:flutter_app1/Screens/adminpannel.dart';
import 'package:flutter_app1/Screens/cartscreen.dart';
import 'package:flutter_app1/Screens/home_page.dart';
import 'package:flutter_app1/Screens/login_screen.dart';
import 'package:flutter_app1/Screens/registration.dart';
import 'package:flutter_app1/Screens/toupdate.dart';
import 'package:flutter_app1/Screens/updateproduct.dart';
import 'package:flutter_app1/providers/modul_hud.dart';
import 'package:provider/provider.dart';

main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<Modelhud>(
        create: (context) => Modelhud(),
      ),
      ChangeNotifierProvider<Cartitem>(
        create: (context) => Cartitem(),
      ),
    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: LoginScreen.id,
        routes: {
          LoginScreen.id: (context) => LoginScreen(),
          RegisterScreen.id: (context) => RegisterScreen(),
          Homepagescreen.id: (context) => Homepagescreen(),
          AddProduct.id: (context) => AddProduct(),
          HomePageTest.id: (context) => HomePageTest(),
          DetailsofProduct.id: (context) => DetailsofProduct(),
          AdminPannel.id: (context) => AdminPannel(),
          UpdateProduct.id: (context) => UpdateProduct(),
          Toupdate.id: (context) => Toupdate(),
          CartScreen.id:(context)=>CartScreen(),
        },


      ),
    );
  }
}