import 'package:base_flutter_app/constants/colors.dart';
import 'package:base_flutter_app/constants/font_sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckBoxButtonWidget extends StatefulWidget{

  Function(bool)? handlerOnChanged;

  String? tile;

  bool? isChecked;

  CheckBoxButtonWidget({Key? key, this.handlerOnChanged, this.tile, this.isChecked}) : super(key: key);

  @override
  _CheckBoxButtonWidget createState() => _CheckBoxButtonWidget();
}

class _CheckBoxButtonWidget extends State<CheckBoxButtonWidget>{
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(widget.tile ?? "",
          style: const TextStyle(fontSize:  FontSizes.s14, fontWeight: FontWeight.normal, color: ColorCustom.mineShaft)),
      onChanged: (value) =>  widget.handlerOnChanged,
      value: widget.isChecked,
      controlAffinity: ListTileControlAffinity.leading,
    );
  }


}