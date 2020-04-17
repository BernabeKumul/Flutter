import 'dart:ui';
import 'package:app_demo/app/Core/models/TypeAlbum.dart';
import 'package:flutter/material.dart';

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
  var _formtitleKey = GlobalKey<FormFieldState>();
  String title = "Mis fotos";

  Map<String, double> pricePasta = {'suave': 150, 'dura': 300};
  Map<String, double> priceSize = {'chico': 49, 'grande': 199};

  @override
  void initState() {
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Icon(
                              Icons.cancel,
                              color: Colors.red,
                              size: 15,
                              textDirection: TextDirection.rtl,
                            ),
                            Text(
                              " Incompleto (1 de 60 fotos)",
                              style: TextStyle(color: Colors.black54),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
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
                            GestureDetector(
                              child: Card(
                                child: Image.asset(
                                  'assets/img/img2.jpg',
                                  fit: BoxFit.fitHeight,
                                  height: 150,
                                  width: 200,
                                ),
                              ),
                              onTap: () {
                                Navigator.pushNamed(context, '/ListPicture');
                              },
                            ),
                            Container(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      gradient: LinearGradient(
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          colors: [Colors.orange, Colors.red])),
                                  child: const Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                    size: 25,
                                    textDirection: TextDirection.rtl,
                                  ),
                                )),
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

            var listTitle = _getType(tipoPasta(), "pastasuave");
            _setPricePasta("Suave", "suave", listTitle);
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

            var listTitle = _getType(tipoPasta(), "pastadura");
            _setPricePasta("Dura", "dura", listTitle);
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
            var listTitle = _getType(tamanioPasta(), "pastachico");
            _setPriceSize("Chico", "chico", listTitle);
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

            var listTitle = _getType(tamanioPasta(), "pastagrande");
            _setPriceSize("Grande", "grande", listTitle);

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

  _onFromTapped() {
    FocusScopeNode current = FocusScope.of(context);
    current.previousFocus();
  }

  _setTotalAlbum() {
    typeAlbum.total = typeAlbum.priceSize + typeAlbum.pricePasta;
    total = typeAlbum.total.toStringAsFixed(2);
  }

  ListTile _getType(List<Widget> listData, String value) {
    var listContainer =
        listData.where((test) => (test.key == ValueKey(value))).toList();
    var widget = listContainer.first;
    var container = widget as Container;
    var card = container.child as Card;
    var listTitle = card.child as ListTile;

    return listTitle;
  }

  _setPricePasta(String name, String key, ListTile listTitle) {
    if (listTitle.selected) {
      typeAlbum.pasta = name;
      typeAlbum.pricePasta =
          pricePasta.entries.firstWhere((x) => x.key == key).value;
      _setTotalAlbum();
    }
  }

  _setPriceSize(String name, String key, ListTile listTitle) {
    if (listTitle.selected) {
      typeAlbum.size = name;
      typeAlbum.priceSize =
          priceSize.entries.firstWhere((x) => x.key == key).value;
      _setTotalAlbum();
    }
  }

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
}
