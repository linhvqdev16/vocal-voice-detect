
import 'package:base_flutter_app/constants/colors.dart';
import 'package:base_flutter_app/constants/styles.dart';
import 'package:flutter/material.dart';

import '../../../constants/font_sizes.dart';

class PageModelWidget extends StatefulWidget{

  String? imageUrl;
  String? textLabel;
  String? textContent;

  PageModelWidget({Key? key,
                         this.imageUrl,
                         this.textLabel,
                         this.textContent}) : super(key: key);

  @override
  _PageModelWidget createState() => _PageModelWidget();
}

class _PageModelWidget extends State<PageModelWidget>{

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      controller: ScrollController(),
      child: Column(
        children: [

          Padding( padding: const EdgeInsets.fromLTRB(75, 102, 10.0, 0.0),
                   child: Image.asset(widget.imageUrl ?? "", height: height * 0.5, width: width * 0.8, fit: BoxFit.cover,),
          ),

          Padding(
            padding:  const EdgeInsets.only(top: 50, left: 25),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.textLabel ?? "",
                style: const TextStyle(
                    fontSize: FontSizes.s18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),

          Padding(padding: const EdgeInsets.only(top: 25, left: 25),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.textContent ?? "",
              style: const TextStyle(
                  fontSize: FontSizes.s16,
                  fontWeight: FontWeight.normal) ,
            ),
          ))

        ],
      ),
    );
  }



}