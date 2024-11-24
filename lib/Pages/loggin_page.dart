import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class LogginPage extends StatefulWidget {
  const LogginPage({super.key});
  @override
  State<LogginPage> createState() => _LogginPageState();
}
class _LogginPageState extends State<LogginPage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore store =FirebaseFirestore.instance;
  TextEditingController email =TextEditingController();
  TextEditingController password =TextEditingController();
  bool _isVisible = false;
  void onChakSignIn ()async{
    try{
      var isAuthState =await auth.signInWithEmailAndPassword(email: email.text, password: password.text);
      Navigator.pushNamed(context, '/homepage');
    } on FirebaseAuthException
    catch(e)
    {

    }
  }
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Container(
          width:MediaQuery.of(context).size.width*10,
          height:MediaQuery.of(context).size.height*10,
          // decoration: BoxDecoration(image:DecorationImage(image: AssetImage('Assets/Buy')) ),
            decoration: BoxDecoration(image: DecorationImage(image: AssetImage('Assets/Login1.jpg'),fit: BoxFit.cover)),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 120,),
                    Container(
                      margin: EdgeInsets.only(left: 220,top: 80),
                      child: Text('Welcome \n Back',
                        style: TextStyle(
                            fontSize: 40,fontWeight: FontWeight.bold,color: Colors.black,),),
                    ),
                    SizedBox(height: 140,),
                
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child: TextField(controller: email,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(color: Colors.grey)),labelText: 'Enter Your Email',
                        focusedBorder: OutlineInputBorder(borderSide:BorderSide(color: Colors.black),borderRadius: BorderRadius.circular(15),)
                      ),),
                    ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                            child: TextFormField(controller: password,
                              obscureText:!_isVisible ,
                
                              decoration: InputDecoration(
                                suffixIcon: IconButton(onPressed: (){
                                 setState(() {
                                   _isVisible = !_isVisible;
                                 });
                                }, icon: _isVisible?Container(child: Icon(CupertinoIcons.eye)):Container(child: Icon(CupertinoIcons.eye_slash))),
                                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(color: Colors.grey)),labelText: 'Password',
                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),borderRadius: BorderRadius.circular(15))
                              ),),
                          ),
                    AnimatedContainer(duration: Duration(

                    )),
                    SizedBox(height: 130,),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 40),
                          child: Text('Sing in',style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: (){
                            onChakSignIn();
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 40),
                            child: ClipRRect(
                
                              borderRadius: BorderRadius.circular(50),
                              child: Container(
                                decoration: BoxDecoration(color: Colors.grey),
                                child: Icon(Icons.arrow_forward,size: 60,),)
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 160,),
                    Row(children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, '/register');
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 40),
                            child: Text('Sing up',style: TextStyle(fontSize: 20,decoration: TextDecoration.underline),)),
                      ),
                      Spacer(),
                      Container(
                          margin:EdgeInsets.only(right: 30),
                          child: Text('forgate password',style: TextStyle(color: Colors.green,fontSize: 15,),))
                    ],
                
                    )
                
                  ],
                ),
              ),
            ),

        );


  }
}
