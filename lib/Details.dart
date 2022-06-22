import 'package:contact/Model.dart';
import 'package:flutter/material.dart';

class detail extends StatefulWidget {
  const detail({Key? key}) : super(key: key);

  @override
  State<detail> createState() => _detailState();
}

class _detailState extends State<detail> {
  @override
  Widget build(BuildContext context) {
    Model m2 = ModalRoute.of(context)!.settings.arguments as Model;
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black87,
          appBar: AppBar(),
          body: Column(
            children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    child:  Image.asset("${m2.img}",fit: BoxFit.fill),
                  ),
                ),
              SizedBox(height: 20,),
              Row(
                children: [
                  SizedBox(width: 15,),
                  Icon(Icons.person,color: Colors.white,),
                  SizedBox(width: 15,),
                  Text("${m2.l1}",style: TextStyle(color: Colors.white),),
                ],
              ),
              SizedBox(height: 15,),
              Row(
                children: [
                  SizedBox(width: 15,),
                  Icon(Icons.phone,color: Colors.white,),
                  SizedBox(width: 15,),
                  Expanded(child: Text("${m2.l2}",style: TextStyle(color: Colors.white),)),
                  Text("Mobile",style: TextStyle(color: Colors.white)),
                  SizedBox(width: 15,),
                ],
              ),
              SizedBox(height: 15,),
              Row(
                children: [
                  SizedBox(width: 15,),
                  Icon(Icons.email,color: Colors.white,),
                  SizedBox(width: 15,),
                  Expanded(child: Text("",style: TextStyle(color: Colors.white),)),
                  Text("Work",style: TextStyle(color: Colors.white)),
                  SizedBox(width: 15,),
                ],
              ),
            ],
          ),
        ),
    );
  }
}
