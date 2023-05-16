

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_app/cubit/app-cubit.dart';
import 'package:todo_app/cubit/app-state.dart';
import 'package:todo_app/data/local/cashHelper.dart';
import 'package:todo_app/module/homeScreen/homeScreen.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AppCubit , AppStates>(
      listener: (context , state){


        if(state is RegisterSucessState )
        {

          if(state.loginModel?.data != null) {
            Fluttertoast.showToast(
                    msg: state.loginModel!.msg!,
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 5,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0)
                .then((value) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));

              CashHelper.saveData(key: 'token', value: state.loginModel!.token );
            });
          }

        else

        {
          Fluttertoast.showToast(
              msg: state.loginModel!.msg!,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.red ,
              textColor: Colors.white,
              fontSize: 16.0
          );
        }





        }

        if(state is RegisterErrorState)
        {

          Fluttertoast.showToast(
              msg: 'please , try again',
              toastLength: Toast.LENGTH_LONG ,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.red ,
              textColor: Colors.white,
              fontSize: 16.0
          );

        }
      } ,

      builder: (context , state){
        AppCubit cubit = AppCubit.get(context);

        return Scaffold(
            body:SafeArea(child:

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0 ),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                  [

                    Text('Register', style: TextStyle(fontWeight: FontWeight.w500 , fontSize: 20),) ,
                    SizedBox(height: 50,),
                    TextFormField(
                      controller: emailController ,
                      validator: (value)=>
                      value!.isEmpty ?  'This Field Required' :  null
                      ,
                      decoration: InputDecoration(

                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2, color: Color(0xFF01A0C7) ),
                          ),

                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3, color: Colors.redAccent),
                          ),
                          labelText: 'Enter Email' ,
                          labelStyle: TextStyle( color: Color(0xFF777777) ,
                              fontSize: 14),

                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(),
                            borderRadius: BorderRadius.circular(5.0),

                          )

                      ),


                    ),

                    SizedBox(height: 20,),


                    TextFormField(
                      controller: passController ,
                      validator: (value)=>
                      value!.isEmpty ?  'This Field Required' :  null
                      ,
                      decoration: InputDecoration(

                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2, color: Color(0xFF01A0C7) ),
                          ),

                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3, color: Colors.redAccent),
                          ),
                          labelText: 'Enter Password' ,
                          labelStyle: TextStyle( color: Color(0xFF777777) ,
                              fontSize: 14),

                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(),
                            borderRadius: BorderRadius.circular(5.0),

                          )

                      ),


                    ),

                    SizedBox(height: 20,),


                    ConditionalBuilder(
                      condition: state is! RegisterLoadingState  ,
                      builder: (context)=>Center(
                        child: Container(
                            width: MediaQuery.of(context).size.width /2 ,
                            decoration: BoxDecoration(
                                color: Color(0xFF01A0C7) ,
                                border: Border.all(color: Colors.transparent ),
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),

                            child: MaterialButton(onPressed: (){
                              print('Login');

                              if(formKey.currentState!.validate())
                                {
                                  cubit.signUpFunc(
                                      username: emailController.text ,
                                      password: passController.text
                                  );
                                }


                            } , child: Text('Login' , style:  TextStyle(color: Colors.white ),),)),
                      ) ,
                      fallback: (context)=> CircularProgressIndicator(),
                    ),


                  ],
                ),
              ),
            ) ,)
        ) ;
      },
    );
  }
}
