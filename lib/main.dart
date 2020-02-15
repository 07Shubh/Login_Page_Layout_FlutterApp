import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LoginPage',
      home: LoginPage(),
      theme: ThemeData(
          primarySwatch: Colors.amber,
          accentColor: Colors.deepOrange,
          brightness: Brightness.light),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  AnimationController _iconanimationController;
  Animation<double> _iconanimation;

  @override
  void initState() {
    super.initState();
    _iconanimationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 500)
    );
    _iconanimation = CurvedAnimation(
        parent: _iconanimationController,
        curve: Curves.easeOut
    );
    _iconanimation.addListener(() => this.setState(() {}));
    _iconanimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image(
            image: AssetImage("assets/rab.jpg"),
            fit: BoxFit.cover,
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              //getImageAsset(),
              FlutterLogo(
                size: _iconanimation.value * 100,
              ),
              Form(
                  child: Theme(
                      data: ThemeData(
                          brightness: Brightness.dark,
                          primarySwatch: Colors.teal,
                          inputDecorationTheme: InputDecorationTheme(
                              labelStyle: TextStyle(
                                  color: Colors.teal,
                                  fontSize: 20.0
                              )
                          )

                      ),
                      child: Container(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Enter email',
                                labelText: 'Email',
                              ),
                              keyboardType: TextInputType.emailAddress,
                            ),
                            Padding(padding: EdgeInsets.all(10.0)),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Password',
                                hintText: 'Enter password',
                              ),
                              keyboardType: TextInputType.text,
                              obscureText: true,
                            ),
                            Padding(padding: EdgeInsets.all(20.0),),
                            MaterialButton(
                                color: Colors.teal,
                                textColor: Colors.white,
                                child: Text('Login'),
                                onPressed: ()=>{},
                                splashColor: Colors.tealAccent,
                                )
                          ],
                        ),
                      ))
              )
            ],
          )
        ],
      ),
    );
  }
}

Widget getImageAsset() {
  AssetImage assetImage = AssetImage("assets/gal.png");
  Image image = Image(
    image: assetImage,
    width: 125.0,
    height: 125.0,
  );
  return Container(
    child: image,
    padding: EdgeInsets.only(left: 40.0, right: 40.0, top: 40.0),
  );
}