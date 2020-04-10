import 'package:app_demo/app/page/carrocel.dart';
import 'package:flutter/material.dart';

class ListPicturePage extends StatefulWidget {
  static const routeName = '/featureSelection';
  ListPicturePage({Key key}) : super(key: key);

  @override
  _ListPicturePage createState() => _ListPicturePage();
}

class _ListPicturePage extends State<ListPicturePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Fotos'),
          centerTitle: true,
          actions: <Widget>[
            Container(
              // padding: EdgeInsets.only(right: 20.0),
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
        body: Container(
            // margin: EdgeInsets.all(0.0),
            child: ListView(
          children: <Widget>[
            Stack(children: <Widget>[
              Card(
                child: Image.asset(
                  'assets/img/img1.jpg',
                  fit: BoxFit.fitHeight,
                ),
              ),
              Container(
                  alignment: Alignment.topCenter,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: TextField(
                      enabled: false,
                      textAlign: TextAlign.center,
                      controller: TextEditingController(text: "title"),
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20,
                          fontWeight: FontWeight.w800),
                      decoration: InputDecoration(
                        
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black87, width: 1.0)),
                      ),
                    ),
                  )),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                InkWell(
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 130,
                          padding:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Colors.grey.shade200,
                                    offset: Offset(2, 4),
                                    blurRadius: 5,
                                    spreadRadius: 2)
                              ],
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Colors.black12,
                                    Colors.black12,
                                  ])),
                          child: Text(
                            'Cambiar portada',
                            style: TextStyle(fontSize: 16, color: Colors.blue),
                          ),
                        )
                      ],
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: null));
                    }),
                InkWell(
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 130,
                          padding:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Colors.grey.shade200,
                                    offset: Offset(2, 4),
                                    blurRadius: 5,
                                    spreadRadius: 2)
                              ],
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Color(0xfff57C00),
                                    Color(0xffe65100)
                                  ])),
                          child: Text(
                            'Vista previa',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: null));
                    }),
              ],
            ),
          ],
        )),
        bottomNavigationBar: Container(
          height: 40,
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 7),
          child: Row(
            children: <Widget>[
              Expanded(
                  flex: 5,
                  child: GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Colors.blue, Colors.blue])),
                      alignment: Alignment.center,
                      height: 39,
                      child: Text('EDITAR ÁLBUM',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700)),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/ListAbum');
                    },
                  ))
            ],
          ),
        ));
  }
}
