import 'package:flutter/material.dart';
class CategoryTab extends StatelessWidget {
  CategoryTab({@required this.onclick , @required this.type,});
  final Function onclick;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: GestureDetector(
        onTap: onclick,
        child: Text(
          type,
          style: TextStyle(
            fontSize: 21.0,
          ),
        ),
      ),

    );
  }
}