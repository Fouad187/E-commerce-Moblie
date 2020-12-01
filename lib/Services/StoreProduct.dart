import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app1/ClassesAndModels/Products.dart';
import 'package:flutter_app1/Constant.dart';
class StoreProduct {
  final _firestore = Firestore.instance;

  addproduct(Products products) {
    _firestore.collection(KnameofDatabase).add({
      kproductname: products.name,
      kproductprice: products.price,
      kproductcategpry: products.category,
      kproductimage: products.image,
    });
  }

  Stream<QuerySnapshot> getallproduct(){
   return _firestore.collection(KnameofDatabase).snapshots();
  }

  deleteproduct(docid)
  {
    _firestore.collection(KnameofDatabase).document(docid).delete();
  }

  updateproduct(docid,data)
  {
    _firestore.collection(KnameofDatabase).document(docid).update(data);
  }
  Storeorder(data,List<Products> products)
  {
    var ref=_firestore.collection('Orders').document();
    ref.setData(data);
    for(var product in products )
      {
        ref.collection('OrderDetails').document().setData(
          {
            kproductname : product.name,
            kproductprice : product.price,
            kproductQuantity : product.quantity,
            kproductimage : product.image,
          }
        );

      }


  }
}
