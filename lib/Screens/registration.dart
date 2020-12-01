import 'package:flutter/material.dart';
import 'package:flutter_app1/widgets/custom_textfield.dart';
import 'package:flutter_app1/Services/Auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app1/providers/modul_hud.dart';
class RegisterScreen extends StatelessWidget {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  static String id = 'RegisterScreen';
  String email, password;
  final _Auth = Auth();
  bool visibleornot=false;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.orangeAccent,
        body: ModalProgressHUD(
          inAsyncCall:Provider.of<Modelhud>(context).ischange,
          child: Form(
            key: _globalKey,
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 70.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * .2,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image(image: AssetImage('images/icons/appicon.png')),
                        Positioned(
                          bottom: 0,
                          child: Text(
                            'Fouad Online Shopping',
                            style: TextStyle(
                              fontFamily: 'Lobster',
                              fontSize: 25.0,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * .1,
                ),
                CustomText(
                  Onclick: (value) {},
                  hint: 'Enter Your Name',
                  icon: Icons.account_box,
                  passwordornot: false,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                CustomText(
                  Onclick: (value) {
                    email = value;
                  },
                  hint: 'Enter Your Email',
                  icon: Icons.email,
                  passwordornot: false,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                CustomText(
                  Onclick: (value) {
                    password = value;
                  },
                  hint: 'Enter Your Password',
                  icon: Icons.lock,
                  passwordornot: true,
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 120),
                  child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      color: Colors.black,
                      onPressed: () async {
                        final instance=Provider.of<Modelhud>(context , listen: false);
                        instance.changeisLoading(true);
                        if (_globalKey.currentState.validate())
                        {
                          _globalKey.currentState.save();
                          try {
                            final authResult = await _Auth.signUp(email, password);
                            instance.changeisLoading(false);
                          }
                          catch (e) {
                            print(e);
                          }
                        }
                        instance.changeisLoading(false);
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )),
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Do have an account ? ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );

  }
}
