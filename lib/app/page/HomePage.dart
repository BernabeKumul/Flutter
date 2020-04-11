import 'package:app_demo/app/Core/Auth/BaseAuth.dart';
import 'package:app_demo/app/page/Widget/card.dart';
import 'package:app_demo/app/page/Widget/custom_carrousel.dart';
import 'package:app_demo/app/page/layout-circles.dart';
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
    return LayoutCircles(colorCircles: Color(0xFFE0703E), child: Container());
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
}
