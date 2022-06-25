import 'dart:io';
import 'package:contact/Model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  List name = [""];
  List no = [""];


  TextEditingController txtname = TextEditingController();
  TextEditingController txtno = TextEditingController();
  TextEditingController txtemail = TextEditingController();
  File f1 = File("");

  get floatingActionButton => null;
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
                    actions: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.topCenter,
                            child: GestureDetector(
                              onTap: ()async{
                                ImagePicker img = ImagePicker();
                                XFile? f2  = await img.pickImage(source: ImageSource.gallery);
                                setState((){
                                  f1 = File(f2!.path);
                                },);
                              },
                              child:Container(
                                height: 100,
                                width: 100,
                                child: CircleAvatar(
                                  backgroundImage: FileImage(f1),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 15,),
                          ElevatedButton(onPressed: (){
                            Model data = Model(mno: txtno.text,name: txtname.text,img: f1.path);
                            Navigator.pushNamed(context, '/',arguments: data);
                            setState((){
                              add();
                            });
                            }, child: Text("Add"))
                        ],
                      ),
                    ],
                    title: TextField(
                      controller: txtname,
                      decoration: InputDecoration(
                        hintText: "Enter Your Name",
                        floatingLabelAlignment: FloatingLabelAlignment.start,
                      ),
                    ),
                    content: TextField(
                      controller: txtno,
                      decoration: InputDecoration(
                        hintText: "Enter Your Mobile",
                        floatingLabelAlignment: FloatingLabelAlignment.start,
                      ),
                      maxLength: 10,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),

                  );
                }
            );
          },
          backgroundColor: Colors.red,
          child: const Icon(Icons.add),
        ),
        backgroundColor: Colors.white,
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
          child: Column(
            children: [
              Row(
                children: [
                  //Container(height: 50,width: 50,padding: EdgeInsets.all(10),child: Image.file(f1)),
                  SizedBox(width: 10,),
                  ListView.builder(
                    itemCount: name.length,
                    shrinkWrap: true,
                    itemBuilder: (context,index)
                    {
                    return
                     Row(
                       children: [
                       Text("$name",style: TextStyle(color: Colors.black,fontSize: 25),),
                       Text("$no",style: TextStyle(color: Colors.black,fontSize: 25),),
                       ],
                     );
                  },),
                ],
              ),
              Container(
                child: Expanded(
                  child: Container(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void add()
  {
       // Navigator.pushNamed(context, '/');

  }

}

