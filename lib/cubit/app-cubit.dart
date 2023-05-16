
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubit/app-state.dart';
import 'package:todo_app/data/endPoint.dart';
import 'package:todo_app/data/local/cashHelper.dart';
import 'package:todo_app/data/network/dioHelper.dart';
import 'package:todo_app/model/loginModel.dart';


class AppCubit extends Cubit<AppStates> {

  AppCubit() : super(AppInitializeState());

  static AppCubit get(context) => BlocProvider.of(context);

 LoginModel? loginModel ;
  LoginModel? regModel ;
  LoginModel? eModel ;


  void signUpFunc(
      {
        @required String? username ,
        @required String? password,

      }
      ) {

    emit(RegisterLoadingState());


    DioHelper.postData(
      url:   '$SIGNUP' ,
      data: {
        'username' : username ,
        'password' : password ,
      },


    )!.then((value) {

      print('data register ${value.data}');
      regModel = LoginModel.FromJson(value.data);
      emit(RegisterSucessState(regModel));


    }).catchError((error)
    {
      print('Error**** '+ error.toString() );
      emit(RegisterErrorState(error.toString()));
    });
  }




  void UserLogin(
      {
        @required String? email ,
        @required String? password,

      }
      ) {
    emit(LoginLoadingState());


    DioHelper.postData(
        url:   '$LOGIN' ,
        data: {
          'username' : email ,
          'password' : password ,
        },


    )!.then((value) {

      // print('info data ${value.data}');

      loginModel = LoginModel.FromJson(value.data);
      emit(LoginSucessStateState( loginModel));



    }).catchError((error)
    {
      print('Error**** '+ error.toString() );
      emit(LoginErrorState(error.toString()));
    });
  }



  void getAllTasks()
  {

     emit(AllTasksLoadingState());

     DioHelper.getData(
         url: '${ALLTASKS}' ,
     )!.
     then((value) {
       print('all task ${value.data}');
       emit(AllTasksSucessState());
     }).
     catchError((e)
     {
       print('errorxx ${e}');

       emit(AllTasksErrorState(e.toString()));
     });
  }



}
