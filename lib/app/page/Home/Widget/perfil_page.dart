import 'package:app_demo/app/Core/models/perfil.dart';
import 'package:app_demo/app/Core/store/models/appState.dart';
import 'package:app_demo/app/themes/perfil_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class PerfilPage extends StatelessWidget {
  PerfilPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Perfil>(
        converter: (store) => store.state.perfilState.perfil,
        distinct: true,
        builder: (_, perfil) {
          return Stack(
            children: <Widget>[
              Container(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                        top: 40, left: 20, bottom: 20, right: 20),
                    child: Column(
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(
                                top: 25,
                                bottom: 20.0,
                                left: 20.0,
                                right: 20.0,
                              ),
                              margin: EdgeInsets.only(top: 40),
                              decoration: imageBoxDecoration(5.0, 1.0, 2.0),
                              child: Column(
                                mainAxisSize: MainAxisSize
                                    .min, // To make the card compact
                                children: <Widget>[
                                  textName(perfil.name),
                                  Divider(
                                    thickness: 1.5,
                                  ),
                                  SizedBox(height: 8.0),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Container(
                                        child: Column(
                                          children: _countAlbum(3, "Albumnes"),
                                        ),
                                      ),
                                      Container(
                                        child: Column(
                                          children: _countAlbum(5, "Albumnes"),
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
                            positionedImage(perfil.image),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          child: Container(
                            decoration: imageBoxDecoration(5.0, 1.0, 2.0),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.topLeft,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 10, 10, 5),
                                  child: textGray("User Information"),
                                ),
                                Divider(),
                                _userInformation(
                                    'Email', perfil.email, Icons.email),
                                _userInformation(
                                    'Phone', perfil.phone, Icons.phone),
                                _userInformation(
                                    'About', perfil.about, Icons.portrait),
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
        });
  }

  _userInformation(nameSection, information, icon) {
    return ListTile(
      title: Text(nameSection, style: TextStyle(fontWeight: FontWeight.w500)),
      subtitle: Text(information),
      leading: Icon(
        icon,
        color: Colors.grey,
      ),
    );
  }

  List<Widget> _countAlbum(albums, name) {
    return <Widget> [
      Text(
        "$albums",
        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w900),
      ),
      SizedBox(
        height: 8,
      ),
      Text(
        "$name",
        style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black45),
      )
    ];
  }
}
