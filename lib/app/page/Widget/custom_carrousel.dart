import 'package:app_demo/app/themes/app_colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomCarrousel extends StatefulWidget {
  Function(BuildContext context, dynamic item) onPress;
  List<dynamic> items = [];

  CustomCarrousel({Key key, this.onPress, this.items}) : super(key: key);

  @override
  _CustomCarrouselState createState() => _CustomCarrouselState();
}

class _CustomCarrouselState extends State<CustomCarrousel> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceInfo = MediaQuery.of(context);
    return Container(
        padding: EdgeInsets.symmetric(vertical: 5.0),
        margin: EdgeInsets.symmetric(vertical: 12),
        child: Column(
          children: <Widget>[
            _carrousel(deviceInfo),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: map<Widget>(
                widget.items,
                (index, url) {
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _current == index
                            ? AppColors.primaryColor
                            : Color.fromRGBO(0, 0, 0, 0.3)),
                  );
                },
              ),
            )
          ],
        ));
  }

  Widget _carrousel(MediaQueryData deviceInfo) {
    return CarouselSlider(
      height: deviceInfo.size.height * .28,
      autoPlayInterval: Duration(seconds: 6),
      viewportFraction: 1.0,
      aspectRatio: 1,
      autoPlay: true,
      onPageChanged: (index) {
        setState(() {
          _current = index;
        });
      },
      enlargeCenterPage: true,
      items: widget.items.map(
        (item) {
          return Container(
            margin: EdgeInsets.only(bottom: 12),
            width: deviceInfo.size.width * 0.90,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                boxShadow: [AppColors.simpleShadow]),
            child: GestureDetector(
              onTap: () {
                widget.onPress(context, item);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  item.imageURL,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ).toList(),
    );
  }

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }
}
