import 'dart:io';

import 'package:app_demo/app/Core/common/AlbumServiceDependency.dart';
import 'package:app_demo/app/Core/utils/MyHttpOverrides.dart';
import 'package:app_demo/app/page/Home/HomePage.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:flutter/material.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'app/Core/Service/AlbumService.dart';
import 'app/Core/store/models/appState.dart';
import 'app/Core/store/reducers/appReducers.dart';
import 'app/Core/utils/middleware_injector.dart';
import 'app/page/cart_page.dart';
import 'app/page/detail_album.dart';
import 'app/page/feature_selection_page.dart';
import 'app/page/list_Picture.dart';
import 'app/page/list_album.dart';
import 'app/page/loginPage.dart';
import 'app/page/signup.dart';

void main() {

final middleWare = InjectedMiddleware<AlbumServiceDependency>(
      deps: AlbumServiceDependency(
        albumService: AlbumService()
      ));

  final store = Store<AppState>(
      appReducer,
      initialState: AppState.initial(),
      middleware: [
        new LoggingMiddleware.printer(),
        middleWare.thunkMiddlewareInjector]);

      HttpOverrides.global = new  MyHttpOverrides();
      runApp(StoreProvider(store: store, child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'App',
        theme: ThemeData(
          primaryColor: Colors.orange[800],
          accentColor: Colors.white,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => LoginPage(),
          '/signup': (context) => SignUpPage(),
          '/home': (context) => HomePage(),
          '/create': (context) => FeatureSelectionPage(),
          '/cart': (context) => CartPage(),
          '/Detail': (context) => DeailPage(),
          '/ListAbum': (context) => ListAlbumPage(),
          '/ListPicture': (context) => ListPicturePage(),
        });
  }
}
