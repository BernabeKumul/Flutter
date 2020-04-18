import 'package:app_demo/app/Core/Service/AlbumService.dart';
import 'package:app_demo/app/Core/models/Album.dart';
import 'package:app_demo/app/Core/models/post.dart';
import 'package:app_demo/app/Core/store/models/appState.dart';
import 'package:app_demo/app/page/Home/Widget/alert.dart';
import 'package:app_demo/app/page/Home/Widget/card.dart';
import 'package:app_demo/app/page/Home/Widget/custom_carrousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../AlbumsProps.dart';

class AlbumsPage extends StatelessWidget {
  AlbumService albumService = new AlbumService();

  AlbumsPage({Key key}) : super(key: key);

   List<Post> ads = [
    new Post(
        "Portadas prediseñadas",
        "Una vez creado tu álbum, selecciona 'Cambiar portada' y encontrarás portadas prediseñadas de diferentes temas",
        "Crear álbum",
        "assets/img/background_login.png"),
    new Post(
        "Pasta suave",
        "Paquete con 60 fotos, papel couche e impresión digital por solo \$ 199 MXN. ¡No te lo pierdas!",
        "Ver producto",
        "assets/img/img2.jpg"),
    new Post(
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

  createDialog(BuildContext context, Post ad) {
    return showDialog(
        context: context,
        builder: (context) {
          return Alert(
            title: ad.title,
            imageURL: ad.imageURL,
            buttonText: ad.buttonText,
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return 
    StoreConnector<AppState, AlbumsProps>(
    converter: (store) => mapToProps(store, albumService),
    builder:(context, props) {
    List<Album> albums = props.lstAlbums;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .38,
            child: Container(
              child: createCarouselSlider(),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .38,
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.bottomLeft,
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Text('Mis Albums',
                      style: TextStyle(color: Colors.black45, fontSize: 16)),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: albums.length,
                    itemBuilder: ( context, i ) => _card(context, albums[i] )
                    ),
                )
              ],
            ),
          )
        ],
      ),
    );
    });
  }

  Widget _card(BuildContext context, Album album){
    return Column(
      children: <Widget>[
        CardHome(
                title: album.title,
                subtitle: album.subtitle,
                img: album.img
              ),
        SizedBox(height: 15)
      ],
    );
  }
}