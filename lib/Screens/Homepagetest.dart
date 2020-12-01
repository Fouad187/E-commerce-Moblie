import 'package:flutter/material.dart';
import 'package:flutter_app1/Constant.dart';
import 'package:flutter_app1/Screens/cartscreen.dart';
import 'package:flutter_app1/widgets/category_page.dart';
import 'package:flutter_app1/widgets/getcategory.dart';
import 'package:flutter_app1/widgets/tap.dart';
class HomePageTest extends StatefulWidget {
  static String id='HomeTest';
  @override
  _HomePageTestState createState() => _HomePageTestState();
}

class _HomePageTestState extends State<HomePageTest> with SingleTickerProviderStateMixin {
  int tabbarindex=0;
  TabController _tabController;
  int botoomindex=0;
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController=TabController(length: 6, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children:<Widget>[
           Scaffold(

             bottomNavigationBar: BottomNavigationBar(
               currentIndex: botoomindex,
               type: BottomNavigationBarType.fixed,
               unselectedItemColor: kinactivecolor,
               fixedColor: Colors.orangeAccent,
               onTap: (value){
                 setState(() {
                   botoomindex=value;
                   if(value == 1)
                     {
                       Navigator.pushNamed(context, CartScreen.id);
                     }
                   if(value==0)
                     {
                       Navigator.pushNamed(context, HomePageTest.id);
                     }

                 });
               },
               items: [
                 BottomNavigationBarItem(icon: Icon(Icons.dashboard) , title: Text('Products')),
                 BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),title: Text('Card')),
                 BottomNavigationBarItem(icon: Icon(Icons.list) , title: Text('Orders')),
               ],


             ),
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
              title: Text('Fouad App' , style: TextStyle(fontSize: 20, color: Colors.white),),
              actions:<Widget>[
                IconButton(
                    icon: Icon(Icons.search ,
                      color: Colors.white,
                    ),
                    onPressed:(){}
                ),
                IconButton(icon: Icon(Icons.add_shopping_cart ,color: Colors.white,), onPressed: null),
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
                    CategoryTab(onclick: null, type: 'All'),
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
                      GetCategory(isUser: true, clothes: false,  smart: false, laptop: false, phones: false, kitchen: false,all: true,),
                      GetCategory(isUser: true, clothes: true,  smart: false, laptop: false, phones: false, kitchen: false,all: false,),
                      GetCategory(isUser: true, clothes: false, smart: false, laptop: false, phones: false, kitchen: true,all: false,),
                      GetCategory(isUser: true, clothes: false, smart: false, laptop: false, phones: true, kitchen: false,all: false,),
                      GetCategory(isUser: true, clothes: false, smart: false, laptop:true, phones: false, kitchen: false,all: false,),
                      GetCategory(isUser: true, clothes: false, smart: true, laptop: false, phones: false, kitchen: false,all: false,),

                    ],
                  ),

                )

              ],
            ),


            ),

      ],
    );
  }
}
