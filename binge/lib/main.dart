
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:binge/pages/main.search.page.dart';
import 'package:binge/pages/checkout.page.dart';
import 'package:flutter/rendering.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
//
// Created by Braulio Cassule
// 30 December 2017
//
void main() {
  //debugPaintSizeEnabled=true;
  runApp(new MyApp());
}



class MyApp extends StatefulWidget {
  _LogoAppState createState() => _LogoAppState();
}

class _LogoAppState extends State<MyApp> with
  SingleTickerProviderStateMixin{
  int _page = 0;
  Color gradientEnd = const Color(0xFFFF5640); //Change start gradient color here
  Color gradientStart = const Color(0xFFE8E8E8);//Change end gradient color here
  AnimationController _controller;
  PageController _pageController;
  PermissionStatus _permissionStatus = PermissionStatus.unknown;
  @override
  initState(){
     _pageController = new PageController();

     test2();
    _controller = new AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _controller.forward();
  }


  void test2() async {
    GeolocationStatus geolocationStatus;
     String get = '';
    try {
      geolocationStatus = await Geolocator().checkGeolocationPermissionStatus();
      print('geolocation');
      print(geolocationStatus);
      if (geolocationStatus.toString() == 'GeolocationStatus.granted') {
        Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
        //13.012405, 77.536148
        List<Placemark> placemarks = await Geolocator().placemarkFromCoordinates(position.longitude, position.latitude);
        print('placemark');
        print(placemarks.first.postalCode);
      } else{
        PermissionStatus permission = await PermissionHandler().checkPermissionStatus(PermissionGroup.location);
        Map<PermissionGroup, PermissionStatus> permissionsS = await PermissionHandler().requestPermissions([PermissionGroup.locationAlways]);
        print(permission);
        print(permissionsS);
      }
    } on PlatformException {
      geolocationStatus = null;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    TextStyle style = new TextStyle(
        color: Color(0xFF342D2A),
        fontFamily: 'KalamRegular',
        fontWeight: FontWeight.normal,
        fontSize: 20.0,
    );
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) =>
        new Scaffold(
          backgroundColor: Colors.white,
          body: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _topAppBar(context),
              Expanded(
                flex: 2,
                child: new PageView(
                  physics:new NeverScrollableScrollPhysics(),
                  children: <Widget>[
                    MainSearchPage(
                      controller: _controller,
                    ),
                    MainSearchPage(
                      controller: _controller,
                    ),
                    CheckoutPage(
                      controller: _controller,
                    ),
                  ],
                  onPageChanged: onPageChanged,
                  controller: _pageController,
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home',style: style,)),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_basket), title: Text('Checkout',style: style,)),
              BottomNavigationBarItem(icon: Icon(Icons.more), title: Text('More',style: style,)),
            ],
            fixedColor: Color(0xFF008761),
            onTap: navigationTapped,
            currentIndex: _page,
          ),
        ),
      ),
    );
  }
  void navigationTapped(int page) {
    // Animating to the page.
    // You can use whatever duration and curve you like
    _pageController.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  Widget _topAppBar(BuildContext context) {
    return new Card( 
      margin: EdgeInsets.all(0),
      elevation: 0,
      child: Container(
    height: 85,
    decoration: BoxDecoration(
      color: Colors.white,
    ),
    padding: const EdgeInsets.only(right:10.0, left: 10,top: 20),
      child: new Column(
        children: <Widget>[
          new Row(
            children: <Widget>[
              Expanded(
                child: Center(
                  child: new Text('Binge', style: TextStyle(
                fontSize: 36,
                fontFamily: 'Pacifico',
                color: Color(0xFF008761),
                ),
              ),
                ),
              ),
              IconButton(
                icon:Icon(
                Icons.search,
                color: Color(0xFF008761),
                size: 30.0,
              ),
                        onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondScreen()),
            );
          },
              ),
            ],
          ),
        ],
      ),
      ), 
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top:30.0),
        child: new Column(
          children: <Widget>[
            Row(
              children: <Widget>[
           Padding(
               padding: EdgeInsets.only(right:15.0),
               child: IconButton(
              icon:Icon(
                Icons.arrow_back,
                  color: Color(0xFF008761),
                  size: 30.0,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            new SizedBox(
                  width: 250.0,
                  child: TextFormField(
                    autofocus: true,
                style: TextStyle(
                    color: Color(0xFF342D2A),
                    fontFamily: 'KalamLight',
                    fontWeight: FontWeight.normal,
                    fontSize: 20.0,
                ),
                decoration: const InputDecoration(
                  
                  contentPadding: EdgeInsets.all(4.0),
                  disabledBorder: InputBorder.none,
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Color(0xFFE8E8E8),
                  hintText: 'Locality/Area',
                  hintStyle: TextStyle(
                    color: Color(0xFF342D2A),
                    fontFamily: 'KalamLight',
                    fontWeight: FontWeight.normal,
                    fontSize: 20.0,
                  ),
                ),
              ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top:8.0),
            ),
            new Container(
              height: 1.5,
              color: Color(0xFF342D2A),
            ),
            ],
        ),
      ),
    );
  }
}