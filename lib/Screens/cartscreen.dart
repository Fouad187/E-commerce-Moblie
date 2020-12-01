
import 'package:flutter/material.dart';
import 'package:flutter_app1/ClassesAndModels/Products.dart';
import 'package:flutter_app1/Services/StoreProduct.dart';
import 'file:///D:/FCIS_2020/Rab3aaa/Gp/flutter_app1/lib/providers/cartitem.dart';
import 'package:flutter_app1/widgets/CartCard.dart';
import 'package:provider/provider.dart';
import 'Detailsofproduct.dart';
class CartScreen extends StatefulWidget {
   static String id='CartScreen';

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {

    List<Products> products=Provider.of<Cartitem>(context).product;
    Size size=MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, index) {

                return CartCard(
                  Product: products[index],
                  index: index,
                  onclick: (value){
                    if(value ==1 ) {
                      setState(() {
                        products.removeAt(index);
                      });
                    }
                    else if (value ==2) {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailsofProduct(product: products[index], fromcart: true,)));
                    }
                  },
                );
              },
              itemCount: products.length,
            ),
          ),
          FlatButton(
            onPressed: (){
              Cartitem cart=Provider.of<Cartitem>(context , listen: false);
              int price=cart.sumtotal();
              ShowCustomDialog(price,context , cart.product);
              },
            child:Text('ORDER NOW' , style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20, color: Colors.black),),
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.only(topLeft: Radius.circular(20) , topRight: Radius.circular(20)),
           ),
            color: Colors.orangeAccent,
            minWidth: size.width,
            height: 50,
          ),
        ],
      )
    );
  }
}

void ShowCustomDialog(int price , context , List<Products> products) async
{
  var address;
  AlertDialog alertDialog= AlertDialog(
    title: Text('Total Price = $price') ,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    content: TextField(
      onChanged: (value){
        address=value;
      },
      decoration: InputDecoration(
        hintText: 'Your Address ?',
      ),
    ),
    actions: [
      MaterialButton(
        child: Text('Confirm Order'),
        onPressed: (){
          StoreProduct _Store=StoreProduct();
          _Store.Storeorder({
            'Total Price' : price,
            'Address' : address,
          } , products );
          Provider.of<Cartitem>(context , listen: false).product.clear();
          Navigator.pop(context);
        },
      ),
    ],
  );
 await showDialog(
    context: context ,
    builder: (context) {
      return alertDialog;
    },
  );
}