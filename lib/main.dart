// ignore_for_file: prefer_const_constructors

import 'package:airplane_booking_app/cubit/auth_cubit.dart';
import 'package:airplane_booking_app/cubit/destination_cubit.dart';
import 'package:airplane_booking_app/cubit/page_cubit.dart';
import 'package:airplane_booking_app/cubit/seat_cubit.dart';
import 'package:airplane_booking_app/cubit/transaction_cubit.dart';
import 'package:airplane_booking_app/ui/pages/get_started_pages.dart';
import 'package:airplane_booking_app/ui/pages/main_page.dart';
import 'package:airplane_booking_app/ui/pages/sign_in_page.dart';
import 'package:airplane_booking_app/ui/pages/sign_up_page.dart';
import 'package:airplane_booking_app/ui/pages/success_checkout_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'ui/pages/splash_page.dart';
import 'package:airplane_booking_app/ui/pages/bonus_pages.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => DestinationCubit(),
        ),
        BlocProvider(
          create: (context) => SeatCubit(),
        ),
        BlocProvider(
          create: (context) => TransactionCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/get-started': (context) => GetStartedPage(),
          '/sign-up': (context) => SignUpPage(),
          '/sign-in': (context) => SignInPage(),
          '/bonus': (context) => BonusPage(),
          '/main': (context) => MainPage(),
          '/success': (context) => SuccessCheckoutPage(),
        },
      ),
    );
  }
}
