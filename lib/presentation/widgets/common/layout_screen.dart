import 'package:flutter/cupertino.dart';

class LayoutScreen extends StatefulWidget{

  Widget? child;

  LayoutScreen({Key? key, this.child}) : super(key: key);

  @override
  _LayoutScreen createState() => _LayoutScreen();
}

class _LayoutScreen extends State<LayoutScreen>{

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: widget.child,
    );
  }

}