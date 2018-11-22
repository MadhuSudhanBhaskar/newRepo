import 'package:flutter/material.dart';
import 'package:binge/animation/animation.dart';



class MainSearchPage extends StatelessWidget {
  MainSearchPage({
    @required AnimationController controller,
  }) : animation = new BingeAnimation(controller);
  
  final BingeAnimation animation;

  Widget _buildSearch() {
    return new Container(
      height: 240.0,
      padding: const EdgeInsets.all(14.0),
       decoration: BoxDecoration(
         color: Colors.white,
       ),
       child: new Column(
         children: <Widget>[
           new Row(
             mainAxisAlignment: MainAxisAlignment.start,
             children: <Widget>[
           new Text('Popular resturants', style: TextStyle(
            color: Color(0xFF342D2A),
            fontFamily: 'KalamRegular',
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            fontStyle: FontStyle.normal,
            letterSpacing: 1.0,
           ),
          ),
             ],
           ),
           new Row(
             mainAxisAlignment: MainAxisAlignment.start,
             children: <Widget>[
          new Text('Near by you', style: TextStyle(
            color: Color(0xFF008761),
            fontFamily: 'KalamLight',
            fontWeight: FontWeight.normal,
            fontSize: 18.0,
           ),
          ),
         ],
           ),],
       ),
    );
  
  }

  @override
  Widget build(BuildContext context) {
    print('INBUULS');
    return new Container(
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Flexible(flex: 4, child: _buildSearch()),
        ],
      ),
    );
  }
}