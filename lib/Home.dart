import 'package:contact/Model.dart';
import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  List img = [

  ];
  List name = [];
  List no = [
  ];

  TextEditingController txtname = TextEditingController();
  TextEditingController txtno = TextEditingController();
  TextEditingController txtemail = TextEditingController();

  get floatingActionButton => null;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: Text(
            "Contact",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                )),
            PopupMenuButton(itemBuilder: (value) {
              return [
                PopupMenuItem(
                  child: Text("Setting"),
                  value: "Setting",
                  onTap: () {},
                ),
                PopupMenuItem(
                  child: Text("Help"),
                  value: "Help",
                  onTap: () {},
                ),
              ];
            })
          ],
        ),
        body: Center(
          child: floatingActionButton[
          FloatingActionButton(onPressed: (){})
          ],
        )
      ),
    );
  }
}

