import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/ClassesAndModels/Products.dart';
import 'package:flutter_app1/Screens/Detailsofproduct.dart';
import 'package:flutter_app1/Services/StoreProduct.dart';
import 'package:flutter_app1/Constant.dart';
import 'package:flutter_app1/widgets/category_page.dart';
import 'package:flutter_app1/widgets/build-card.dart';
import 'package:flutter_app1/widgets/getcategory.dart';
import 'package:flutter_app1/widgets/tap.dart';

class UpdateProduct extends StatefulWidget {
  static String id='UpdateProduct';

  @override
  _UpdateProductState createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct>  with SingleTickerProviderStateMixin {
  int tabbarindex=0;
  TabController _tabController;
  int botoomindex=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController=TabController(length: 6, vsync:this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(

        padding: EdgeInsets.only(left: 15),
        children: [
          SizedBox(height: 50,),
          Text(
            'Categories',
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10,),
          TabBar(
            controller: _tabController,
            indicatorColor: Colors.transparent,
            labelColor: Colors.orangeAccent,
            isScrollable: true,
            labelPadding: EdgeInsets.only(right: 45.0),
            unselectedLabelColor: Color(0xFFCDCDCD),
            tabs: [
              CategoryTab(onclick: null, type: 'All',),
              CategoryTab(onclick: (){
              }, type: 'Clothes',),
              CategoryTab(onclick: null, type: 'Kitchen',),
              CategoryTab(onclick: null, type: 'Phones',),
              CategoryTab(onclick: null, type: 'Laptops',),
              CategoryTab(onclick: null, type: 'Smarts',),
            ],
          ),
          SizedBox(height: 10,),
          Container(
            height: MediaQuery.of(context).size.height-50.0,
            width: double.infinity,
            child: TabBarView(
              controller: _tabController,
              children: [
                GetCategory(isUser: false, clothes: false,  smart: false, laptop: false, phones: false, kitchen: false,all: true,),
                GetCategory(isUser: false, clothes: true,  smart: false, laptop: false, phones: false, kitchen: false,all: false,),
                GetCategory(isUser: false, clothes: false, smart: false, laptop: false, phones: false, kitchen: true,all: false,),
                GetCategory(isUser: false, clothes: false, smart: false, laptop: false, phones: true, kitchen: false,all: false,),
                GetCategory(isUser: false, clothes: false, smart: false, laptop:true, phones: false, kitchen: false,all: false,),
                GetCategory(isUser: false, clothes: false, smart: true, laptop: false, phones: false, kitchen: false,all: false,),

              ],
            ),

          )

        ],
      ),
    );
  }
}
