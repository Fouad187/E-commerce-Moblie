import 'package:flutter/material.dart';
import 'package:flutter_app1/ClassesAndModels/Products.dart';
import 'package:flutter_app1/Services/StoreProduct.dart';
import 'package:flutter_app1/providers/modul_hud.dart';
import 'package:flutter_app1/widgets/custom_textfield.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

class Toupdate extends StatelessWidget {
  static String id='ToUpdateScreen';
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final StoreProduct Storee=StoreProduct();


  Toupdate({this.name , this.price , this.image ,this.Categ , this.idd});
  String name;
  String price ;
  String image ;
  String Categ;
  String idd;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      resizeToAvoidBottomInset: false,
      body:ModalProgressHUD(
        inAsyncCall:Provider.of<Modelhud>(context).ischange,
        child: Form(
          key: _globalKey,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 200),
            child: Column(
              children: [
                CustomText(Onclick: (value) {
                  name=value;
                },initial: name, hint: 'Enter Product Name', icon: Icons.label,passwordornot: false,),
                SizedBox(
                  height: height * 0.02,
                ),
                CustomText(Onclick:(value){
                  price=value;
                },initial: price, hint: 'Enter Product Price', icon: Icons.monetization_on,passwordornot: false,),
                SizedBox(
                  height: height * 0.02,
                ),
                CustomText(Onclick:(value){
                  Categ=value;
                },initial: Categ, hint: 'Enter Product Category', icon: Icons.category,passwordornot: false,),
                SizedBox(
                  height: height * 0.02,
                ),
                CustomText(Onclick:(value){
                  image=value;
                },initial: image, hint: 'Select Product Image', icon: Icons.image , passwordornot: false,),
                SizedBox(
                  height: height * 0.02,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 120),
                  child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      color: Colors.black,
                      onPressed: (){
                        final instance=Provider.of<Modelhud>(context , listen: false);
                        instance.changeisLoading(true);
                        if (_globalKey.currentState.validate())
                        {
                          _globalKey.currentState.save();
                          Storee.updateproduct(idd,({
                            'name' : name,
                            'category' : Categ,
                            'image' : image,
                            'price' : price,

                          }));

                        }
                         instance.changeisLoading(false);

                      },
                      child: Text(
                        'Update Product',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
