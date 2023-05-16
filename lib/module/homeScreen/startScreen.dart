import 'package:flutter/material.dart';
import 'package:todo_app/module/homeScreen/loginScreen.dart';
import 'package:todo_app/module/homeScreen/registerScreen.dart';


class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
  body: SafeArea(
    child:  Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center ,
          children:
          [
            Image.asset('assets/images/todo.png' ),
            // IconButton(onPressed: (){}, icon: Icon(Icons.task_outlined , size: 50 , color: Colors.black ,)),
            SizedBox(height: 20,),

            Container(
                width: MediaQuery.of(context).size.width /2 ,
                decoration: BoxDecoration(
                    color: Color(0xFF01A0C7) ,
                    border: Border.all(color: Colors.transparent ),
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),

                child: MaterialButton(onPressed: (){
                  print('register');

                 Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterScreen() ));

                } , child: Text('Register'),)),
            SizedBox(height: 20,),

            Container(
                width: MediaQuery.of(context).size.width /2 ,

                decoration: BoxDecoration(
                  color: Colors.black12 ,
                  border: Border.all(color: Colors.transparent ),
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: MaterialButton(onPressed: (){
                  print('login');
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen() ));

                } , child: Text('Login'),)),

          ],
        ),
      ),
    ),
  ),);
  }
}
