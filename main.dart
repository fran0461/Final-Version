import 'package:firebase_core/firebase_core.dart';
import 'dart:io';
import 'package:drop_cap_text/drop_cap_text.dart';
import 'package:firebase_test/Views/home_view.dart';
import 'package:firebase_test/locator.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'CustomCollage.dart';
//async
/*
void main(){
  setupLocator();
  runApp(MyApp());
}
*/
bool greaterVal = false;
int pageNum = 1;
BuildContext globContext;

void main()=> runApp(new MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
  return new MaterialApp(
    title: 'Page adding',
    theme: new ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: new MyHomePage(title: 'Test'),
  );
  }
}

class MyHomePage extends StatefulWidget{
  MyHomePage({Key key, this.title}):super(key:key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  int _counter = 0;

  void _incrementCounter(){
    setState(() {
      _counter++;
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: Center(
        child: Container(
            child: ListView.builder(
              itemCount: _counter,
              itemBuilder: (context, int index) {
                return CustomCollage(
                  index: ++index,
                  pages: 1,
                  sizeLen: ++index,
                );
              },
            )
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }
}




class Pages extends StatefulWidget{
  final TextField textField = new TextField( keyboardType: TextInputType.multiline,
    maxLines: null,
    decoration: new InputDecoration.collapsed(hintText: "ADD SOMETHING"));
  @override
  _MyPages createState() => _MyPages();
}

class _MyPages extends State<Pages> {
  TextEditingController eCtrl = new TextEditingController();
  String value = "";
  Future<File> imageFile;

  pickImageFromGallery(ImageSource source) {
    setState(() {
      imageFile = ImagePicker.pickImage(source: source);
    });
  }

  Widget showImage() {
    return FutureBuilder<File>(
      future: imageFile,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data != null) {
          return Image.file(
            snapshot.data,
            width: 150,
            height: 150,
          );
        } else if (snapshot.error != null) {
          return const Text(
            'Error Picking Image',
            textAlign: TextAlign.left,
          );
        } else {
          return const Text(
            'No Image Selected',
            textAlign: TextAlign.left,
          );
        }
      },
    );
  }

  bool _canShowButton = true;

  void hideWidget() {
    setState(() {
      _canShowButton = !_canShowButton;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new Scaffold(
            body: Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  showImage(),
                  !_canShowButton
                      ? const SizedBox.shrink()
                      :RaisedButton(
                      child: Text("Select Image from Gallery"),
                      onPressed: (){
                        pickImageFromGallery(ImageSource.gallery);
                        hideWidget();
                      }
                  ),

                  new TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    controller: eCtrl,
                    decoration: new InputDecoration.collapsed(hintText: "ADD SOMETHING"),

                    onChanged: (String text){
                      setState(() {
                        //value = text;
                      });
                    },
                    onSubmitted: (String text){
                      setState(() {
                        value = text;
                      });
                      eCtrl.clear();
                    },
                  ),
                ],
              ),
            )
        )
    );
  }
}

/*
class MyApp extends StatelessWidget{
@override
Widget build(BuildContext context) {
  return MaterialApp(
    title: 'Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: Page1(),
  );
}
}*/

/*
              RaisedButton(
              onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder:(context)=>Page2()));
        },
          child: Text('Go back to Page 2'),
        ),
            ],
          ),
        ),
    ));
  }
}




class Page2 extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(title: Text('Page 2'),),
        body: Center(child: RaisedButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          child: Text('Go back to page 1'),
        ),)
    );
  }
}

*/
List<PagesNav> pageSel = List();
class PagesNav extends StatelessWidget{
  @override
  Widget build(BuildContext context){
  globContext = context;
    return Scaffold(
      appBar: AppBar(
        title: Text("Page $pageNum"),
      ),
      body: Column(
        children: <Widget>[
         getNav(),
        ],
));
}
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      ElevatedButton(
        onPressed: (){
          pageNum--;
          Navigator.of(globContext).pop;
        },
        child: Text('Go Back'),
      ),
      ElevatedButton(
        onPressed: (){
          pageNum++;
          if(pageSel[pageNum--]!=null){
            Navigator.of(globContext).push;
          }else{
            PagesNav newPage = new PagesNav();
            pageSel.add(newPage);
            Navigator.of(globContext).push;
          }
        },
        child: Text('Next Page'),)],);
  }
}

Widget getNav(){
  if(greaterVal){
    return Column(children: <Widget>[
  ElevatedButton(
  onPressed: (){
    pageNum--;
    Navigator.of(globContext).pop;
  },
  child: Text('Go Back'),
  ),
  ElevatedButton(
  onPressed: (){
    pageNum++;
    if(pageSel[pageNum--]!=null){
      Navigator.of(globContext).push;
    }else{
      PagesNav newPage = new PagesNav();
      pageSel.add(newPage);
      Navigator.of(globContext).push;
    }
  },
  child: Text('Next Page'),)],);
  }else{
    return Column(children: <Widget>[
      ElevatedButton(
        onPressed: (){
          pageNum++;
          if(pageSel[pageNum--]!=null){
            Navigator.of(globContext).push;
          }else{
            PagesNav newPage = new PagesNav();
            pageSel.add(newPage);
            Navigator.of(globContext).push;
          }
        },
        child: Text('Go Next'),
      ),
   ],);
  }
}

