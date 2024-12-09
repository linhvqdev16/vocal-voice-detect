import 'package:base_flutter_app/constants/colors.dart';
import 'package:base_flutter_app/constants/radius.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EvaluateButtonWidget extends StatefulWidget {

  Function()? buttonHandle;

  String? buttonLabel;

  Color? buttonLabelColor;

  Color? backGroundColor;

  double? opacity;

  EvaluateButtonWidget({Key? key, this.buttonHandle, this.buttonLabel, this.buttonLabelColor, this.backGroundColor, this.opacity}) : super(key: key);

  @override
  _EvaluateButtonWidget createState() => _EvaluateButtonWidget();
}

class _EvaluateButtonWidget extends State<EvaluateButtonWidget>{

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 44),
      decoration:  BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(RadiusCustom.radiusButton)),
        gradient:( widget.backGroundColor != null) ? null :  LinearGradient(
          colors: [
          ColorCustom.mediumPurple.withOpacity(widget.opacity ?? 1),
          ColorCustom.indigoPurple.withOpacity(widget.opacity ?? 1)
        ],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        ),
        color: widget.backGroundColor
      ),
      child: TextButton(
        child: Text(widget.buttonLabel ?? "", style: TextStyle(color: widget.buttonLabelColor ?? ColorCustom.colorWhite, fontWeight: FontWeight.bold),),
        onPressed: widget.buttonHandle,
      ),
    ); 
  }
}