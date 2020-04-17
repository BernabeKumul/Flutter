
import 'package:app_demo/app/Core/store/models/appState.dart';
import 'package:app_demo/app/Core/store/reducers/albumReducers.dart';
import 'package:app_demo/app/Core/store/reducers/userReducers.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    userState: authUserReducer(state.userState, action),
    albumState:  albumReducer(state.albumState, action)
  );
}