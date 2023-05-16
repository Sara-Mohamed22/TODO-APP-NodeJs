
   import 'package:flutter/material.dart';
import 'package:todo_app/module/homeScreen/addNoteScreen.dart';
import 'package:todo_app/module/homeScreen/homeScreen.dart';
import 'package:todo_app/module/homeScreen/profile.dart';
import 'package:todo_app/module/homeScreen/startScreen.dart';

createDrawer( context  ) {


     return Drawer(
     child: ListView(
       physics: BouncingScrollPhysics() ,
       padding: EdgeInsets.only(top: 50 ,left: 20.0 , right: 20.0 , bottom: 20 ),
       children: [

         Container(
           margin: EdgeInsets.symmetric(vertical: 40 ),
           child: Column(children: [
                SizedBox(height: 30,),
           ],),
         ),

         Divider(color: Colors.grey, thickness: .5 , ),

         ListTile(
           title: Row(
             crossAxisAlignment: CrossAxisAlignment.end,

             children: [
               Container(

                 // child: Image.asset('assets/images/user.png' , ),
                 child: Icon(Icons.home_filled),
                 width: 25,
                 height: 25,
               ),
               SizedBox(width: 10,),
               Text('Home')
             ],
           ),
           onTap: ()async {

             Navigator.push(context, MaterialPageRoute(builder: (context)=>
                 HomeScreen()));


           },
         ),

         ListTile(
           title: Row(
             crossAxisAlignment: CrossAxisAlignment.end,

             children: [
               Container(

                 // child: Image.asset('assets/images/user.png' , ),
                 child: Icon(Icons.note_alt_outlined),
                 width: 25,
                 height: 25,
               ),
               SizedBox(width: 10,),
               Text('Add Task')
             ],
           ),
           onTap: ()async {

             Navigator.push(context, MaterialPageRoute(builder: (context)=>
                 AddNoteScreen()));


           },
         ),

         ListTile(
           title: Row(
             crossAxisAlignment: CrossAxisAlignment.end,

             children: [
               Container(

                 child: Image.asset('assets/images/user.png' , ),
                 width: 25,
                 height: 25,
               ),
               SizedBox(width: 10,),
               Text('Profile')
             ],
           ),
           onTap: ()async {

             Navigator.push(context, MaterialPageRoute(builder: (context)=>
                 ProfileScreen()));


           },
         ),
         Divider(color: Colors.grey, thickness: .5 , ),



         ListTile(
           title: Row(
             crossAxisAlignment: CrossAxisAlignment.end,

             children: [
               Container(

                   // child: Image.asset('assets/images/icon-logout.png' , ),
                 child: Icon(Icons.logout),
                 width: 25,
                 height: 25,
               ),
               SizedBox(width: 10,),
                Text('log-out' ),
             ],
           ),
           onTap: () {
             print('logout');
             Navigator.push(context, MaterialPageRoute(builder: (context)=>StartScreen()));

             },
         ),



       ],
       ),


   );
   }

