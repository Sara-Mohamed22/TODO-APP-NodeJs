import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/data/local/cashHelper.dart';



class DioHelper
{
  static Dio? dio ;


  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'http://192.168.1.29:3000/api/v1/',
      receiveDataWhenStatusError: true ,

    ));

  }



  static Future<Response>? getData({

    @required String? url,
    Map<String, dynamic>? query ,
    String? lang  ,
    String? token

  })async
  {
    dio!.options.headers =
    {
      'Content-Type':'application/json' ,
      // 'lang':  lang ,
      'Authorization':'Bearer ${CashHelper.getData(key: 'token')}',
    }
    ;

    return await  dio!.get(url! , queryParameters: query ) ;
  }



  static Future<Response>? postData({
    @required String? url ,
    Map<String , dynamic>? query ,
    @required Map<String , dynamic>? data ,
    String? lang  ,
    String? token

  }) async
  {


    dio!.options.headers =
    {
      'Content-Type':'application/json' ,
      // 'lang':lang ,
      'Authorization':'Bearer ${CashHelper.getData(key: 'token')}' ,
    }
    ;
    return await  dio!.post(url! , queryParameters: query , data: data , );

  }




  static Future<Response> putData(
      { @required String? url ,

        Map<String , dynamic>? data ,
        Map<String , dynamic>? query ,
        @required String? lang  ,
        String? token


      }
      )async
  {
    dio!.options.headers={
      'Content-Type':'application/json' ,
      // 'lang':lang ,
      'Authorization':'Bearer ${CashHelper.getData(key: 'token')}' ,

    };
    return await  dio!.put(url! , queryParameters: query , data: data);
  }

}



















