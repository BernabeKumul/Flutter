import 'package:app_demo/app/page/HomePage.dart';
import 'package:app_demo/app/page/signup.dart';
import 'package:app_demo/app/themes/background.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

 @override
  void initState() {
    super.initState();
  }

   @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: 
           SingleChildScrollView(
             child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: new BoxDecoration(
              image: backgroundLogin,),
              child: 
                  Container(
                  decoration: new BoxDecoration(
                        gradient: new LinearGradient(
                      colors: <Color>[
                        const Color.fromRGBO(0, 0, 0, 0.8),
                        const Color.fromRGBO(0, 0, 0, 0.6),
                      ],
                      stops: [0.2, 1.0],
                      begin: const FractionalOffset(0.0, 0.0),
                      end: const FractionalOffset(0.0, 1.0),
                    )),
                    child: Stack(
                      children: <Widget>[
                      Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              _title(),
                              SizedBox(height: 20),
                              Container(
                                alignment: Alignment.topLeft,
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Text('Bienvenido a easy photo', style: TextStyle(
                                color: Colors.white54),
                              )),
                              new FormContainer(),
                              SizedBox(height: 30),
                              _submitButton(),
                              _labelPassword(),
                              _divider(),
                              SizedBox(height: 20),
                               _buildIcon(),
                            ],
                          ),
                         Align(
                          alignment: Alignment.bottomCenter,
                          child: _loginAccountLabel(),
                        ),
                      ],
                    ),
                ),
           )
           ));
  }

 Widget _loginAccountLabel() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Aun no tiene cuenta?',
            style: TextStyle(fontSize: 13, color: Colors.white54),
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignUpPage()));
            },
            child: Text(
              'Registrar',
              style: TextStyle(
                  color: Color(0xfff57C00), //0xff4db6ac
                  fontSize: 13),
            ),
          )
        ],
      ),
    );
  }

Widget _buildIcon() {
  List<Widget> login = [];
  
    login.add(
      GestureDetector(
      onTap: () {
      },
      child: Container(
        height: 50.0,
        width: 50.0,
        margin: EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
          color:Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Icon(
          Icons.face,
          size: 25.0,
          color: Colors.blue
        ),
      ),
    ));
    login.add(
      GestureDetector(
      onTap: () {
      },
      child: Container(
        height: 50.0,
        width: 50.0,
        margin: EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
          color:Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Icon(
          Icons.favorite_border,
          size: 25.0,
          color: Colors.blue
        ),
      ),
    ));
    login.add(
      GestureDetector(
      onTap: () {
      },
      child: Container(
        height: 50.0,
        width: 50.0,
        margin: EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
          color:Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Icon(
          Icons.face,
          size: 25.0,
          color: Colors.red
        ),
      ),
    ));
    return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: login,
              );
  }

Widget _labelPassword(){
  return Container(
          alignment: Alignment.centerRight,
          margin:  EdgeInsets.symmetric(vertical: 5),
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text('Olvidaste tu contraseña?', style: TextStyle(
          color: Colors.white54),
        ));
}

Widget _submitButton() {
    return InkWell(
        child: Row(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width - 40,
              margin:  EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(vertical: 15),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(90)),
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0xFFE0703E), Color(0xFFE0703E)])),
              child: Text(
                'Iniciar',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            )
          ],
        ),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        });
  }

Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
                color: Colors.white54,
              ),
            ),
          ),
          Text('o', style: TextStyle( color: Colors.white54)),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
                color: Colors.white54,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Easy',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 40,
            fontWeight: FontWeight.w500,
            color: Color(0xffD500F9)
          ),
          children: [
            TextSpan(
              text: ' photo',
              style: TextStyle(color: Color(0xFFE0703E), fontSize: 40, fontWeight:FontWeight.w500 ),
            ),
          ]),
    );
  }
  }

