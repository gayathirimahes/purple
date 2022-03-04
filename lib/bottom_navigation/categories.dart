import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';

class categories extends StatefulWidget {
  const categories({Key? key}) : super(key: key);

  @override
  State<categories> createState() => categories_screen();
}

class categories_screen extends State<categories> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: ExpansionCard(
      borderRadius: 20,
      background: Image.asset(
        "assets/img/gif1.gif",
        fit: BoxFit.cover,
      ),
      title: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Header",
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
              ),
            ),
            Text(
              "Sub",
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ],
        ),
      ),
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(horizontal: 7),
          child: Text("Content goes over here !",
              style: TextStyle(fontSize: 20, color: Colors.black)),
        )
      ],
    ));
  }
}
