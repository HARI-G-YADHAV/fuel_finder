import 'dart:io';
import 'dart:async';
//import 'package:fuel_me/fuel_me.dart' as fuel_me;
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show rootBundle;
//import 'package:flutter/services.dart' show rootBundle;

Future<String> get _localPath async {
  final directory = await getExternalStorageDirectory();

  return directory!.path;
}

Future<File> _getlocalFile(String fileName) async {
  final localPath = await _localPath;
  return File("$localPath/$fileName");
   
}

Future<File> writeToFile(String fileName, String text) async
{
      final file = await _getlocalFile(fileName);

      return file.writeAsString(text);
}

Future<String> readFromFile(String fileName) async
{

   final file = await _getlocalFile(fileName);
   return file.readAsString();
}
Future<String> loadAsset() async {
  return await rootBundle.loadString('asset/store.txt');
}
Future<double> fuel_Me(var paid, var distance) 
async {
  
    int started_km = 58517, difference;
    //String contents = File('asset/store.txt').readAsStringSync();
    String t =  await readFromFile("asset/store.txt");

    var t2 = int.parse(t);
    var p = int.parse(paid!);
    var d = int.parse(distance!);
  

    difference = d - started_km;
    int total_paid = t2 + p;
    double distance_left = ((total_paid/108)*16) - difference;


    //File file = File('asset/store.txt');
    String total = "$total_paid";
    //file.writeAsString(total);

    writeToFile("asset/store.txt",total);

  
    return distance_left;
}
