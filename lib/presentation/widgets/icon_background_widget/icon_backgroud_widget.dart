import 'package:base_flutter_app/constants/colors.dart';
import 'package:base_flutter_app/constants/font_sizes.dart';
import 'package:base_flutter_app/constants/radius.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconBackGroundWidget extends StatefulWidget {

  Color? backgroundColor;

  String? iconUrl;

  String? textLabel;

  IconBackGroundWidget({Key? key, this.backgroundColor, this.iconUrl, this.textLabel})
      : super(key: key);

  @override
  _IconBackGroundWidget createState() => _IconBackGroundWidget();
}

class _IconBackGroundWidget extends State<IconBackGroundWidget> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height * 0.09,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: height * 0.04,
            width: width * 0.08,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                    Radius.circular(RadiusCustom.radiusImagePortrait)),
                color: (widget.backgroundColor ?? ColorCustom.doveGrayColor)
                    .withOpacity(0.2)),
            child: Align(
              alignment: Alignment.center,
              child: Image.asset(widget.iconUrl ?? ""),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(child: Text(widget.textLabel ?? "", style: TextStyle(fontSize: FontSizes.s11, fontWeight: FontWeight.normal, color: Colors.black),))

        ],
      ),
    );
  }
}

class IconBackgroundModel {

  Color? backgroundColor;

  String? iconUrl;

  IconBackgroundModel({this.backgroundColor, this.iconUrl});
}
