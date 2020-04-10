import 'package:app_demo/app/themes/app_colors.dart';
import 'package:flutter/material.dart';

class cardHome extends StatelessWidget {
  String img;
  String title;
  String subtitle;
  cardHome({
    this.img,
    @required this.title,
    @required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceInfo = MediaQuery.of(context);
    double _sizeCard = deviceInfo.orientation == Orientation.landscape
        ? deviceInfo.size.height * .20
        : deviceInfo.size.height * .15;

    return 
    GestureDetector(
      onTap: (){
                Navigator.pushNamed(context, '/Detail');
      },
       child: Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [AppColors.shadow],
          borderRadius: BorderRadius.all(Radius.circular(2))),
      child: Row(
        children: <Widget>[
          Flexible(fit: FlexFit.loose, flex: 0, child: _image(_sizeCard)),
          Flexible(fit: FlexFit.tight, flex: 1, child: _description(_sizeCard)),
          Flexible(fit: FlexFit.loose, flex: 0, child: _button(_sizeCard))
        ],
      ),
      width: double.infinity,
    )
    );
  }

  Widget _info() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            this.title,
            style: TextStyle(
                fontFamily: 'Roboto',
                color: new Color(0xFF212121),
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
          Text(
            this.subtitle ,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(
                fontFamily: 'Roboto',
                color: new Color(0xFF212121),
                fontSize: 12),
          ),
        ],
      );

  Widget _description(double height) {
    return Container(
        height: height,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(color: Colors.white),
        child: _info());
  }

  Widget _image(double height) {
    return Container(
      margin: EdgeInsets.only(right: 5),
      height: height,
      width: 100,
      padding: EdgeInsets.all(3),
      child: Image.asset(
        this.img ?? 'assets/img/img1.jpg',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _button(double height) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        children: <Widget>[
          InkWell(
              onTap: () => {print('Eliminación')},
              child: Icon(Icons.delete, color: Colors.black26, size: 30)),
        ],
      ),
    );
  }
}