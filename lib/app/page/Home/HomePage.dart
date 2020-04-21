import 'package:app_demo/app/Core/Service/AlbumService.dart';
import 'package:app_demo/app/Core/store/models/appState.dart';
import 'package:app_demo/app/page/Home/AlbumsProps.dart';
import 'package:app_demo/app/page/Home/Widget/albums_page.dart';
import 'package:app_demo/app/page/Home/Widget/perfil_page.dart';
import 'package:app_demo/app/page/layout-circles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedPage = 0;

  @override
  void initState() {
    super.initState();
  }

   @override
  void dispose() {
    super.dispose();
  }

  Widget _tab(BuildContext context, int tab) {
    final _pageOptions = [AlbumsPage(), PerfilPage()];

    return _pageOptions[tab];
  }

  void handleInitialBuild(AlbumsProps props) {
    props.getAlbums();
    props.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return 
    StoreConnector<AppState, AlbumsProps>(
      converter: (store) => mapToProps(store),
      onInitialBuild: (props) => this.handleInitialBuild(props),
      builder:(context, props) {
      bool loading = props.isLoading;
      // bool loading = false;
      Widget body;

      if (loading) {
          body = LayoutCircles(
            colorCircles: Color(0xFFE0703E),
            child: Container(
              height: MediaQuery.of(context).size.height * .60,
              alignment: Alignment.center,
              child: Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.deepOrangeAccent
            )),
            )
          );
        } else {
        body = Scaffold(
        body: LayoutCircles(
                  colorCircles: Color(0xFFE0703E),
                  child: SingleChildScrollView(child: _tab(context, _selectedPage))),
                  floatingActionButton: FloatingActionButton(
                    backgroundColor: Colors.deepOrangeAccent,
                    onPressed: () {
                      Navigator.pushNamed(context, '/create');
                    },
                    child: Icon(Icons.library_add, color: Colors.white),
                    ),
                    bottomNavigationBar: BottomNavigationBar(
                        currentIndex: _selectedPage,
                        onTap: (int currentPage) {
                          setState(() {
                            _selectedPage = currentPage;
                          });
                        },
                        items: [
                          BottomNavigationBarItem(
                              icon: Icon(Icons.home), title: Text('Inicio')),
                          BottomNavigationBarItem(
                              icon: Icon(Icons.person_outline), title: Text('perfil'))
                        ])
              );
        }

      return  body;
      }
    );  
  }
}