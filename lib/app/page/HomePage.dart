import 'package:app_demo/app/page/Widget/custom_carrousel.dart';
import 'package:app_demo/app/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'Widget/card.dart';


class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class Ad {
  String title;
  String content;
  String buttonText;
  String imageURL;
  Ad(this.title, this.content, this.buttonText, this.imageURL) {}
}

class _HomePageState extends State<HomePage> {

int _selectedPage = 0;

  List<Ad> ads = [
    new Ad(
        "Portadas prediseñadas",
        "Una vez creado tu álbum, selecciona 'Cambiar portada' y encontrarás portadas prediseñadas de diferentes temas",
        "Crear álbum",
        "assets/img/background_login.png"),
    new Ad(
        "Pasta suave",
        "Paquete con 60 fotos, papel couche e impresión digital por solo \$ 199 MXN. ¡No te lo pierdas!",
        "Ver producto",
        "assets/img/img2.jpg"),
    new Ad(
        "Pasta dura",
        "Paquete con 60 fotos, papel couche 150 grs, tamaño 16x16 e impresión digital por solo \$ 349 MXN",
        "Ver producto",
        "assets/img/img3.jpg")
  ];

  createCarouselSlider() {
    return CustomCarrousel(
      onPress: (context, item) {
        this.createDialog(context, item);
      },
      items: ads,
    );
  }

  createDialog(BuildContext context, Ad ad) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              titlePadding: const EdgeInsets.all(0.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              title: Container(
                height: 160,
                decoration: new BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0)),
                    image: DecorationImage(
                      image: new AssetImage(ad.imageURL),
                      fit: BoxFit.fill,
                    )),
              ),
              content: Container(
                height: 150,
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(children: <Widget>[
                        Text(ad.title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18))
                      ])
                    ],
                  ),
                ),
              ),
              actions: <Widget>[
                FlatButton(
                    child: Text(ad.buttonText),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ]);
        });
  }

  Widget _apbar(){
    return Row(
              children: <Widget>[
                   Container(
                   alignment: Alignment.bottomLeft,
                   margin: EdgeInsets.symmetric(vertical: 7),
                   width: MediaQuery.of(context).size.width * .73,
                   child: Image.asset('assets/img/icon-name.png'),
                   ),
                   Container(
                   alignment:  Alignment.centerRight,
                   width: MediaQuery.of(context).size.width * .20,
                   child: IconButton(
                   icon: Icon(
                   Icons.shopping_cart,
                   color:  Colors.black,
                   ),
                   onPressed: () {
                    Navigator.pushNamed(context, '/cart');
                   },
                   )
                   )],
            );
  }

  Widget _album(){
    return Stack(
            children: <Widget>[
              Container(
                color: Colors.white,
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                Container( //Encabezado
                      alignment:  Alignment.centerRight,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * .12,
                      color: Colors.white,
                      child: _apbar(),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * .38,
                        child: Container(
                            child: createCarouselSlider(),
                          ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * .40,
                        child: Column(
                          children: <Widget>[
                            Container(
                              alignment: Alignment.bottomLeft,
                              margin: EdgeInsets.symmetric(horizontal: 15),
                              child: Text('Mis Albums', style: TextStyle(color: Colors.black45, fontSize: 16)),
                            ),
                            Expanded(
                              child: ListView(
                                children: <Widget>[
                                  cardHome(
                                      title: 'Viaje en la playa',
                                      subtitle: 'Lorem ipsum dolor sit met, bla bla bla bla, Lorem ipsum dolor sit met, bla bla bla bla, Lorem ipsum dolor sit met, bla bla bla bla',
                                      img: 'assets/img/background_login.png'
                                  ),
                                  SizedBox(height: 15),
                                   cardHome(
                                      title: 'Viaje en cancún',
                                      subtitle: 'Lorem ipsum dolor sit met, bla bla bla bla, Lorem ipsum dolor sit met, bla bla bla bla, Lorem ipsum dolor sit met, bla bla bla bla',
                                      img: 'assets/img/img1.jpg'
                                  ),
                                  SizedBox(height: 15),
                                   cardHome(
                                      title: 'Viaje en tulun',
                                      subtitle: 'Lorem ipsum dolor sit met, bla bla bla bla, Lorem ipsum dolor sit met, bla bla bla bla, Lorem ipsum dolor sit met, bla bla bla bla',
                                      img: 'assets/img/img2.jpg'
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            );
  }

Widget _Tab(BuildContext context, int tab) {
    final _pageOptions = [
      Container(
          child: _album()
      ),
      Container( //Perfil de usuario
        padding: EdgeInsets.symmetric(horizontal: 0),
        margin: EdgeInsets.only(top: 32),
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 16),
                      child: CircleAvatar(
                        backgroundColor: AppColors.grey,
                        child: Text('HR'),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Habib RG',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Text('habib_mma@hotmail.com',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12))
                        ],
                      ),
                    ),
                    Container(
                      child: Icon(Icons.chevron_right),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    ];
    return _pageOptions[tab];
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Tab(context, _selectedPage),
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
}