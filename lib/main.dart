
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubit/app-cubit.dart';
import 'package:todo_app/data/local/cashHelper.dart';
import 'package:todo_app/data/network/dioHelper.dart';
import 'package:todo_app/module/homeScreen/startScreen.dart';
import 'package:todo_app/observer.dart';

void main ()async
{
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();


 await CashHelper.init();


  DioHelper.init();
  print('token ${CashHelper.getData(key: 'token')}');

  return runApp(MyApp());
}




 class MyApp extends StatelessWidget {
   const MyApp({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return  MultiBlocProvider(
       providers: [
         
         BlocProvider(create: (context)=> AppCubit()..getAllTasks() )
       ],

       child: MaterialApp(
         debugShowCheckedModeBanner: false,
         theme: ThemeData(
           colorScheme: ColorScheme.fromSwatch().copyWith(
             primary: Color(0xFF01A0C7)
           ),

          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Color(0xFF01A0C7)
          )

         ),
         home: StartScreen(),

       ),
     );
   }
 }
