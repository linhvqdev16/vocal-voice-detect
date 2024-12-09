import 'package:base_flutter_app/constants/colors.dart';
import 'package:base_flutter_app/constants/font_sizes.dart';
import 'package:base_flutter_app/constants/radius.dart';
import 'package:flutter/material.dart';

class PasswordFormFieldWidget extends StatefulWidget{

  String? labelFromField;

  TextEditingController? textEditingController;

  String? messageFormField;

  Function()? handleChangeEvent;

  TextInputType? textInputType;

  bool? isReadOnly;

  FormFieldValidator<String>? formFieldValidator;

  FloatingLabelBehavior? floatingLabelBehavior;

  Function()? handleEventObscureText;

  bool? obscureText;

  PasswordFormFieldWidget({Key? key, this.handleChangeEvent,
    this.labelFromField,
    this.messageFormField,
    this.textInputType,
    this.textEditingController,
    this.isReadOnly,
    this.formFieldValidator,
    this.floatingLabelBehavior,
    this.handleEventObscureText,
    this.obscureText}) : super(key: key);


  @override
  _PasswordFormFieldWidget createState() => _PasswordFormFieldWidget();

}

class _PasswordFormFieldWidget extends State<PasswordFormFieldWidget>{

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
            hintText: widget.messageFormField ?? "",
            hintStyle: const TextStyle(fontSize: FontSizes.s12, fontWeight: FontWeight.normal, color: ColorCustom.indigoPurple),
            labelText: widget.labelFromField ?? "",
            labelStyle: const TextStyle(fontSize: FontSizes.s12, fontWeight: FontWeight.bold, color: ColorCustom.indigoPurple),
            contentPadding: const EdgeInsets.only(top: 12, left: 15),
            floatingLabelBehavior: widget.floatingLabelBehavior,
            suffixIcon: IconButton(
              icon: (widget.obscureText ?? false) ? const Icon(Icons.visibility_off)  : const Icon(Icons.visibility),
              onPressed: widget.handleEventObscureText,
            ),
        ),
        validator: widget.formFieldValidator,
        obscureText: widget.obscureText ?? false,
      ),
    );
  }

}