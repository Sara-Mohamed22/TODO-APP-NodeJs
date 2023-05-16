class LoginModel
{

  String? msg ;
  Data? data ;
  String? token ;


  LoginModel({this.msg, this.data, this.token});


  Map<String , dynamic> toJson()
  {
    return {

      "msg" : msg ,
      "data" : data?.toJson() ,
      "token" : token


    };
  }

  LoginModel.FromJson(Map<String , dynamic> json)
  {



    msg = json["msg"];

    if(json["data"] !=null )
    {
      data = Data.FromJson(json["data"]);
    }

    token = json["token"] ;


  }

}


class Data
{
  String? username ;
  String? password ;


  Data(this.password , this.username) ;

  Map<String , dynamic> toJson()
  {
    return {

      "username" : username ,
      "password" : password ,
    };
  }

  Data.FromJson(Map<String , dynamic> json)
  {
    username = json["username"];
    password = json["password"];
  }




}




class ErrorModel{
  String? message;
  int? code;

  ErrorModel({this.message, this.code});
  ErrorModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    code = json['code'];
  }

  Map<String, dynamic> toJson(decode) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = message;
    data['code'] = code;
    return data;
  }
}