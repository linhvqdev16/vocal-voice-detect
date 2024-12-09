import 'package:base_flutter_app/constants/colors.dart';
import 'package:base_flutter_app/constants/font_sizes.dart';
import 'package:base_flutter_app/constants/radius.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DisplayFormValueWidget extends StatefulWidget{

  String? iconUrl;

  String? labelForm;

  String? valueForm;
  
  Function()? handlerClick;

  Color? backGroundStackColor;

  Function()? handlerIncreaseNumber;

  bool? isHasHandler;

  Color? iconColor;

  bool? isHalf;

  DisplayFormValueWidget({Key? key, this.iconUrl, this.labelForm, this.valueForm, this.handlerClick, this.backGroundStackColor, this.handlerIncreaseNumber, this.isHasHandler, this.iconColor, this.isHalf}) : super(key: key);

  @override
  _DisplayFormValueWidget createState() => _DisplayFormValueWidget();
}

class _DisplayFormValueWidget extends State<DisplayFormValueWidget>{
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: widget.handlerClick,
      child: Container(
        height: height * 0.12,
        decoration: const BoxDecoration(
            color: ColorCustom.colorWhite,
            borderRadius: BorderRadius.all(Radius.circular(RadiusCustom.radiusInputFormField))
        ),
        margin: const EdgeInsets.only(top: 25),
        padding: EdgeInsets.only( left: (widget.isHalf ?? false)  ? 0 : 25),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 1,
                child: Container(
              width: (widget.isHalf ?? false) ?  width * 0.055 : width * 0.11,
              padding: const EdgeInsets.all(6),
              margin: EdgeInsets.symmetric(vertical:  height * 0.03),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular( (widget.isHalf ?? false) ? RadiusCustom.radiusInputFormField : RadiusCustom.radiusImagePortrait)),
                  color: ( widget.backGroundStackColor ?? ColorCustom.doveGrayColor).withOpacity(0.2)
              ),
              child: Align(
                alignment: Alignment.center,
                child: Image.asset(widget.iconUrl ?? "", height: 20, color: widget.iconColor,),
              ),
            )),
            const SizedBox(width: 25),

            Expanded(
                flex:  (widget.isHasHandler ?? false) ? 2 : 5,
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.labelForm != null ? Text(widget.labelForm ?? "",
                    style: const TextStyle(fontSize: FontSizes.s12, fontWeight: FontWeight.normal, color: ColorCustom.doveGrayColor),
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.clip) : const SizedBox(height: 0,),

                SizedBox(height: widget.labelForm != null  ? 15 : 0),

                Text(widget.valueForm ?? "",
                    style: const TextStyle(fontSize: FontSizes.s14, fontWeight: FontWeight.bold, color: Colors.black),
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.clip)

              ],
            )),

            (widget.isHasHandler ?? false) ? Expanded(
               flex: 3,
               child: Container(
                 margin: const EdgeInsets.only(right: 15),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                 Padding(padding: const EdgeInsets.only(right: 15), child: ClipOval(
                   child: Material(
                     color: ColorCustom.puertoRico, // Button color
                     child: InkWell(
                       splashColor: Colors.red, // Splash color
                       onTap: () {},
                       child: SizedBox(width: 30, height: 30, child: Icon(Icons.remove, size: 15, color: ColorCustom.colorWhite)),
                     ),
                   ),
                 )),


                 Column(
                   children: [
                     Expanded(child: Align(
                         alignment: Alignment.center,
                         child: Text("1")))
                   ],
                 ),


                 Padding(padding: const EdgeInsets.only(left: 15),
                     child:  ClipOval(
                       child: Material(
                         color: ColorCustom.puertoRico, // Button color
                         child: InkWell(
                           splashColor: Colors.red, // Splash color
                           onTap: () {},
                           child: SizedBox(width: 30, height: 30, child: Icon(Icons.add, size: 15, color: ColorCustom.colorWhite)),
                         ),
                       ),
                     ))
             ],
           ),
               )) : const SizedBox(height: 0)

          ],
        ),
      ),
    );
  }

}