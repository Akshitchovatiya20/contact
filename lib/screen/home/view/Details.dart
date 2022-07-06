import 'dart:io';

import 'package:contact/main.dart';
import 'package:contact/screen/home/view/Model.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/constant/componets/size.dart';

class detail extends StatefulWidget {
  const detail({Key? key}) : super(key: key);

  @override
  State<detail> createState() => _detailState();
}

class _detailState extends State<detail> {

  @override
  Widget build(BuildContext context) {
    Modal m2 = ModalRoute.of(context)!.settings.arguments as Modal;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          backgroundColor: Colors.black87,
          actions: [
           IconButton(onPressed: (){}, icon: Icon(Icons.account_box)),
            IconButton(onPressed: (){}, icon: Icon(Icons.star_border)),
            Switch(value: themeData, onChanged: (value){
              setState((){
                themeData = value;
              });
              data.add(themeData);
            })
         ],
        ),
        body: Column(
          children: [
            Container(
              height: 200,
              child: Center(
                child: Container(
                  height: 100,
                  width: 100,
                  child: CircleAvatar(
                    backgroundImage: FileImage(File(m2.f1.toString())),
                  ),
                ),
              ),
            ),
            Text(
              "${m2.name}",
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            H(15),
            Container(
              padding: EdgeInsets.all(10),
              height: 1,
              color: Colors.grey.shade800,
            ),
            H(5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    String no = "tel: +91(${m2.no})";
                    launchUrl(Uri.parse(no));

                  },
                  icon: Icon(
                    Icons.call,
                    size: 25,
                    color: Colors.blue,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    String no = "sms: ${m2.no}";
                    launchUrl(Uri.parse(no));
                  },
                  icon: Icon(
                    Icons.sms,
                    size: 25,
                    color: Colors.blue,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    String no = "${m2.no}";
                    await Share.share(no);
                  },
                  icon: Icon(
                    Icons.share,
                    size: 25,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            H(5),
            Container(
              padding: EdgeInsets.all(10),
              height: 1,
              color: Colors.grey.shade800,
            ),
            H(20),
            Container(
              height: 130,
              color: Colors.grey.shade800,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 25,top: 15,bottom: 20),
                          child: Text(
                            "Contact info",style: TextStyle(color: Colors.white,fontSize: 25),)),
                    ],
                  ),
                  H(10),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        child: IconButton(
                            onPressed: () {
                              String no = "tel: +91(${m2.no})";
                              launchUrl(Uri.parse(no));
                            },
                            icon: Icon(
                              Icons.call,
                              size: 25,
                              color: Colors.white,
                            )),
                      ),
                      W(15),
                      Expanded(
                        child: Text(
                          "${m2.no}",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          String no = "sms: (${m2.no})";
                          launchUrl(Uri.parse(no));
                        },
                        icon: Icon(
                          Icons.sms,
                          size: 25,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
