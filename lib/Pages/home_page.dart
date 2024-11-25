import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
 }
class _HomePageState extends State<HomePage> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  List data =[];
  void onGetData ()async {
    try{
      var snapshot = await db.collection('Pakceg').get();
      setState(() {
        data = snapshot.docs;
        print(data);
      });
    } catch(err){
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    onGetData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Image(image:AssetImage("Assets/Talmuri.jpg"),fit: BoxFit.cover,),
      ),
      body:Column(
        children: [
          SizedBox(height: 40,),
          Row(
            children: [
              Container(
               margin: EdgeInsets.symmetric(horizontal: 30),
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).primaryColor,
                      offset: Offset(0, 10),
                      blurRadius: 20
                    )
                  ]
                ),
                child: Center(child: Text('30 \n day',style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold),)),
              ),
            ],
          ),
          Column(
            children: data.map((i){
              return Container(
                  child: Text('${i['name']}'));
            }).toList()
          )
        ],
    )
    );
  }
}
