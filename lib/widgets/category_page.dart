

import 'package:flutter/material.dart';
import 'package:flutter_app1/Screens/Detailsofproduct.dart';
import 'package:flutter_app1/widgets/build-card.dart';
class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
           padding: EdgeInsets.only(right: 15.0),
           width: MediaQuery.of(context).size.width - 30.0,
           height: MediaQuery.of(context).size.height - 50.0,
           child: GridView.count(

             crossAxisCount:2,
             primary: false,
             crossAxisSpacing: 10.0,
             mainAxisSpacing: 15.0,
             childAspectRatio: 0.8,
             children:<Widget>[

             ],
           ),
         );
  }
}