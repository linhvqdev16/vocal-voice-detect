import 'package:base_flutter_app/constants/colors.dart';
import 'package:base_flutter_app/constants/font_sizes.dart';
import 'package:base_flutter_app/constants/radius.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonIconWidget extends StatefulWidget{

  String? iconUrl;

  String? labelButton;

  Function()? handlerEvent;

  Color? colorLabel;

  Color? backgroundColor;

  ButtonIconWidget({Key? key, this.iconUrl, this.labelButton, this.handlerEvent, this.colorLabel, this.backgroundColor}) : super(key: key);

  @override
  _ButtonIconWidget createState() => _ButtonIconWidget();

}

class _ButtonIconWidget extends State<ButtonIconWidget>{

  @override
  Widget build(BuildContext context) {
     return ElevatedButton.icon(
         style: ButtonStyle(
           shape: MaterialStateProperty.all<RoundedRectangleBorder>(
               RoundedRectangleBorder(
                   borderRadius: BorderRadius.all(Radius.circular(RadiusCustom.radiusButton)),
               ),
           ),
           backgroundColor: MaterialStateProperty.all(widget.backgroundColor ?? ColorCustom.colorWhite)
         ),
         onPressed: widget.handlerEvent,
         icon: Image.asset(widget.iconUrl ?? ""),
         label: Padding(
             padding: const EdgeInsets.all(15),
             child: Text(widget.labelButton ?? "", style: TextStyle(fontWeight: FontWeight.bold, color: widget.colorLabel, fontSize: FontSizes.s15))), );
  }

}