import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/ClassesAndModels/Products.dart';
import 'package:flutter_app1/Services/StoreProduct.dart';
import 'package:flutter_app1/Constant.dart';
import 'package:flutter_app1/widgets/tap.dart';
class Homepagescreen extends StatefulWidget {
  static String id='HomePageScreen';
  @override
  _HomepagescreenState createState() => _HomepagescreenState();
}

class _HomepagescreenState extends State<Homepagescreen> with SingleTickerProviderStateMixin {
  TabController _tabController;
  final Store=StoreProduct();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController=TabController(length: 5, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back , color: Colors.white,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text('Zarzor App' , style: TextStyle(fontSize: 20, color: Colors.white),),
        actions:<Widget>[
          IconButton(
              icon: Icon(Icons.search ,
                color: Colors.white,
              ),
              onPressed:(){}
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.only(left: 15),
        children: [
          SizedBox(height: 10,),
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
            CategoryTab(onclick: null, type: 'Clothes',),
            CategoryTab(onclick: null, type: 'Kitchen',),
            CategoryTab(onclick: null, type: 'Phones',),
            CategoryTab(onclick: null, type: 'Laptops',),
            CategoryTab(onclick: null, type: 'Smarts',),


          ],
        ),
          StreamBuilder<QuerySnapshot>(
              stream: Store.getallproduct(),
              builder:(context, snapshot) {
                if(snapshot.hasData)
                  {
                    List<Products> _products=[];
                    for (var pro in snapshot.data.documents){
                      var data=pro.data();
                      _products.add(Products(
                        name: data[kproductname],
                        price: data[kproductprice],
                        category: data[kproductcategpry],
                        image : data[kproductimage],
                      ));

                    }
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                        itemBuilder: (context,index)=>Text(_products[index].name),
                      itemCount: _products.length,
                    );
                  } else {
                  return Center(child: Text('Loading....'));
                }
              },
          )
        ],
      ),
    );
  }
}


