import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class LayoutCircles extends StatefulWidget {
  final Color colorCircles;
  Widget child;
  LayoutCircles({Key key, @required this.colorCircles, @required this.child})
      : super(key: key);

  @override
  _LayoutCirclesState createState() => _LayoutCirclesState();
}

class _LayoutCirclesState extends State<LayoutCircles> {
  @override
  Widget build(BuildContext context) {
    final MediaQueryData _deviceInfo = MediaQuery.of(context);
    return Scaffold(
      body: Container(
          color: Colors.white,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: -_deviceInfo.size.height * .4,
                left: _deviceInfo.size.height * .2,
                child: _circle(_deviceInfo.size.height * .8),
              ),
              Positioned(
                top: _deviceInfo.size.height * .4,
                right: _deviceInfo.size.height * .35,
                child: _circle(_deviceInfo.size.height * .5),
              ),
              Positioned(
                top: -_deviceInfo.size.height * .030,
                left: -_deviceInfo.size.height * .010,
                child: SafeArea(
                  child: Image.asset(
                    'assets/img/icon-name.png',
                    width: _deviceInfo.size.height * .23,
                    height: 100,
                  ),
                ),
              ),
              Column(children: <Widget>[
                _appBar(_deviceInfo.size, context),
                widget.child
              ]),
            ],
          )),
    );
  }

  Widget _appBar(Size size, BuildContext context) => SafeArea(
          child: Container(
        width: double.infinity,
        height: size.height * .1,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(),
          Flexible(
            flex: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[_shoppingCart(context)],
            ),
          )
        ]),
      ));

  Widget _shoppingCart(BuildContext context) => Container(
        height: double.infinity,
        margin: EdgeInsets.only(top: 16),
        child: Stack(
          children: <Widget>[
            Container(
                height: 40,
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/cart');
                  },
                  child: Icon(Icons.shopping_cart, color: Colors.white),
                )),
            Positioned(
              top: 0,
              right: 0,
              child: Badge(
                  borderRadius: 40,
                  padding: EdgeInsets.all(4),
                  shape: BadgeShape.circle,
                  badgeContent: Text(
                    '1',
                    style: TextStyle(fontSize: 8, color: Colors.white),
                  )),
            )
          ],
        ),
      );
  Widget _circle(double size) => Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
            color: widget.colorCircles,
            borderRadius: BorderRadius.circular(size * 2)),
      );
}
