import 'dart:io';
import 'package:firebase_test/CollagePages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
int indexof = 0;
bool exits = false;
List<List> temps = new List<List>();
List<CustomTest> ts1 = List<CustomTest>();
class CustomCollage extends StatelessWidget { CustomCollage({@required this.index,@required this.pages,@required this.sizeLen,});
var sizeLen;
var index;
var pages;
int count = 0;
int _counter = 0;

TextEditingController eCtrl = new TextEditingController();
String value = "";
Future<File> imageFile;

pickImageFromGallery(ImageSource source) {
  imageFile = ImagePicker.pickImage(source: source);
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
  _canShowButton = !_canShowButton;
}

@override
Widget build(BuildContext context) {
  return Card(
      child: Column(
      children: <Widget>[Text('Collage $index'),
  FlatButton(
  onPressed: () {
        indexof = index-1;
        CustomTest temp = new CustomTest(indexing: index,pages: pages,);
        var route = new MaterialPageRoute(builder: (context)=>temp);
        Navigator.push(context,route);
  },
  )],
  ));
}
}

int formatSelected = 1;
int counter = 1;
int currentPage = 0;
bool title = true;
bool newList = true;
List<CustomTest> ts = new List<CustomTest>();

// ignore: must_be_immutable
class CustomTest extends StatelessWidget {CustomTest({@required this.indexing, @required this.pages,});
var indexing;
var pages;
bool status;

int count = 0;



TextEditingController eCtrl = new TextEditingController();
TextEditingController eCtrl2 = new TextEditingController();
TextEditingController eCtrl3 = new TextEditingController();

String value = "";
Future<File> imageFile;
Future<File> imageFile2;

pickImageFromGallery(ImageSource source) {
  imageFile = ImagePicker.pickImage(source: source);
}

pickImageFromGallery2(ImageSource source) {
  imageFile2 = ImagePicker.pickImage(source: source);
}


Widget showImage() {

  return FutureBuilder<File>(
    future: imageFile,
    builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
      if (snapshot.connectionState == ConnectionState.done &&
          snapshot.data != null && pages==1) {
          return Image.file(
            snapshot.data,
            width: 180,
            height: 180,
          );

      }else if(snapshot.connectionState == ConnectionState.done &&
          snapshot.data != null && pages!=1){
        return Image.file(
          snapshot.data,
          width: 120,
          height: 120,
        );
    } else if (snapshot.error != null) {
        return const Text(
          'Error Picking Image',
          textAlign: TextAlign.left,
        );
      } else {
        return const Text(
          '',
          textAlign: TextAlign.left,
        );
      }
    },
  );
}

Widget showImage2() {
  return FutureBuilder<File>(
    future: imageFile2,
    builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
      if (snapshot.connectionState == ConnectionState.done &&
          snapshot.data != null && pages==1) {
        return Image.file(
          snapshot.data,
          width: 200,
          height: 200,
        );

      }else if(snapshot.connectionState == ConnectionState.done &&
          snapshot.data != null && pages!=1){
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
          '',
          textAlign: TextAlign.left,
        );
      }
    },
  );
}

bool _canShowButton = true;
bool _canShowButton2 = true;



void hideWidget() {
  _canShowButton2 = !_canShowButton2;
  _canShowButton = !_canShowButton;
}
var align;
  @override
  Widget build(BuildContext context) {

    print(ts.length);
    print(temps.length);
    if(title){
      align =  CrossAxisAlignment.center;
    }else{
      align =  CrossAxisAlignment.start;
    }

    Widget formats(int i){
      switch(i){
        case 1:
        return Column(
            crossAxisAlignment: align,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              new TextField(
                textAlign: TextAlign.center,
                maxLines: 1,
                maxLength: 70,
                controller: eCtrl,
                decoration: new InputDecoration.collapsed(
                    hintText: "Title"),

                onChanged: (String text) {},
                onSubmitted: (String text) {
                  value = text;
                  eCtrl.clear();
                },
              ),
              showImage(),
              !_canShowButton
                  ? const SizedBox.shrink()
                  : RaisedButton(

                  child: Text("Select Image from Gallery"),
                  onPressed: () {
                    pickImageFromGallery(ImageSource.gallery);
                    _canShowButton = false;
                    (context as Element).reassemble();
                  }
              ),
              SizedBox(height: 100),
              new TextField(
                textAlign: TextAlign.center,
                maxLines: 1,
                maxLength: 70,
                controller: eCtrl2,
                decoration: new InputDecoration.collapsed(
                    hintText: "Author"),

                onChanged: (String text) {},
                onSubmitted: (String text) {
                  value = text;
                  eCtrl.clear();
                },
              ),
              SizedBox(height: 100),
              new TextField(
                textAlign: TextAlign.center,
                maxLines: 1,
                maxLength: 70,
                controller: eCtrl3,
                decoration: new InputDecoration.collapsed(
                    hintText: "Date"),

                onChanged: (String text) {},
                onSubmitted: (String text) {
                  value = text;
                  eCtrl3.clear();
                },
              ),],
          );
          break;
        case 2:
          return Row(
              children: [
                Column(children: [ showImage(),
                  !_canShowButton
                      ? const SizedBox.shrink()
                      : RaisedButton(
                      child: Text("Select Image from Gallery"),
                      onPressed: () {
                        pickImageFromGallery(ImageSource.gallery);
                        _canShowButton = false;
                        (context as Element).reassemble();
                      }
                  ),
                ]),
                new Column(children: [
                  SizedBox(width: 400, child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    controller: eCtrl,
                    decoration: new InputDecoration.collapsed(
                        hintText: "ADD SOMETHING"),

                    onChanged: (String text) {},
                    onSubmitted: (String text) {
                      value = text;
                      eCtrl.clear();
                    },
                  ),
                  ),
                ]),]);
          break;
        case 3:
          return Column(
            crossAxisAlignment: align,
            children: [
              TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                controller: eCtrl,
                decoration: new InputDecoration.collapsed(
                    hintText: "ADD SOMETHING"),

                onChanged: (String text) {},
                onSubmitted: (String text) {
                  value = text;
                  eCtrl.clear();
                },
              ),
            ],
          );
          break;
        case 4:
          return Row(
              children: [
                Column(children: [
                  showImage(),
                  !_canShowButton
                      ? const SizedBox.shrink()
                      : RaisedButton(
                      child: Text("Select Image from Gallery"),
                      onPressed: () {
                        pickImageFromGallery(ImageSource.gallery);
                        _canShowButton = false;
                        (context as Element).reassemble();
                      }
                  ),
                  SizedBox(height: 100),
                  showImage2(),
                  !_canShowButton2
                      ? const SizedBox.shrink()
                      : RaisedButton(
                      child: Text("Select Image from Gallery"),
                      onPressed: () {
                        pickImageFromGallery2(ImageSource.gallery);
                        _canShowButton2 = false;
                        (context as Element).reassemble();
                      }
                  ),
                ]),
                Column(children: [
                  SizedBox(height: 200,width: 200, child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    controller: eCtrl,
                    decoration: new InputDecoration.collapsed(
                        hintText: "ADD SOMETHING"),

                    onChanged: (String text) {},
                    onSubmitted: (String text) {
                      value = text;
                      eCtrl.clear();
                    },
                  ),

                  ),
                  SizedBox(height: 200,width: 200, child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  controller: eCtrl2,
                  decoration: new InputDecoration.collapsed(
                  hintText: "ADD SOMETHING"),

                  onChanged: (String text) {},
                  onSubmitted: (String text) {
                  value = text;
                  eCtrl2.clear();
                  },
                  ),
                  )],
                ),
              ]);
      break;
    }
    }

    return Scaffold(
        appBar: AppBar(title: Text('Collage $indexing Page $counter'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            if(currentPage !=0){
              currentPage--;
              --counter;
              Navigator.pop(context);
              Navigator.pop(context);
            }else{
              Navigator.of(context).popUntil((route) => route.isFirst);
            }
          },
        ),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  if(count !=0){
                    formatSelected = 1;
                    ts.add(new CustomTest(indexing: indexing, pages: ++pages));
                    currentPage++;
                    counter++;
                    count = 1;
                    var matRoute = MaterialPageRoute(builder: (context)=>ts.elementAt(currentPage-1));
                    Navigator.push(context,matRoute);
                  }else if(currentPage+1 == pages){
                    showDialog(context: context, useRootNavigator: false,builder: (BuildContext context) =>
                    SimpleDialog(
                      title: Text('Select Page Format'),
                      children: [
                        SimpleDialogOption(
                          onPressed: (){
                            title = true;
                            formatSelected = 1;
                            ts.add(new CustomTest(indexing: indexing, pages: ++pages));
                            currentPage++;
                            counter++;
                            var matRoute = MaterialPageRoute(builder: (context)=>ts.elementAt(currentPage-1));
                            Navigator.push(context,matRoute);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.article_rounded, size: 36.0, color: Colors.red),
                              Padding(
                                padding: const EdgeInsetsDirectional.only(start: 16.0),
                                child: Text("Title Page"),
                              ),
                            ],
                          ),
                        ),
                        SimpleDialogOption(
                          onPressed: (){
                            title = false;
                            formatSelected = 2;
                            ts.add(new CustomTest(indexing: indexing, pages: ++pages));
                            currentPage++;
                            counter++;
                            var matRoute = MaterialPageRoute(builder: (context)=>ts.elementAt(currentPage-1));
                            Navigator.push(context,matRoute);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.article_rounded, size: 36.0, color: Colors.orange),
                              Padding(
                                padding: const EdgeInsetsDirectional.only(start: 16.0),
                                child: Text("One Image"),
                              ),
                            ],
                          ),
                        ),
                        SimpleDialogOption(
                          onPressed: (){
                            title = false;
                            formatSelected = 3;
                            ts.add(new CustomTest(indexing: indexing, pages: ++pages));
                            currentPage++;
                            counter++;
                            var matRoute = MaterialPageRoute(builder: (context)=>ts.elementAt(currentPage-1));
                            Navigator.push(context,matRoute);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.article_rounded, size: 36.0, color: Colors.yellow),
                              Padding(
                                padding: const EdgeInsetsDirectional.only(start: 16.0),
                                child: Text("No images"),
                              ),
                            ],
                          ),
                        ),
                        SimpleDialogOption(
                          onPressed: (){
                            title = false;
                            formatSelected = 4;
                            ts.add(new CustomTest(indexing: indexing, pages: ++pages));
                            currentPage++;
                            counter++;
                            var matRoute = MaterialPageRoute(builder: (context)=>ts.elementAt(currentPage-1));
                            Navigator.push(context,matRoute);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.article_rounded, size: 36.0, color: Colors.blue),
                              Padding(
                                padding: const EdgeInsetsDirectional.only(start: 16.0),
                                child: Text("Two Images Two Text fields"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ));
                  }else{
                    counter++;
                    currentPage++;
                    var matRoute = MaterialPageRoute(builder: (context)=>ts.elementAt(currentPage-1));
                    Navigator.push(context,matRoute);
                  }
                },
                child: Icon(
                  Icons.add_circle,
                  size: 26.0,
                ),
              )
          ),
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  if(count !=0){
                    formatSelected = 1;
                    ts.add(new CustomTest(indexing: indexing, pages: ++pages));
                    currentPage++;
                    counter++;
                    count = 1;
                    var matRoute = MaterialPageRoute(builder: (context)=>ts.elementAt(currentPage-1));
                    Navigator.push(context,matRoute);
                  }else if(currentPage+1 == pages){
                    ts.add(new CustomTest(indexing: indexing, pages: ++pages));
                    counter++;
                    currentPage++;
                    var matRoute = MaterialPageRoute(builder: (context)=>ts.elementAt(currentPage-1));
                    Navigator.push(context,matRoute);
                  }else{
                    counter++;
                    currentPage++;
                    var matRoute = MaterialPageRoute(builder: (context)=>ts.elementAt(currentPage-1));
                    Navigator.push(context,matRoute);

                  }
                },
                child: Icon(
                    Icons.arrow_forward
                ),
              )
          ),
        ],),
        body: Center(child:
            formats(formatSelected)
            )
        );
  }
}

