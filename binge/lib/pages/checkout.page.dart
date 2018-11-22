import 'package:flutter/material.dart';
import 'package:binge/animation/animation.dart';

class CheckoutPage extends StatelessWidget {
  CheckoutPage({
    @required AnimationController controller,
  }) : animation = new BingeAnimation(controller);
  
  final BingeAnimation animation;

  Widget _buildSearch() {
    return new Container(
      padding: const EdgeInsets.all(10.0),
      margin: EdgeInsets.all(10.0),
       height: 140,
       decoration: BoxDecoration(
         color: Colors.white,
       ),
       child: new Column(
         children: <Widget>[
           new Text('checkotpage')
         ],
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
          new Flexible(flex: 2, child: _buildSearch()),
        ],
      ),
    );
  }
}