import 'package:chat_app/auth_screens/sign_in_screen.dart';
import 'package:chat_app/features/auth_bloc/auth_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Bmi_calc/bmi_calc.dart';
import 'auth_screens/sign_up_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        ),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          SignInScreen.id: (context) => SignInScreen(),
          SignUpScreen.id: (context) => SignUpScreen(),
          BmiCalcScreen.id: (context) => BmiCalcScreen(),
        },
        initialRoute: SignInScreen.id,


      ),
    );
  }
}

