import 'dart:io';

//import 'package:fuel_me/fuel_me.dart' as fuel_me;

double fuel_Me(var paid, var distance) 
{
    int started_km = 58517, difference;
    String contents = new File('android/assets/asset/store.txt').readAsStringSync();
    var t = int.parse(contents);


    var p = int.parse(paid!);
    var d = int.parse(distance!);
  

    difference = d - started_km;
    int total_paid = t + p;
    double distance_left = ((total_paid/108)*16) - difference;


    File file = new File('android/assets/asset/store.txt');
    String total = "$total_paid";
    file.writeAsString(total);

  
    return distance_left;
}
