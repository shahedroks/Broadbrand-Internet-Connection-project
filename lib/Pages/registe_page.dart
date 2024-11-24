import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ecommerces_project/Bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}
class _RegisterPageState extends State<RegisterPage> {
  FirebaseAuth auth =FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;
  TextEditingController name =TextEditingController();
  TextEditingController email =TextEditingController();
  TextEditingController password =TextEditingController();
  bool isVisible = false;
  void onRegister() async {
    // final url = Uri.parse('http://68.178.163.174:5503/user/register');
    // Map body = {
    //   'name': name.text,
    //   'email': email.text,
    //   'password': password.text,
    //   'role': 'user',
    // };
    //
    // Response res = await post(url, body: body);
    //
    // if(res.statusCode == 201){
    //   Navigator.pushNamed(context, '/');
    // }

    try{
      var authState = await auth.createUserWithEmailAndPassword(email: email.text, password: password.text);
      // await db.collection('user').add({
      //   'name': name.text,
      //   'email': email.text,
      //   'id': authState.user!.uid,
      //   'role': 'user',
      // });
      Navigator.pushNamed(context, '/');
    } on FirebaseAuthException catch(err){
      if(err.code == 'email-already-exists'){
        print('Already Email Used');
      }else if(err.code == 'invalid-password') {
        print('Password must be of 6 digits');
      }
    }
  }
  // bool _isPasswordEightCharecters = false;
  // bool _isHasOneNumber = false;
  // void onPasswordMatch (passwordd){
  //   final numberRegexp = RegExp(r'[0-9]');
  //  setState(() {
  //    _isPasswordEightCharecters =false;
  //    if(passwordd.length >= 8)
  //      _isPasswordEightCharecters = true;
  //
  //    _isHasOneNumber = false;
  //    if (numberRegexp.hasMatch(passwordd))
  //      _isHasOneNumber = true;
  //  });
  // }
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   onPasswordMatch(password.text);
  // }
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Container(
      width:MediaQuery.of(context).size.width*10,
      height:MediaQuery.of(context).size.height*10,
      // decoration: BoxDecoration(image:DecorationImage(image: AssetImage('Assets/Buy')) ),
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage('Assets/Register1.jpg'),fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 80,
              ),
              Container(
                margin: EdgeInsets.only(left: 220,top: 80),
                child: Text(
                  'Create \n Account',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextField(
                  controller: name,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.grey)),
                      labelText: 'Name',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(15),
                      )),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextField(
                  controller: email,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.grey)),
                      labelText: 'Enter Your Email',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(15),
                      )),
                ),
              ),
              Container(
                        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: TextFormField(
                          controller: password,
                          onChanged: (value) {
                            BlocProvider.of<CounterBolc>(context)
                                .add(onPasswordChsk(value));
                            // onPasswordMatch(password.text);
                          },
                          obscureText:!isVisible,
                          decoration: InputDecoration(
                              suffixIcon:IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isVisible = !isVisible;
                                    });
                                  },
                                  icon:isVisible ? Icon(CupertinoIcons.eye)
                                      : Icon(CupertinoIcons.eye_slash)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(color: Colors.grey)),
                              labelText: 'Password',
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(15))),
                        )),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  BlocBuilder<CounterBolc, CounterState>(builder: (context, state) {
                    return AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      margin: EdgeInsets.only(left: 25),
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          color:  state.isPasswordEight != false? Colors.green : Colors.transparent,
                          border: Border.all(color: Colors.grey.shade500),
                          borderRadius: BorderRadius.circular(50)),
                      child: Container(
                          child: Icon(
                            CupertinoIcons.checkmark_alt,
                            size: 15,
                            color: Colors.white,
                          )),
                    );
                  }),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Must be 8 Characters')
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  BlocBuilder<CounterBolc, CounterState>(builder: (context, state) {
                    return AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      margin: EdgeInsets.only(left: 25),
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          color: state.isPasswordOne != false? Colors.green
                             : Colors.transparent,
                          border: Border.all(color: Colors.grey.shade500),
                          borderRadius: BorderRadius.circular(50)),
                      child: Container(
                          child: Icon(
                            CupertinoIcons.checkmark_alt,
                            size: 15,
                            color: Colors.white,
                          )),
                    );
                  }),
                  // Container(
                  //   margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                  //   child: BlocBuilder <CounterBolc , CounterState>(
                  //       builder: (context, state) {
                  //         return TextFormField(controller: password,
                  //           // onChanged: (value){
                  //           //   // BlocProvider.of<CounterBolc>(context).add(onPasswordEightCharecters(value));
                  //           //   // onPasswordMatch(password.text);
                  //           // },
                  //           obscureText: !_isVisible,
                  //           decoration: InputDecoration(
                  //               suffixIcon: IconButton(onPressed: (){
                  //                 setState(() {
                  //                   _isVisible = !_isVisible;
                  //                 });
                  //               }, icon:_isVisible?Icon(CupertinoIcons.eye):Icon(CupertinoIcons.eye_slash)),
                  //               enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide:BorderSide(color: Colors.grey)),labelText: 'Password',
                  //               focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),borderRadius: BorderRadius.circular(15))
                  //           ),);
                  //       }
                  //   ),
                  // ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Must be Math One Number')
                ],
              ),
              SizedBox(
                height: 130,
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 40),
                    child: Text(
                      'Sing up',
                      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: (){
                      onRegister();
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 40),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Container(
                            decoration: BoxDecoration(color: Colors.grey),
                            child: Icon(Icons.arrow_forward,
                              size: 60,
                            ),
                          )),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 120,
              ),
              Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 40),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/');
                          },
                          child: Text(
                            'Sing in',
                            style: TextStyle(
                                fontSize: 20, decoration: TextDecoration.underline),
                          ))),
                ],
              ),
            ],
          )
        ),
      ),
    );
  }
}
