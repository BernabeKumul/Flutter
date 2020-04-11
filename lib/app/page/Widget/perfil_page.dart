import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PerfilPage extends StatelessWidget {
  PerfilPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 40, left: 20, bottom: 20, right: 20),
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
                              blurRadius: 5.0,
                              offset: const Offset(1.0, 2.0),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisSize:
                              MainAxisSize.min, // To make the card compact
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
                                backgroundImage:
                                    AssetImage("assets/img/img1.jpg"),
                                backgroundColor: Colors.blueAccent,
                                radius: Consts.avatarRadius,
                              ),
                            ],
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    child: Container(
                      decoration: new BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 5.0,
                            offset: const Offset(1.0, 2.0),
                          ),
                        ],
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.topLeft,
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 10, 10, 5),
                            child: Text(
                              "User Information",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                            ),
                          ),
                          Divider(),
                          ListTile(
                            title: Text('Email',
                                style: TextStyle(fontWeight: FontWeight.w500)),
                            subtitle: Text('antonio@gmail.com'),
                            leading: Icon(
                              Icons.email,
                              color: Colors.grey,
                            ),
                          ),
                          ListTile(
                            title: Text('Phone',
                                style: TextStyle(fontWeight: FontWeight.w500)),
                            subtitle: Text('(408) 555-1212'),
                            leading: Icon(
                              Icons.phone,
                              color: Colors.grey,
                            ),
                          ),
                          ListTile(
                            title: Text('About',
                                style: TextStyle(fontWeight: FontWeight.w500)),
                            subtitle: Text('Information'),
                            leading: Icon(
                              Icons.portrait,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ))
      ],
    );
  }
}

class Consts {
  Consts._();

  static const double padding = 20.0;
  static const double avatarRadius = 30.0;
}
