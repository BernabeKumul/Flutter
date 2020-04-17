import 'package:http/http.dart' as http;
import 'package:app_demo/app/Core/store/actions/userActions.dart';
import 'package:app_demo/app/Core/store/models/appState.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

Future<http.Response> fetchget() {
  return http.get('https://192.168.0.102:58385/api/values');
}

ThunkAction<AppState> loginUser(){
  return (Store store){
     new Future(() async{
        store.dispatch(new StartLoadingAction());
        var response = await fetchget();
       print(response);
     });
  };
  }


  class serviceBase{
    
  }