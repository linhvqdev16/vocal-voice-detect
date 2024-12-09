import 'package:base_flutter_app/constants/colors.dart';
import 'package:base_flutter_app/constants/font_sizes.dart';
import 'package:base_flutter_app/constants/radius.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonCardWidget extends StatefulWidget {
  Color? backgroundColorIcon;

  Color? backgroundColorButton;

  Color? iconColor;

  String? titleButton;

  String? iconUrl;

  String? labelButton;

  Function()? buttonHandle;

  Widget? widget;

  ButtonCardWidget(
      {Key? key,
      this.backgroundColorIcon,
      this.backgroundColorButton,
      this.titleButton,
      this.iconUrl,
      this.labelButton,
      this.buttonHandle,
      this.iconColor,
      this.widget})
      : super(key: key);

  @override
  _ButtonCardWidget createState() => _ButtonCardWidget();
}

class _ButtonCardWidget extends State<ButtonCardWidget> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.only(top: 25, left: 25, right: 25),
      child: Card(
        elevation: 0,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(RadiusCustom.radiusInputFormField))),
        color: ColorCustom.colorWhite,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: width * 0.09,
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(right: 15),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                            Radius.circular(RadiusCustom.radiusButton)),
                        color: (widget.backgroundColorIcon ??
                                ColorCustom.doveGrayColor)
                            .withOpacity(0.2)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Image.asset(widget.iconUrl ?? "",
                          height: 20, color: widget.iconColor),
                    ),
                  ),
                  Expanded(
                      child: Text(
                    widget.titleButton ?? "",
                    style: const TextStyle(
                        fontSize: FontSizes.s14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ))
                ],
              ),

              Container(child: widget.widget ?? null),

              Row(
                children: [
                  GestureDetector(
                    onTap: widget.buttonHandle,
                    child: Container(
                      margin: const EdgeInsets.only(top: 25),
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.065,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                              Radius.circular(RadiusCustom.radiusHeader)),
                          color: ColorCustom.hawkesBlue.withOpacity(0.7)),
                      child: Row(
                        children: [
                          Container(
                              margin: const EdgeInsets.only(right: 10),
                              child: Icon(
                                Icons.add_circle_rounded,
                                size: width * 0.13,
                                color: ColorCustom.colorWhite,
                              )),
                          Expanded(
                              child: Text(
                            widget.labelButton ?? "",
                            style: const TextStyle(
                                fontSize: FontSizes.s15,
                                fontWeight: FontWeight.bold,
                                color: ColorCustom.mediumPurple),
                          ))
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
