
import 'package:app_demo/app/Core/store/models/UserState.dart';

class StartLoadingAction{
  StartLoadingAction();
}

class LoginSuccessAction{
  final UserResponse userInfo;

  LoginSuccessAction(this.userInfo);
}

class LoginFailedAction{
  LoginFailedAction();
}