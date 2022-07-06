import 'dart:io';
import 'package:contact/screen/home/view/Model.dart';
import 'package:contact/utils/constant/componets/size.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  List<String> name = [];
  List<String> no = [];
  List<String> img = [];

  TextEditingController txtname = TextEditingController();
  TextEditingController txtno = TextEditingController();
  TextEditingController txtemail = TextEditingController();
  File f1 = File("");

  Contact get newContact => Contact();

  //get floatingActionButton => null;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          tooltip: "Add",
          onPressed: () {
            showDialog(
                context: context,
                builder: (context){
                  return AlertDialog(
                    backgroundColor: Colors.brown,
                    content: Container(
                      height: 300,
                      //width: 260,
                      child: SingleChildScrollView(
                        child: Column(
                          children : [
                            GestureDetector(
                              onTap: ()async{
                                ImagePicker img = ImagePicker();
                                XFile? f2  = await img.pickImage(source: ImageSource.gallery);
                                setState((){
                                  f1 = File(f2!.path);
                                },);
                              },
                              child: Container(
                                height: 100,
                                width: 100,
                                child: CircleAvatar(
                                  backgroundImage: FileImage(f1),
                                ),
                              ),
                            ),
                             H(10),
                            TextField(
                              style: TextStyle(color: Colors.white),
                            controller: txtname,
                            decoration: InputDecoration(
                              enabledBorder: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(20),
                                borderSide:  BorderSide(color: Colors.pinkAccent ),

                              ),
                              focusedBorder: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(20),
                                borderSide:  BorderSide(color: Colors.pinkAccent),
                              ),
                              prefixIcon: Icon(Icons.person_outline_outlined,color: Colors.green,),
                              hintText: "Enter Name",
                              hintStyle: TextStyle(color: Colors.white,),
                              floatingLabelAlignment: FloatingLabelAlignment.start,
                            ),
                          ),
                            H(12),
                            TextField(
                              style: TextStyle(color: Colors.white),
                            controller: txtno,
                            decoration: InputDecoration(
                              enabledBorder: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(20),
                                borderSide:  BorderSide(color: Colors.pinkAccent ),

                              ),
                              focusedBorder: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(20),
                                borderSide:  BorderSide(color: Colors.pinkAccent ),

                              ),
                              prefixIcon: Icon(Icons.call,color: Colors.green,),
                              hintText: "Enter Your Mobile",
                              hintStyle: TextStyle(color: Colors.white,),
                              floatingLabelAlignment: FloatingLabelAlignment.start,
                            ),
                            maxLength: 10,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                            ElevatedButton(onPressed: (){
                              setState((){
                                next();
                              });
                              // txtname.clear();
                              // txtno.clear();
                              Navigator.pop(context);
                            }, child: Text("Add")),
                          ],
                        ),
                      ),
                    ),
                  );
                }
            );
          },
          backgroundColor: Colors.red,
          child: const Icon(Icons.add),
        ),
        backgroundColor: Colors.black87,
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text(
            "Contact",
            style: GoogleFonts.robotoFlex(),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                )),
             FlatButton(
               textColor: Colors.white,
               onPressed: () {
                 Navigator.pushNamed(
                   context,
                   'myapp',
                 );
               },
               child: Text("Recents"),
               shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
             ),
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
          child: Column(
            children: <Widget>[
              GestureDetector(
                onTap: (){
                  Modal m1 = Modal(name: txtname.text,gmail: txtemail.text,no: txtno.text,f1: f1.path);
                  Navigator.pushNamed(context, 'det',arguments: m1);
                },
                child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  physics: ClampingScrollPhysics(),
                  itemCount: name.length,
                  shrinkWrap: true,
                  itemBuilder: (context,index)
                  {
                  return
                   Container(
                     height: 60,
                     decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                     ),
                     margin: EdgeInsets.all(2),
                     child: Padding(
                       padding: const EdgeInsets.all(8),
                       child: Row(
                         children: [
                           Container(
                             height: 45,
                             width: 45,
                             child: CircleAvatar(
                               backgroundImage: FileImage(f1),
                             ),
                           ),
                           W(15),
                           Text("${name[index]}",style: TextStyle(color: Colors.white,fontSize: 25),),
                         ],
                       ),
                     ),
                   );
                },),
              ),
              // Align(
              //   alignment: Alignment.topCenter,
              //   child: Container(
              //       alignment: Alignment.center,
              //       padding: EdgeInsets.only(top: 40),
              //       height: 100,
              //       width: 100,
              //       child: FloatingActionButton(
              //         onPressed: () {
              //           String number =
              //               "tel: +918596754785";
              //           launchUrl(Uri.parse(number));
              //         },
              //         child: Icon(Icons.call),
              //         backgroundColor: Colors.green,
              //       )),
              // ),
              // Container(
              //     alignment: Alignment.center,
              //     height: 50,
              //     width: 50,
              //     child: FloatingActionButton(
              //       onPressed: () {
              //         String number =
              //             "sms: +915547859652";
              //         launchUrl(Uri.parse(number));
              //       },
              //       child: Icon(Icons.sms),
              //       backgroundColor: Colors.amber,
              //     )),
            ],
          ),
        ),
      ),
    );
  }
  void next()
  {
    name.insert(0, txtname.text);
    no.insert(0, txtno.text);
  }

  //void launchurl(Uri parse) {}
}

