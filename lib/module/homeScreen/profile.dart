

import 'package:flutter/material.dart';
import 'package:todo_app/shared/drawer.dart';

class ProfileScreen extends StatelessWidget {
   ProfileScreen({Key? key}) : super(key: key);

  var emailController = TextEditingController(text: 'hh@gmail.com');

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      drawer: createDrawer(context),

      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0 , horizontal: 30),
        child: Column(
          children: [

            TextFormField(
              controller: emailController ,
              decoration: InputDecoration(

                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 2, color: Color(0xFF01A0C7) ),
                  ),

                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 3, color: Colors.redAccent),
                  ),
                  labelText: 'Enter your Note Name ..' ,
                  labelStyle: TextStyle( color: Color(0xFF777777) ,
                      fontSize: 14),

                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(),
                    borderRadius: BorderRadius.circular(5.0),

                  )

              ),


            ),
          ],
        ),
      ),
    );
  }
}
