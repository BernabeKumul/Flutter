import 'package:app_demo/app/Core/Auth/BaseAuth.dart';
import 'package:app_demo/app/page/Widget/card.dart';
import 'package:app_demo/app/page/Widget/custom_carrousel.dart';
import 'package:app_demo/app/themes/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum Answers { YES, NO, MAYBE }

final List<String> imgList = [
  'assets/img/img1.jpg',
  'assets/img/img2.jpg',
  'assets/img/img3.jpg',
  'assets/img/img4.jpg',
];

class HomePage extends StatefulWidget {
  HomePage({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;

  @override
  State<StatefulWidget> createState() => new _HomePageState();
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
        "assets/img/img1.jpg"),
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

  createCarouselSlider() {
    return CustomCarrousel(
      onPress: (context, item) {
        this.createDialog(context, item);
      },
      items: ads,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/img/icon-name.png'),
        centerTitle: true,
        actions: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 20.0),
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/cart');
              },
            ),
          )
        ],
      ),
      body: _Tab(context, _selectedPage),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            ListTile(
              leading: CircleAvatar(
                  // backgroundColor: Color(0xff4db6ac),
                  ),
              title: Text("Mauricio Canche"),
              subtitle: Text("example@desarrollo.com"),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Color(0xff4db6ac)),
              title: Text("Inicio"),
              onTap: () {},
            ),
            ListTile(
                leading: Icon(Icons.account_box, color: Color(0xff4db6ac)),
                title: Text('Perfil'),
                onTap: () {}),
            ListTile(
                leading: Icon(Icons.exit_to_app, color: Color(0xff4db6ac)),
                title: Text("Salir"),
                onTap: () {}),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/create');
        },
        child: Icon(Icons.add_a_photo),
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
          ]),
    );
  }

  Widget _Tab(BuildContext context, int tab) {
    final _pageOptions = [
      Container(
          child: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              Container(
                child: createCarouselSlider(),
              ),
              SizedBox(
                height: 10,
              ),
              cardHome(
                  title: 'Album 1',
                  subtitle: 'Mi Album rfer',
                  img: 'assets/img/img3.jpg'),
              SizedBox(
                height: 10,
              ),
              cardHome(
                  title: 'Album 2',
                  subtitle: 'Easy photo',
                  img: 'assets/img/img4.jpg'),
              SizedBox(
                height: 10,
              ),
              cardHome(
                  title: 'Album 2',
                  subtitle: 'Pixi album',
                  img: 'assets/img/img2.jpg'),
              SizedBox(
                height: 10,
              )
            ],
          )
        ],
      )),
      Container(
        margin: EdgeInsets.only(top: 40, left: 20, bottom: 0, right: 20),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                    top: 25,
                    bottom: Consts.padding,
                    left: Consts.padding,
                    right: Consts.padding,
                  ),
                  margin: EdgeInsets.only(top: 40),
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 3.0,
                        offset: const Offset(0.0, 4.0),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min, // To make the card compact
                    children: <Widget>[
                      Text(
                        "Juanito Perez",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Divider(
                        thickness: 1.5,
                      ),
                      SizedBox(height: 8.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "3",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w900),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "Albumnes",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black45),
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "5",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "Albumnes",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black45),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                      ),
                    ],
                  ),
                ),
                Positioned(
                    left: 110,
                    right: 110,
                    child: Stack(
                      children: <Widget>[
                        DecoratedBox(
                          decoration: new BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 10.0,
                                offset: const Offset(10.0, 4.0),
                              ),
                            ],
                          ),
                        ),
                        CircleAvatar(
                          backgroundImage: AssetImage("assets/img/img1.jpg"),
                          backgroundColor: Colors.blueAccent,
                          radius: Consts.avatarRadius,
                        ),
                      ],
                    )),
              ],
            ),
            SizedBox(
                height: 10,
              ),
            SizedBox(
              child: Card(
                margin: EdgeInsets.all(0),
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsetsDirectional.fromSTEB(20,10,10,5),
                     child: Text("User Information", style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w700,fontSize: 16),),
                    ),
                    Divider(),
                    ListTile(
                      contentPadding: EdgeInsets.all(10),
                      title: Text('Email',
                          style: TextStyle(fontWeight: FontWeight.w500)),
                      subtitle: Text('antonio@gmail.com'),
                      leading: Icon(
                        Icons.email,
                        color: Colors.blue[500],
                      ),
                    ),
                     
                    ListTile(
                      title: Text('Phone',
                          style: TextStyle(fontWeight: FontWeight.w500)),
                      subtitle: Text('(408) 555-1212'),
                      leading: Icon(
                        Icons.phone,
                        color: Colors.blue[500],
                      ),
                    ),
                    ListTile(
                      title: Text('About',
                          style: TextStyle(fontWeight: FontWeight.w500)),
                      subtitle: Text('Information'),
                      leading: Icon(
                        Icons.portrait,
                        color: Colors.blue[500],
                      ),
                    ),
                    
                  ],
                ),
              ),
            )
          ],
        ),
      )
    
    ];
    return _pageOptions[tab];
  }
}

class Consts {
  Consts._();

  static const double padding = 20.0;
  static const double avatarRadius = 30.0;
}
