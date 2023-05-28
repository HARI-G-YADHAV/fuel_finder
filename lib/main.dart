import 'package:flutter/material.dart';
import 'fuel_me.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

Future<String> loadAsset() async {
  return await rootBundle.loadString('android/assets/asset/store.txt');
}

main()
{
  runApp(myapp());
  
}
class myapp extends StatefulWidget {
   const myapp({super.key});
 
  @override
  State<myapp> createState() => _myappState();
}

class _myappState extends State<myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home:Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: const Text(
                'Fuel Finder',
                textAlign: TextAlign.left,
                style: TextStyle(
                color: Colors.yellow,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              )
              ),
            ),
            body: Home()
          )
      );
  }

}
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
 
  @override
  State<Home> createState() => _HomeState();
  
}

class _HomeState extends State<Home>{
  //Home({super.key});
  String result = "0";
  TextEditingController paidController = TextEditingController();
  TextEditingController distanceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SafeArea(
        child: Container(
          width: double.infinity,
          child:  Column(
            children: [
              TextFormField(
                controller: paidController,  
                decoration: const InputDecoration(  
                  icon: const Icon(Icons.payment),  
                  hintText: 'Enter paid amount',  
                  labelText: 'Amount',  
                ),  
              ),
              const SizedBox(
                height: 20, 
              ),    
              TextFormField(
                controller: distanceController,  
                decoration: const InputDecoration(  
                  icon: const Icon(Icons.social_distance),  
                  hintText: 'Enter your distance',  
                  labelText: 'Distance',  
                ),
              ),
              const SizedBox(
                height: 50, 
              ),  
              Container(
                 width: 150.0,
                 height: 50.0,
                 child: ElevatedButton(
                  onPressed: () {
                    setState((){
                      print('Clicked');
                      print(paidController.text);
                      print(distanceController.text);
                      double ans = fuel_Me(paidController.text, distanceController.text);
                      result = ans.toString();
                      print(result);
                    });
                   
                  },
                  child: const Text('SUBMIT'),
                           ),
              ),
              const SizedBox(
                height: 50, 
              ),  
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text("Distance Left:",
                    style: TextStyle(
                    fontSize: 30,
                    ),
                  ),
                  Text(result,
                  style: TextStyle(
                  fontSize: 30,
                  ),
                  ),              
                ],
              ),
            ],
          ),
        )
      ),
        
    );
  }
}
