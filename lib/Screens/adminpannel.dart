import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/Screens/addproduct.dart';
import 'package:flutter_app1/Screens/updateproduct.dart';
class AdminPannel extends StatelessWidget {
  static String id='Adminpannel';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text('Admin Pannel ' , style:  TextStyle(color: Colors.white , fontSize: 20.0 , fontWeight: FontWeight.w700),),
      ),
      backgroundColor: Colors.orangeAccent,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 200,),
            FlatButton(

                onPressed: (){
                  Navigator.pushNamed(context, AddProduct.id);
                },
                color: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child:Text('Add Product    ' ,style: TextStyle(color: Colors.white,),textAlign: TextAlign.center,),
            ),
            SizedBox(height: 30,),
            FlatButton(
              onPressed: (){
                Navigator.pushNamed(context, UpdateProduct.id);
              },
              color: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child:Text('Update Or Delete Product' ,style: TextStyle(color: Colors.white,),),
            ),
            SizedBox(height: 30,),
            FlatButton(
              onPressed: (){
              },
              color: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child:Text('Show Orders ' ,style: TextStyle(color: Colors.white,),),
            ),
            SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}
