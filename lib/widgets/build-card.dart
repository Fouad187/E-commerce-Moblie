import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app1/ClassesAndModels/Products.dart';
import 'package:flutter_app1/Screens/toupdate.dart';
import 'package:flutter_app1/Services/StoreProduct.dart';
class buildcard extends StatelessWidget {
  buildcard({@required this.name ,@required this.categ ,@required this.price,@required this.image , @required this.click,@required this.id , @required this.isAdmin});
  String name;
  String price;
  String image;
  String categ;
  Function click;
  String id;
  bool isAdmin;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
      child: InkWell(
        onTap:click,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 3.0,
                    blurRadius: 5.0)
              ],
              color: Colors.white),

          child: Stack(
            children: <Widget>[

              Positioned(
                child: isAdmin ? myPopMenu(id,name,price,image,categ,context): Container(width: 0.0, height:  0.0,),
                right: 0,
              ),
              Center(
                child: Column(
                  children: [

                    /* Hero(
                   tag: 'xz',
                   child: Container(
                       height: 75.0,
                       width: 75.0,
                       decoration: BoxDecoration(
                           image: DecorationImage(
                               image: AssetImage('images/icons/appicon.png'),
                               fit: BoxFit.contain)))
             ),

             */
                    Expanded(child: Hero(
                        tag: 'Productimage$image',
                        child: Image(image: AssetImage('images/$image.png')))),

                    SizedBox(height: 7.0),
                    Text(name,
                        style: TextStyle(
                            color: Color(0xFFCC8053),
                            fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        )),
                    Text('$price L.E',
                        style: TextStyle(
                            color: Color(0xFF575E67),
                            fontSize: 15.0,
                           fontWeight: FontWeight.w700,
                        )),
                    SizedBox(height: 10,)
                  ],

                ),
              ),

            ],
          )
        ),
      ),
    );
  }
}
Widget myPopMenu(String id, String name , String price , String image,String categ , context) {
  final _Store=StoreProduct();
  return PopupMenuButton(
      onSelected: (value) {
        if(value == 1)
          {
              _Store.deleteproduct(id);
          } else {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Toupdate(name: name, price: price, image: image,Categ: categ,idd: id,)));

        }
      },
      itemBuilder: (context) => [
        PopupMenuItem(
            value: 1,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(2, 2, 8, 2),
                  child: Icon(Icons.delete),
                ),
                Text('Delete')
              ],
            )),
        PopupMenuItem(
            value: 2,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(2, 2, 8, 2),
                  child: Icon(Icons.update),
                ),
                Text('Update')
              ],
            )),
      ]);
}