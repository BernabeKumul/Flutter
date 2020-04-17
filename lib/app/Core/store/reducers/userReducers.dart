import 'package:app_demo/app/Core/store/actions/userActions.dart';
import 'package:app_demo/app/Core/store/models/UserState.dart';
import 'package:redux/redux.dart';

final authUserReducer = combineReducers<UserState>(
  [
    TypedReducer<UserState, LoginSuccessAction>(_loginSuccess),
    TypedReducer<UserState, LoginFailedAction>(_loginFailed),
    TypedReducer<UserState, StartLoadingAction>(_loginloading),
  ]
);

UserState _loginSuccess(UserState state, LoginSuccessAction action){
  return state.copyWith(loadingError: false, isLoading: false, user: action.userInfo);
}

UserState _loginFailed(UserState state, LoginFailedAction action){
  return state.copyWith(loadingError: true, isLoading: false, user: null);
}

UserState _loginloading(UserState state, StartLoadingAction action){
  return state.copyWith(loadingError: false, isLoading: true, user: null );
}


