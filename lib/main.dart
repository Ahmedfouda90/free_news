import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:free_news/cubit/news_cubit.dart';
import 'package:free_news/cubit/news_states.dart';
import 'package:free_news/custom_widgets/item_builder.dart';
import 'package:free_news/layers/home_screen.dart';
import 'package:free_news/net_work/remote/dio_helper.dart';
import 'package:hexcolor/hexcolor.dart';

void main() {
  DioHelper.init();

  runApp(FreeNews());
}

class FreeNews extends StatelessWidget {
  const FreeNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
        create: (BuildContext context) => NewsCubit()..getBusiness(),
   child: BlocConsumer<NewsCubit,NewsStates>(
     listener: (context,state){},
     builder: (context,state){
       return MaterialApp(
         home: const HomeScreen(),
         debugShowCheckedModeBanner: false,
         theme: ThemeData(
           primarySwatch: Colors.deepOrange,
           scaffoldBackgroundColor: Colors.white,
           appBarTheme: const AppBarTheme(
             titleSpacing: 20.0,
             systemOverlayStyle: SystemUiOverlayStyle(
               statusBarColor: Colors.white,
               statusBarIconBrightness: Brightness.dark,
             ),
             backgroundColor: Colors.white,
             elevation: 0.0,
             titleTextStyle: TextStyle(
               color: Colors.black,
               fontSize: 20.0,
               fontWeight: FontWeight.bold,
             ),
             iconTheme: IconThemeData(
               color: Colors.black,
             ),
           ),
           floatingActionButtonTheme: const FloatingActionButtonThemeData(
             backgroundColor: Colors.deepOrange,
           ),
           bottomNavigationBarTheme: const BottomNavigationBarThemeData(

             type: BottomNavigationBarType.fixed,
             selectedItemColor: Colors.deepOrange,
             unselectedItemColor: Colors.black,
             elevation: 90.0,
             backgroundColor: Colors.grey,
           ),
           textTheme: const TextTheme(
             bodyLarge: TextStyle(
               fontSize: 18.0,
               fontWeight: FontWeight.w600,
               color: Colors.white,
             ),
           ),
         ),
         darkTheme: ThemeData(

           primarySwatch: Colors.deepOrange,
           scaffoldBackgroundColor: HexColor('333739'),
           backgroundColor: HexColor('333739'),
           appBarTheme: AppBarTheme(
             titleSpacing: 20.0,
             systemOverlayStyle: SystemUiOverlayStyle(
               statusBarColor: HexColor('333739'),
               statusBarIconBrightness: Brightness.light,
             ),
             backgroundColor: HexColor('333739'),
             elevation: 0.0,
             titleTextStyle: const TextStyle(
               color: Colors.white,
               fontSize: 20.0,
               fontWeight: FontWeight.bold,
             ),
             iconTheme: const IconThemeData(
               color: Colors.white,
             ),
           ),
           floatingActionButtonTheme: const FloatingActionButtonThemeData(
             backgroundColor: Colors.deepOrange,
           ),
           bottomNavigationBarTheme: const BottomNavigationBarThemeData(
             type: BottomNavigationBarType.fixed,
             selectedItemColor: Colors.deepOrange,
             unselectedItemColor: Colors.white,
             elevation: 20.0,
             backgroundColor: Colors.grey,
           ),
           textTheme: const TextTheme(
             bodyLarge: TextStyle(
               fontSize: 20.0,
               fontWeight: FontWeight.w600,
               color: Colors.black,
             ),
           ),
         ),
         themeMode: NewsCubit.get(context).isDark
             ? ThemeMode.dark
             : ThemeMode.light,
       );
     },
   ));

  }
}

