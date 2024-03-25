import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final dbR= FirebaseDatabase.instance.reference();
  bool On=false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text('Flutter IOT App'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: On?Icon(
                  Icons.lightbulb,
                  size: 200,
                  color: Colors.amber,
                ):Icon(
                  Icons.lightbulb_outline,
                  size: 200,
                ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.teal, ),
                  onPressed: () {
                    dbR.child("Light").set({"Switch" : !On});
                    setState(() {
                      On =!On;
                    });
                  }, child: On?Text("LED On"):Text("LED Off")),
            ],
          )),
    );
  }
}
