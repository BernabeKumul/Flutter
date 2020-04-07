import 'dart:ui';

import 'package:flutter/material.dart';

import 'carrocel.dart';

class DeailPage extends StatefulWidget {
  DeailPage({Key key}) : super(key: key);

  @override
  _DeailPagePageState createState() => _DeailPagePageState();
}

class _DeailPagePageState extends State<DeailPage> {
  TypeAlbum typeAlbum = new TypeAlbum();

  bool isSwitched = true;
  bool isActive = true;
  bool isActiveSize = true;
  String total;
  final _formKey = GlobalKey<FormState>();
  var _formtitleKey = GlobalKey<FormFieldState>();
  String title = "Mis fotos";

  Map<String, double> pricePasta = {'dura': 300, 'suave': 150};
  Map<String, double> priceSize = {'chico': 49, 'grande': 199};

  _setPropertyAlbum() {
    typeAlbum.title = title;
    typeAlbum.pasta = "Dura";
    typeAlbum.pricePasta =
        pricePasta.entries.firstWhere((x) => x.key == "suave").value;
    typeAlbum.priceSize =
        priceSize.entries.firstWhere((x) => x.key == "chico").value;
    typeAlbum.date = isSwitched;
    _setTotalAlbum();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _setPropertyAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: Scaffold(
        appBar: AppBar(
          title: Text('Fotos'),
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
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Container(
                  color: Color.fromARGB(10, 13, 13, 14),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: TextField(
                          enabled: true,
                          readOnly: true,
                          controller: TextEditingController(text: title),
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 20,
                              fontWeight: FontWeight.w800),
                          decoration: InputDecoration(
                            labelText: 'Título',
                            labelStyle: TextStyle(
                                color: Colors.black54,
                                fontSize: 20,
                                fontWeight: FontWeight.w400),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black87, width: 1.0)),
                            suffixIcon: const Icon(
                              Icons.edit,
                              color: Colors.blue,
                              size: 20,
                              textDirection: TextDirection.rtl,
                            ),
                          ),
                          // initialValue: "Título",
                          // enabled: false,
                          // readOnly: true,
                          onTap: () async {
                            await showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return alertDialog();
                                });

                            _onFromTapped();
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 150,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0.0, 2.0),
                              blurRadius: 9.0,
                            ),
                          ],
                        ),
                        alignment: Alignment.center,
                        child: Stack(
                          children: <Widget>[
                            Card(
                              child: Image.asset(
                                'assets/img/img1.jpg',
                                fit: BoxFit.fitHeight,
                                height: 150,
                                width: 200,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      new Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 38,
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,

                                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                children: <Widget>[
                                  const Text(
                                    "Imprimir fechas",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Switch(
                                    value: isSwitched,
                                    onChanged: (value) {
                                      setState(() {
                                        isSwitched = value;
                                        typeAlbum.date = isSwitched;
                                      });
                                    },
                                    inactiveThumbColor: Colors.white,
                                    inactiveTrackColor: Colors.grey,
                                    activeTrackColor: Colors.green,
                                    activeColor: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Colors.grey,
                              thickness: 0.5,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Container(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: tipoPasta(),
                            )),
                            SizedBox(),
                            Container(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: tamanioPasta(),
                            )),
                            SizedBox(
                              height: 8,
                            ),
                            Divider(
                              color: Colors.grey,
                              thickness: 0.5,
                            ),
                            Container(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10, 10, 10, 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  const Text(
                                    "Total:",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black45,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 20,
                                        fontFamily: 'arial'),
                                  ),
                                  Text(
                                    "MXN \$$total",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.black45,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 20,
                                        fontFamily: 'arial'),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
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
                              colors: [Color(0xff80cbc4), Color(0xff4db6ac)])),
                      alignment: Alignment.center,
                      height: 39,
                      child: Text('SIGUIENTE',
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

  BoxShadow isSelected(dynamic opt) {
    print(opt);
    return BoxShadow(
      color: Colors.black26,
      offset: Offset(0.0, 2.0),
      blurRadius: 9.0,
    );
  }

  List<Widget> tipoPasta() {
    return [
      Container(
        key: ValueKey("pastasuave"),
        width: MediaQuery.of(context).size.width / 2.5,
        decoration: BoxDecoration(
          boxShadow: isActive ? [isSelected(this)] : [],
        ),
        child: Card(
            child: ListTile(
          selected: isActive,
          title: Text(
            'Pasta Suave',
            style: isActive ? colorActive() : colorInactive(),
          ),
          onTap: () {
            setState(() {
              isActive = true;
            });

            var x = tipoPasta()
                .where((test) => (test.key == ValueKey("pastasuave")))
                .toList();
            var doc = x.first;
            var po = doc as Container;
            var po1 = po.child as Card;
            var po2 = po1.child as ListTile;

            if (po2.selected) {
              typeAlbum.pasta = "Suave";
              typeAlbum.pricePasta =
                  pricePasta.entries.firstWhere((x) => x.key == "suave").value;
              _setTotalAlbum();
            }
          },
        )),
      ),
      Container(
        key: ValueKey("pastadura"),
        width: MediaQuery.of(context).size.width / 2.5,
        decoration: BoxDecoration(
          boxShadow: !isActive ? [isSelected(this)] : [],
        ),
        alignment: Alignment.center,
        child: Card(
            child: ListTile(
          selected: !isActive,
          title: Text(
            'Pasta Dura',
            style: !isActive ? colorActive() : colorInactive(),
          ),
          onTap: () {
            setState(() {
              isActive = false;
            });

            var x = tipoPasta()
                .where((test) => (test.key == ValueKey("pastadura")))
                .toList();
            var doc = x.first;
            var po = doc as Container;
            var po1 = po.child as Card;
            var po2 = po1.child as ListTile;

            if (po2.selected) {
              typeAlbum.pasta = "Dura";
              typeAlbum.pricePasta =
                  pricePasta.entries.firstWhere((x) => x.key == "dura").value;
              _setTotalAlbum();
            }
          },
        )),
      ),
    ];
  }

  TextStyle colorActive() {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18,
    );
  }

  TextStyle colorInactive() {
    return TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    );
  }

  List<Widget> tamanioPasta() {
    return [
      Container(
        key: ValueKey("pastachico"),
        width: MediaQuery.of(context).size.width / 2.5,
        decoration: BoxDecoration(
          boxShadow: isActiveSize ? [isSelected(this)] : [],
        ),
        child: Card(
            child: ListTile(
          selected: isActiveSize,
          title: Text(
            '16x16 cm',
            style: isActiveSize ? colorActive() : colorInactive(),
          ),
          onTap: () {
            setState(() {
              isActiveSize = true;
            });

            var x = tamanioPasta()
                .where((test) => (test.key == ValueKey("pastachico")))
                .toList();
            var doc = x.first;
            var po = doc as Container;
            var po1 = po.child as Card;
            var po2 = po1.child as ListTile;

            if (po2.selected) {
              typeAlbum.pasta = "Chico";
              typeAlbum.priceSize =
                  priceSize.entries.firstWhere((x) => x.key == "chico").value;
              _setTotalAlbum();
            }
            // _showSnackBar();
          },
        )),
      ),
      Container(
        key: ValueKey("pastagrande"),
        width: MediaQuery.of(context).size.width / 2.5,
        decoration: BoxDecoration(
          boxShadow: !isActiveSize ? [isSelected(this)] : [],
        ),
        child: Card(
            child: ListTile(
          selected: !isActiveSize,
          title: Text(
            '21x21 cm',
            style: !isActiveSize ? colorActive() : colorInactive(),
          ),
          onTap: () {
            setState(() {
              isActiveSize = false;
            });

            var x = tamanioPasta()
                .where((test) => (test.key == ValueKey("pastagrande")))
                .toList();
            var doc = x.first;
            var po = doc as Container;
            var po1 = po.child as Card;
            var po2 = po1.child as ListTile;

            if (po2.selected) {
              typeAlbum.pasta = "Grande";
              typeAlbum.priceSize =
                  priceSize.entries.firstWhere((x) => x.key == "grande").value;
              _setTotalAlbum();
            }
            // _showSnackBar();
          },
        )),
      )
    ];
  }

  AlertDialog alertDialog() {
    TextEditingController _textField = TextEditingController();

    int countTitle = title.length;
    int totalTitle = 30;
    String set1 = "";
    return AlertDialog(
      contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 15),
      titlePadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      title: Row(
        // verticalDirection: VerticalDirection.down,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            child: const Text("X",
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w300,
                    fontSize: 20,
                    fontFamily: 'arial')),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Text(
            "Editar título",
            style: TextStyle(
                color: Colors.black45,
                fontWeight: FontWeight.w500,
                fontSize: 16,
                fontFamily: 'arial'),
          ),
          GestureDetector(
            child: const Text("Listo",
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    fontFamily: 'arial')),
            onTap: () {
              if (_formtitleKey.currentState.validate()) {
                //  Scaffold.of(context).showSnackBar(SnackBar(content:Text("data")));
                title = _formtitleKey.currentState.value;
                Navigator.pop(context);
              }
            },
          ),
        ],
      ),
      content: StatefulBuilder(
        // You need this, notice the parameters below:
        builder: (BuildContext context, StateSetter setState) {
          return Row(children: <Widget>[
            Expanded(
                child: TextFormField(
              initialValue: title,
              // controller: TextEditingController(text: title),
              key: _formtitleKey,
              autovalidate: true,
              autofocus: true,
              maxLength: 30,
              maxLengthEnforced: true,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(right: 20.0),
                labelText: 'Nombre de la colección',
                labelStyle: TextStyle(fontSize: 18),
                counterText: "$countTitle/$totalTitle",
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return "Campo obligatorio";
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  countTitle = value.length;
                });
              },
            ))
          ]);
        },
      ),
    );
  }

  void _onFromTapped() {
    FocusScopeNode current = FocusScope.of(context);
    current.previousFocus();
  }

  _setTotalAlbum() {
    typeAlbum.total = typeAlbum.priceSize + typeAlbum.pricePasta;
    total = typeAlbum.total.toStringAsFixed(2);
  }
}

class TypeAlbum {
  String title;
  String pasta;
  String size;
  bool date;
  double total;
  double pricePasta;
  double priceSize;

  setPricePasta(double price) {
    pricePasta = price;
  }

  setPriceSize(double price) {
    priceSize = price;
  }
}
