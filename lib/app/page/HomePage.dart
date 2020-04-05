import 'package:app_demo/app/Core/Auth/BaseAuth.dart';
import 'package:app_demo/app/themes/app_colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum Answers { YES, NO, MAYBE }

final List<String> imgList = [
  'assets/img/img1.jpg',
  'assets/img/img2.jpg',
  'assets/img/img3.jpg',
  'assets/img/img4.jpg',
];

class HomePage extends StatefulWidget {
  HomePage({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;

  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedPage = 0;

  final CarouselSlider autoPlayDemo = CarouselSlider(
    viewportFraction: 0.9,
    aspectRatio: 2.0,
    autoPlay: true,
    // enlargeCenterPage: true,
    items: imgList.map(
      (url) {
        return Container(
          margin: EdgeInsets.all(2.0),
          child: GestureDetector(
            onTap: () {
              // _askUser();
            },
            child: ClipRRect(
              child: Image.asset(
                url,
                fit: BoxFit.cover,
                width: 1000.0,
              ),
            ),
          ),
        );
      },
    ).toList(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/img/icon-name.png'),
        centerTitle: true,
        actions: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 20.0),
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
      body: _Tab(context, _selectedPage),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            ListTile(
              leading: CircleAvatar(
                  // backgroundColor: Color(0xff4db6ac),
                  ),
              title: Text("Mauricio Canche"),
              subtitle: Text("example@desarrollo.com"),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Color(0xff4db6ac)),
              title: Text("Inicio"),
              onTap: () {},
            ),
            ListTile(
                leading: Icon(Icons.account_box, color: Color(0xff4db6ac)),
                title: Text('Perfil'),
                onTap: () {}),
            ListTile(
                leading: Icon(Icons.exit_to_app, color: Color(0xff4db6ac)),
                title: Text("Salir"),
                onTap: () {}),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/create');
        },
        child: Icon(Icons.add_a_photo),
        backgroundColor: Color(0xff4db6ac),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPage,
          onTap: (int currentPage) {
            setState(() {
              _selectedPage = currentPage;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text('Inicio')),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), title: Text('perfil'))
          ]),
    );
  }

  Widget _Tab(BuildContext context, int tab) {
    final _pageOptions = [
      Container(
          child: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: Column(children: [
                    autoPlayDemo,
                  ])),
              SizedBox(
                height: 10,
              ),
              Card(
                  child: Container(
                // width: 100,
                height: 100,
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Image.asset(
                        "assets/img/img3.jpg",
                        fit: BoxFit.fitHeight,
                      ),

                      title: Text(
                        "Album 2",
                        style: TextStyle(
                            fontSize: 14.0, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Album",
                                style: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.normal)),
                            Text('Population: ',
                                style: TextStyle(
                                    fontSize: 11.0,
                                    fontWeight: FontWeight.normal)),
                          ]),
                      //trailing: ,
                      onTap: () {
                        Navigator.pushNamed(context, '/Detail');
                      },
                    )
                  ],
                ),
              )),
              Card(
                  child: Container(
                // width: 100,
                height: 100,
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Image.asset(
                        "assets/img/img1.jpg",
                        fit: BoxFit.cover,
                      ),

                      title: Text(
                        "Album 1",
                        style: new TextStyle(
                            fontSize: 14.0, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Text("Album",
                                style: new TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.normal)),
                            new Text('Population: ',
                                style: new TextStyle(
                                    fontSize: 11.0,
                                    fontWeight: FontWeight.normal)),
                          ]),
                      //trailing: ,
                      onTap: () {
                        Navigator.pushNamed(context, '/Detail');
                        // Navigator.pushNamed(context, '/cart');
                      },
                    )
                  ],
                ),
              ))
            ],
          )
        ],
      )),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 0),
        margin: EdgeInsets.only(top: 32),
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 16),
                      child: CircleAvatar(
                        backgroundColor: AppColors.grey,
                        child: Text('HR'),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Habib RG',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Text('habib_mma@hotmail.com',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12))
                        ],
                      ),
                    ),
                    Container(
                      child: Icon(Icons.chevron_right),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    ];
    return _pageOptions[tab];
  }

  Future _askUser() async {
    switch (await showDialog(
        context: context,
        /*it shows a popup with few options which you can select, for option we
        created enums which we can use with switch statement, in this first switch
        will wait for the user to select the option which it can use with switch cases*/
        child: new SimpleDialog(
          title: new Text('Do you like Flutter?'),
          children: <Widget>[
            new SimpleDialogOption(
              child: new Text('Yes!!!'),
              onPressed: () {
                Navigator.pop(context, Answers.YES);
              },
            ),
            new SimpleDialogOption(
              child: new Text('NO :('),
              onPressed: () {
                Navigator.pop(context, Answers.NO);
              },
            ),
            new SimpleDialogOption(
              child: new Text('Maybe :|'),
              onPressed: () {
                Navigator.pop(context, Answers.MAYBE);
              },
            ),
          ],
        ))) {
      case Answers.YES:
        // _setValue('Yes');
        break;
      case Answers.NO:
        // _setValue('No');
        break;
      case Answers.MAYBE:
        // _setValue('Maybe');
        break;
    }
  }
}
