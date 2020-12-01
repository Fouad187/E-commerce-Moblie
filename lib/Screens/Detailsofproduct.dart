import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/ClassesAndModels/Products.dart';
import 'file:///D:/FCIS_2020/Rab3aaa/Gp/flutter_app1/lib/providers/cartitem.dart';
import 'package:provider/provider.dart';
class DetailsofProduct extends StatefulWidget {
  static String id='DetailsofProduct';
  Products product;
  bool fromcart=false;
  DetailsofProduct({this.product,this.fromcart});
  @override
  _DetailsofProductState createState() => _DetailsofProductState();
}

class _DetailsofProductState extends State<DetailsofProduct> {
  int count=01;
  String color;
  String image;
  void add()
  {
    setState(() {
      count++;
    });
  }
  void minus(){

    setState(() {
      if(count >=1)
      count--;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    image=widget.product.image;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Colors.orangeAccent,
          body: SafeArea(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                        SizedBox(
                          child: Stack(
                           children: [
                             Container(
                               margin: EdgeInsets.only(top : MediaQuery.of(context).size.height *0.3),
                               height: 541,
                               decoration: BoxDecoration(
                                 color: Colors.white,
                                 borderRadius: BorderRadius.only(topRight: Radius.circular(24) , topLeft: Radius.circular(24)),

                               ),
                               child: Padding(
                                 padding: EdgeInsets.only(left: 30),
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     SizedBox(height: 80,),
                                     Text('Color' , style: TextStyle(fontSize: 15.0),),
                                     SizedBox(height: 10,),
                                     Row(
                                       children: [
                                         ColorDot(color: Colors.blue, isSelected: true,),
                                         ColorDot(color: Colors.orangeAccent, isSelected: false,),
                                         ColorDot(color: Colors.red,isSelected: false,),
                                         ColorDot(color: Colors.black,isSelected: false,),
                                       ],
                                     ),
                                     SizedBox(height: 20,),
                                     Text('Size'),
                                     SizedBox(height: 10,),
                                     Row(
                                       children: [
                                         Text('S', style: TextStyle(fontWeight: FontWeight.bold),),
                                         SizedBox(width: 8,),
                                         Text('M'),
                                         SizedBox(width: 8,),
                                         Text('L'),
                                         SizedBox(width: 8,),
                                         Text('XL'),
                                         SizedBox(width: 8,),
                                         Text('XXL'),
                                       ],
                                     ),
                                     SizedBox(height: 40,),
                                     Row(
                                       children: [
                                         Text(
                                           'Price : ',
                                           style: TextStyle(
                                             fontSize: 25.0,
                                             fontWeight: FontWeight.w900,

                                           ),
                                         ),
                                         Text(
                                           widget.product.price,
                                           style: TextStyle(
                                             fontSize: 25.0,
                                             fontWeight: FontWeight.w900,

                                           ),
                                         ),
                                         SizedBox(width: 5,),
                                         Text(
                                           'L.E',
                                           style: TextStyle(
                                             fontSize: 15.0,
                                             fontWeight: FontWeight.w900,

                                           ),
                                         ),
                                       ],
                                     ),
                                     SizedBox(height: 60,),
                                     Text('QTY'),
                                     Row(
                                       children: [
                                         IconButton(
                                             icon: Icon(Icons.remove),
                                             onPressed:(){ minus(); }),
                                         Text('$count', style: TextStyle(fontSize: 25.0),),
                                         IconButton(icon: Icon(Icons.add), onPressed: (){add();}),
                                       ],
                                     ),
                                     SizedBox(height: 90,),
                                     Row(
                                       children: [
                                         Icon(Icons.shopping_cart , color: Colors.orangeAccent, size: 30,),
                                         Expanded(
                                           child: Container(
                                             padding: EdgeInsets.only(right: 40),
                                             child: FlatButton(
                                               shape: RoundedRectangleBorder(
                                                 borderRadius: BorderRadius.circular(18),
                                               ),
                                               color: Colors.orangeAccent,
                                               onPressed: (){
                                                 Cartitem cart = Provider.of<
                                                     Cartitem>(
                                                     context, listen: false);
                                                 if(widget.fromcart == false ) {
                                                   widget.product.quantity =
                                                       count;
                                                   cart.addproduct(
                                                       widget.product);
                                                 }
                                                 else if(widget.fromcart==true)
                                                   {
                                                     cart.delete(widget.product);
                                                     widget.product.quantity =
                                                         count;
                                                     cart.addproduct(
                                                         widget.product);
                                                   }
                                                 },
                                               child:Text(
                                                 'ADD TO CART',
                                                 style: TextStyle(
                                                   fontSize: 17.0,
                                                   color: Colors.black,
                                                   fontWeight: FontWeight.bold,
                                                 ),
                                               ),
                                             ),
                                           ),
                                         ),
                                       ],
                                     )
                                   ],
                                 ),
                               ),
                             ),
                             Padding(
                               padding: EdgeInsets.all(20.0),
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text(
                                     widget.product.name,
                                     style: TextStyle(
                                       fontWeight: FontWeight.w800,
                                       fontSize: 20.0,
                                     ),
                                   ),
                                   SizedBox(height: 5.0,),
                                   Text(
                                       'This is From Zara brand with Good Matrial , Cotton , Thread And With Good Price. \nZara Brand is a Spanish apparel retailer based in Arteixo in Galicia. The company specializes in fast fashion, and products include clothing, accessories, shoes, swimwear, beauty, and perfumes.'
                                   ),
                                   SizedBox(height: 130.0,),
                                 ],
                               ),
                             ),
                             Positioned(
                                  top: 140,
                                  right: 0,
                                  child: Hero(
                                      tag: 'Productimage$image',
                                      child: Image(image: AssetImage('images/$image.png'), height: 250 , width: 250,))),

                           ],
                          ),
                        ),
                  ],
              ),
          ),
    );
  }
}

class ColorDot extends StatelessWidget {
  final Color color;
  final bool isSelected;
  //final Function onClick;
ColorDot({this.color , this.isSelected});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){},
      child: Container(
        padding: EdgeInsets.all(2.5),
        height: 24,
        width: 24,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? color : Colors.transparent,
          ),
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
/*Padding(
padding: EdgeInsets.all(20.0),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
'Heavy jacket',
style: TextStyle(
fontWeight: FontWeight.w800,
fontSize: 20.0,
),
),
SizedBox(height: 5.0,),
Text(
'This is From Zara brand with Good Matrial , Cotton , Thread And With Good Price. \nZara Brand is a Spanish apparel retailer based in Arteixo in Galicia. The company specializes in fast fashion, and products include clothing, accessories, shoes, swimwear, beauty, and perfumes.'
),
SizedBox(height: 30.0,),
Text(
'Price : 220 L.E',
style: TextStyle(
fontSize: 25.0,
fontWeight: FontWeight.w900,

),
),
],
),
),
*/