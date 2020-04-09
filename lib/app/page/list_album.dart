import 'package:flutter/material.dart';

class ListAlbumPage extends StatefulWidget {
  ListAlbumPage({Key key}) : super(key: key);

  @override
  _ListAlbumPageState createState() => _ListAlbumPageState();
}

class _ListAlbumPageState extends State<ListAlbumPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( 'Easy Photo', style: TextStyle(color:  Colors.white)),
        centerTitle: true,
      ),
      body: Container(
          margin: EdgeInsets.all(5.0),
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _card("assets/img/background_login.png", "Amor", "www.amor.com"),
                      _card("assets/img/img2.jpg", "Bebes", "www.bebes.com")
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _card("assets/img/img3.jpg", "Cumpleaños", "www.cumpleanios.com"),
                      _card("assets/img/img4.jpg", "Familia", "www.familia.com")
                    ],
                  )
                ],
              )
            ],
          )),
    );
  }

  Widget _card(String urlImg, String title, String tagUrl){
    return  Container(
              width: (MediaQuery.of(context).size.width / 2) -10,
              child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                        Container(
                        decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                                BoxShadow(
                                    color: Colors.white,
                                    offset: Offset(0.0, 2.0),
                                    blurRadius: 2.0,
                                  ),
                                ],
                              ),
                              child: Stack(
                                children: <Widget>[
                                  Hero(
                                    tag: tagUrl,
                                    child: ClipRRect(
                                      child: Image(
                                        height: 180.0,
                                        width: 180.0,
                                        image:
                                            AssetImage(urlImg),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  _titleCard(title)
                                ],
                              ),
                            )
                        ],
                      ),
                    );
  }

  Widget _titleCard(String title){
        return Positioned(
                left: 0,
                bottom: 0,
                width:  (MediaQuery.of(context).size.width / 2)-0,
                child: Container(
                        decoration: BoxDecoration(
                        gradient: new LinearGradient(
                        colors: <Color>[
                                   const Color.fromRGBO(0, 0, 0, 0.5),
                                   const Color.fromRGBO(0, 0, 0, 0.5),
                                   ],
                                   stops: [0.2, 1.0],
                                   begin: const FractionalOffset(0.0, 0.0),
                                   end: const FractionalOffset(0.0, 1.0),
                                  )),
                        child: 
                        Container(
                              padding:EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                              child: Column(
                                   crossAxisAlignment:
                                   CrossAxisAlignment.start,
                                   children: <Widget>[
                                   Text(
                                       title,
                                       style: TextStyle(
                                       color: Colors.white,
                                       fontSize: 16.0,
                                       ),
                                        ),
                                      ],
                                   )))
               );
  }
}
