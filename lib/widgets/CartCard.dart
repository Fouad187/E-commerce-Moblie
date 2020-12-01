import 'package:flutter/material.dart';
import 'package:flutter_app1/ClassesAndModels/Products.dart';
import 'file:///D:/FCIS_2020/Rab3aaa/Gp/flutter_app1/lib/providers/cartitem.dart';
import 'package:provider/provider.dart';

class CartCard extends StatefulWidget {
  Products Product=Products();
  int index;
  Function onclick;
  CartCard({this.Product , this.index , this.onclick});

  @override
  _CartCardState createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  @override
  Widget build(BuildContext context) {
    List<Products> products=Provider.of<Cartitem>(context).product;

    Size size=MediaQuery.of(context).size;
    String image=widget.Product.image;
    int Quantity=widget.Product.quantity;
    String price=widget.Product.price;
    String name=widget.Product.name;
    int pri=int.parse(price);
    int total = pri*Quantity;
    widget.Product.total=total;
    return Padding(
      padding: EdgeInsets.only(top: 5),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20 , top: 50 , right: 15, bottom: 0),
            child: Container(
              color: Colors.orangeAccent,
              height: size.height*0.16,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(left: 180 , top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name : $name' ,
                      style:TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),),
                    Text(
                      'Price : $price L.E' ,
                      style:TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),),
                    Text(
                      'Quantity : $Quantity' ,
                      style:TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),),
                    Row(children: [
                      Text(
                        'Total : $total L.E' ,
                        style:TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),),
                      SizedBox(width: 20,),
                    /*  GestureDetector(
                          onTap: widget.onclick,
                          child: Icon(Icons.delete , size: 30, color: Colors.white,)),

                     */
                    ],)
                  ],
                ),
              ),
            ),
          ),
          Image(image: AssetImage('images/$image.png') , height: 200 , width: 200,),
          Positioned(
            right: 0,
              top: 40,
              child: MyPopMenu(Click: widget.onclick),

          )
        ],
      ),
    );
  }
}
class MyPopMenu extends StatefulWidget {
   Function Click;
   MyPopMenu({this.Click});

  @override
  _MyPopMenuState createState() => _MyPopMenuState();
}

class _MyPopMenuState extends State<MyPopMenu> {
  @override
  Widget build(BuildContext context) {
    List<Products> products=Provider.of<Cartitem>(context).product;
    return PopupMenuButton(
        onSelected: widget.Click,
        itemBuilder: (context) => [
          PopupMenuItem(
              value: 1,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(2, 2, 8, 2),
                    child: Icon(Icons.delete),
                  ),
                  Text('Delete From Cart')
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
}