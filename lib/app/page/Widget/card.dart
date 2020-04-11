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
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [AppColors.shadow, BoxShadow(
      color: Colors.black26,
      offset: Offset(0.5, 4.0),
      blurRadius: 9.0,
    )],
          borderRadius: BorderRadius.all(Radius.circular(5))),
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            this.title,
            style: TextStyle(
                fontFamily: 'Roboto',
                color: new Color(0xFF212121),
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            this.subtitle ,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            softWrap: true,
            style: TextStyle(
                fontFamily: 'Roboto',
                color: Colors.black45,
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
      padding: EdgeInsets.all(7),
      child: Image.asset(
        this.img ?? 'assets/img/img1.jpg',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _button(double height) {
    return Container(
      height: height,
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          InkWell(
              onTap: () => {print('apretado')},
              child: Icon(Icons.delete, color: Colors.black26, size: 22)),
        ],
      ),
    );;
  }
}