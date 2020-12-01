import 'package:flutter/material.dart';
import 'package:flutter_app1/ClassesAndModels/Products.dart';
import 'package:flutter_app1/Screens/Detailsofproduct.dart';
import 'package:flutter_app1/Services/StoreProduct.dart';
import 'package:flutter_app1/widgets/build-card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app1/Constant.dart';
class GetCategory extends StatelessWidget {
  GetCategory({this.isUser , this.clothes , this.laptop , this.smart, this.phones , this.kitchen,this.all});
  int tabbarindex=0;
  TabController _tabController;
  bool isUser;
  bool issAdmin;
  bool clothes;
  bool kitchen;
  bool laptop;
  bool smart;
  bool phones;
  bool all;
  final _Store=StoreProduct();
  @override
  Widget build(BuildContext context) {
    if(isUser)
      {
        issAdmin=false;
      } else {
      issAdmin=true;
    }
    return Scaffold(
        body : StreamBuilder<QuerySnapshot>(
          stream: _Store.getallproduct(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Products> _productsclothes = [];
              List<Products> _productslaptops = [];
              List<Products> _productssmart = [];
              List<Products> _productskitchen = [];
              List<Products> _productsphones = [];
              List<Products> _productall=[];

              for (var pro in snapshot.data.documents) {
                var data = pro.data();
                _productall.add(Products(
                  name: data[kproductname],
                  price: data[kproductprice],
                  category: data[kproductcategpry],
                  image: data[kproductimage],
                  id:pro.documentID,
                ));
                if(data[kproductcategpry]=='clothes') {
                  _productsclothes.add(Products(
                   name: data[kproductname],
                   price: data[kproductprice],
                    category: data[kproductcategpry],
                          image: data[kproductimage],
                         id: pro.documentID,
                     ));
                }

                  else if(data[kproductcategpry]=='mobile')
                    {
                      _productsphones.add(Products(
                        name: data[kproductname],
                        price: data[kproductprice],
                        category: data[kproductcategpry],
                        image: data[kproductimage],
                        id: pro.documentID,
                      ));
                    }
                 else if(data[kproductcategpry]=='smart')
                  {
                    _productssmart.add(Products(
                      name: data[kproductname],
                      price: data[kproductprice],
                      category: data[kproductcategpry],
                      image: data[kproductimage],
                      id: pro.documentID,
                    ));
                  }
                 else if(data[kproductcategpry]=='laptop')
                  {
                    _productslaptops.add(Products(
                      name: data[kproductname],
                      price: data[kproductprice],
                      category: data[kproductcategpry],
                      image: data[kproductimage],
                      id: pro.documentID,
                    ));
                  }
                  else if(data[kproductcategpry]=='kitchen')
                  {
                    _productskitchen.add(Products(
                      name: data[kproductname],
                      price: data[kproductprice],
                      category: data[kproductcategpry],
                      image: data[kproductimage],
                      id: pro.documentID,
                    ));
                  }
                }
              // ignore: missing_return
              if(clothes) {
                return MyGrid(_productsclothes);
              }
              else if(kitchen)
                {
                  return MyGrid(_productskitchen);
                }
              else if (phones)
                {
                  return MyGrid(_productsphones);
                }
              else if(laptop)
                {
                  return MyGrid(_productslaptops);
                }
              else if(all)
                {
                  return MyGrid(_productall);
                }
              else {
                return MyGrid(_productssmart);
              }
            } else {
              return Center(child: Text('Loading....'));
            }
          },
        ),
    );
  }

  GridView MyGrid(List<Products> _products) {
    return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 15.0,
                childAspectRatio: 0.8,
              ),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, index) => buildcard(name: _products[index].name, price: _products[index].price ,
                click: (){
                if(!issAdmin)
                {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailsofProduct(product: _products[index],fromcart: false,)));
                }
                },id: _products[index].id, isAdmin: issAdmin,image: _products[index].image, categ: _products[index].category,),
              itemCount: _products.length,
            );
  }
}
