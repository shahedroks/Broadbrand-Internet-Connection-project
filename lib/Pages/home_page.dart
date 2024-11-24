import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  FirebaseFirestore fb = FirebaseFirestore.instance;
  List data =[];
  void onGetData ()async {
    try{
      var storesdata = fb.collection('pakceg').doc();
      data = storesdata
    } catch(err){

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Image(image:AssetImage("Assets/Talmuri.jpg"),fit: BoxFit.cover,),
      ),
      body:Container(

      ),
    );
  }
}
