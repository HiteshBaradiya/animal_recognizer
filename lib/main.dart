import 'dart:async';

import 'package:flutter/material.dart';

import 'dart:io';

import 'package:image_picker/image_picker.dart';

void main()=> runApp(
  new MaterialApp(
    theme:
    ThemeData(primaryColor: Colors.red, accentColor: Colors.yellowAccent),
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
  )
);

class SplashScreen extends StatefulWidget{

  @override
  _SplashScreenState createState() => new _SplashScreenState();
  
  }

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 5),()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyApp())));

    return new Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color:Colors.redAccent),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50.0,
                        child:Icon(
                          Icons.pets,
                          color:Colors.redAccent,
                          size: 50.0,
                        ),
                      ),
                      Padding(
                        padding:EdgeInsets.only(top: 10.0),
                      ),
                      Text(
                        "Animal Recognizer",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Padding(
                      padding: EdgeInsets.only(top:20.0),
                    ),
                    Text(
                      "Animal Recognization \n by images",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold
                      ),

                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}



class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }

}

class _MyAppState extends State<MyApp>{

  File _image;

  Future getImage(bool isCamera) async{
    File image;
    if(isCamera){
      image = await ImagePicker.pickImage(source: ImageSource.camera);
    }
    else{
      image = await ImagePicker.pickImage(source: ImageSource.gallery);
    }
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.insert_drive_file),
              onPressed: (){
                getImage(false);
              },
            ),
            SizedBox(height: 10.0,),
            IconButton(
              icon: Icon(Icons.camera_alt),
              onPressed: (){
                getImage(true);
              },
            ),
            _image == null? Container(): Image.file(_image,height: 300.0,width: 300.0,),
          ],
        ),
      ),
    );
  }

}