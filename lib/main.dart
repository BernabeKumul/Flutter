import 'package:app_demo/app/Core/store/models/app_store.dart';
import 'package:app_demo/app/Core/store/models/counter.dart';
import 'package:app_demo/app/Core/store/reducers/app_state_reducer.dart';
import 'package:app_demo/app/page/HomePage.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'app/Core/Auth/Auth.dart';
import 'app/page/carrocel.dart';
import 'app/page/cart_page.dart';
import 'app/page/detail_album.dart';
import 'app/page/feature_selection_album.dart';
import 'app/page/feature_selection_page.dart';
import 'app/page/list_Picture.dart';
import 'app/page/list_album.dart';
import 'app/page/root_page.dart';

void main() {
  final initialState =
      AppState(shoppingCart: null, counter: Counter(counter: 1));

  final store = Store<AppState>(appReducer,
      initialState: initialState,
      middleware: [new LoggingMiddleware.printer()]);

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
          '/': (context) => RootPage(auth: Auth()),
          // '/': (context) => CarouselDemo(),
          '/home': (context) => HomePage(),
          '/create': (context) => FeatureSelectionPage(),
          '/cart': (context) => CartPage(),
          '/Detail': (context) => DeailPage(),
          '/ListAbum': (context) => ListAlbumPage(),
          '/ListPicture': (context) => ListPicturePage(),
        });
  }
}
