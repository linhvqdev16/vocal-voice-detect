import 'package:base_flutter_app/constants/colors.dart';
import 'package:base_flutter_app/constants/font_sizes.dart';
import 'package:base_flutter_app/constants/icons.dart';
import 'package:base_flutter_app/constants/radius.dart';
import 'package:flutter/material.dart';


class TextFormFieldPrefixWidget extends StatefulWidget{

  String? labelFromField;

  TextEditingController? textEditingController;

  String? messageFormField;

  Function()? handleChangeEvent;

  TextInputType? textInputType;

  bool? isReadOnly;

  FormFieldValidator<String>? formFieldValidator;

  FloatingLabelBehavior? floatingLabelBehavior;

  Color? colorLabel;

  Color? colorMessage;


  TextFormFieldPrefixWidget({Key? key, this.handleChangeEvent,
    this.messageFormField,
    this.textInputType,
    this.textEditingController,
    this.isReadOnly,
    this.formFieldValidator,
    this.floatingLabelBehavior,
    this.colorLabel,
    this.colorMessage
  }) : super(key: key);

  @override
  _TextFormFieldPrefixWidget createState() => _TextFormFieldPrefixWidget();

}

class _TextFormFieldPrefixWidget extends State<TextFormFieldPrefixWidget>{

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.08,
      margin: const EdgeInsets.fromLTRB(25, 25, 25, 0),
      decoration: BoxDecoration(
        border: Border.all(color: ColorCustom.colorWhite, width: 2),
        borderRadius: const BorderRadius.all(Radius.circular(RadiusCustom.radiusInputFormField)),
        color: ColorCustom.colorWhite,
      ),
      child: TextFormField(
        controller: widget.textEditingController,
        autofocus: false,
        keyboardType: widget.textInputType ?? TextInputType.text,
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Image.asset(IconCustom.iconSearch)),
            hintText: widget.messageFormField ?? "",
            hintStyle:  TextStyle(fontSize: FontSizes.s12, fontWeight: FontWeight.normal, color: widget.colorMessage ?? ColorCustom.doveGrayColor),
            contentPadding:  EdgeInsets.only(top:  18, left: 15),
            floatingLabelBehavior: widget.floatingLabelBehavior,
        ),
        validator: widget.formFieldValidator,
      ),
    );
  }

}