import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';


class MyApp extends StatefulWidget {
  @override
  MyAppState createState() {
    return new MyAppState();
  }
}
class MyAppState extends State<MyApp> {
  final imgUrl = "https://github.com/Abdul-Wahab777/Book_App/blob/master/assets/Bio%2010th%202014%20group2.pdf";
  bool downloading = false;
  var progressString = "";

  @override
  void initState() {
    super.initState();
 
    downloadFile();
    
  }
var dir;
var path ;
    Dio dio = Dio();
  Future<void> downloadFile() async {

    try {
       dir = await getApplicationDocumentsDirectory();
      //  Directory directory= await new Directory(dir.path+'/'+'dir').create(recursive: true);
       path="${dir.path}/pd1f"; 
       await dio.download(imgUrl, path,
       onReceiveProgress: (rec, total) {
        print("Rec: $rec , Total: $total");

        setState(() {
          downloading = true;
          progressString = ((rec / total) * 100).toStringAsFixed(0) + "%";
        });
      });
    } catch (e) {
      print(e);
    }

    setState(() {
      downloading = false;
      progressString = "Completed";
    });
    
    print("Download completed");
    
  }

  
 
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AppBar"),
        actions: [
          //   IconButton(icon: Icon(Icons.access_alarm_outlined), onPressed: (){
          //      _localPath();
      
          // }),
          IconButton(icon: Icon(Icons.account_balance_wallet_outlined), onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Images(path: path)));
          })
        ],
      ),
      body: Center(
         
        child: downloading
            ? Container(
                height: 120.0,
                width: 200.0,
                child: Card(
                  color: Colors.black,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "Downloading File: $progressString",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              )
              // :Text("Check your internet")
              :Text("Check your internet"),  
            // : Image.file(_localFile),
      ),
    );
  }
}
class Images extends StatefulWidget {
  var path;
Images({Key key,@required this.path}):super(key: key);
 

  @override
  _ImagesState createState() => _ImagesState();
}

class _ImagesState extends State<Images> {
 
  PDFDocument pdf;
  bool isLoading = true;
  @override
  void initState() {
      super.initState();
      loadingpdf();
  }
 

   loadingpdf()async{
    // pdf = await PDFDocument.fromFile(File(widget.path));
    // pdf =await PDFDocument.fromAsset("assets/19484 Abdul wahab.pdf");
    setState(() {
      isLoading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
           IconButton(icon: Icon(Icons.access_alarm_outlined), onPressed: (){
           print(widget.path);
          }),
        ],        
      ), 
      body: Container(
        child: Image.file(File(widget.path)),
      // child:Center(child:PDFViewer(
      //   showIndicator: false,
      //   document:pdf)),      
      ),
    );
  }
}

