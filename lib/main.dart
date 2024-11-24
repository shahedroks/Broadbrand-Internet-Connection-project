import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ecommerces_project/Bloc/bloc.dart';
import 'package:firebase_ecommerces_project/Pages/home_page.dart';
import 'package:firebase_ecommerces_project/Pages/loggin_page.dart';
import 'package:firebase_ecommerces_project/Pages/registe_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
      apiKey: "AIzaSyCQg0bRd12zReJtUkkeOhEn3p7-Sg2kik0",
      appId:"1:681987341104:android:91b989a4873e74bbce26f5",
      messagingSenderId:"681987341104",
      projectId: "ecomers-a59f3")
  );
  FirebaseAppCheck.instance.activate();
  runApp(MainApp());}
class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterBolc())
      ],

      child: MaterialApp(initialRoute: '/',
          routes: {
            '/': (context)=>LogginPage(),
            '/register':(context)=>RegisterPage(),
            '/homepage':(context)=> HomePage(),

          },debugShowCheckedModeBanner: false,
      ),
    );
  }
}
