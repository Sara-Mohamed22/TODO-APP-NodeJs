
import 'package:todo_app/model/loginModel.dart';

abstract class AppStates {}
class AppInitializeState extends AppStates {}
class AppLoadingState extends AppStates {}


class LoginLoadingState extends AppStates {}
class LoginSucessStateState extends AppStates {

  final LoginModel? loginModel ;
  LoginSucessStateState(this.loginModel);

}
class LoginErrorState extends AppStates {

final  String error ;

  LoginErrorState(this.error );
}



class RegisterLoadingState extends AppStates {}
class RegisterSucessState extends AppStates {
  final LoginModel? loginModel ;

  RegisterSucessState(this.loginModel);
}
class RegisterErrorState extends AppStates {

  final  String error ;
  RegisterErrorState(this.error);
}


class AllTasksLoadingState extends AppStates {}
class AllTasksSucessState extends AppStates {}
class AllTasksErrorState extends AppStates {

  final  String error ;
  AllTasksErrorState(this.error );
}
