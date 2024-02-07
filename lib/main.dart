import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:vending_mach_app/app.dart';
import 'package:vending_mach_app/firebase_options.dart';
import 'package:vending_mach_app/login.dart';
import 'package:vending_mach_app/register.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.android);
  runApp(SanitaryPadVendingMachineApp());
}

class SanitaryPadVendingMachineApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/main': (context) => MainPage(),
        '/register': (context) => RegisterPage(),
      },
      theme: ThemeData(
        primaryColor: Colors.pink[400] ?? Colors.pink,
        hintColor: Colors.purpleAccent,
        fontFamily: 'Montserrat',
      ),
    );
  }
}
