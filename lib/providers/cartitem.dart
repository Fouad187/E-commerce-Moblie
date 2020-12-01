
import 'package:flutter/cupertino.dart';
import 'package:flutter_app1/ClassesAndModels/Products.dart';
import 'package:provider/provider.dart';

class Cartitem extends ChangeNotifier
{
  List<Products> product=[];
  addproduct(Products prod)
  {
       product.add(prod);
       notifyListeners();
  }
  delete(Products prod)
  {
    product.remove(prod);
    notifyListeners();
  }
  int sumtotal()
  {
    int sum=0;
    for(var prod in product)
      {
        sum+=prod.total;
      }
    return sum;
  }
}