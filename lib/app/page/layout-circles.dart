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
            Container(
                width: double.infinity,
                height: double.infinity,
                child: Column(children: [_appBar(_deviceInfo.size)])),
          ],
        ),
      ),
    );
  }

  Widget _appBar(Size size) => SafeArea(
          child: Container(
        width: double.infinity,
        height: size.height * .1,
        child: Row(children: [Container(color: Colors.red)]),
      ));

  Widget _circle(double size) => Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
            color: widget.colorCircles,
            borderRadius: BorderRadius.circular(size * 2)),
      );
}
