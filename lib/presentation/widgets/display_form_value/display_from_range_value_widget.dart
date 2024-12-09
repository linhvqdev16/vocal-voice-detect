import 'package:base_flutter_app/constants/colors.dart';
import 'package:base_flutter_app/constants/font_sizes.dart';
import 'package:base_flutter_app/constants/radius.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class DisplayFormRangeValueWidget extends StatefulWidget {
  String? iconUrl;

  String? labelForm;

  String? valueForm;

  Function()? handlerClick;

  Color? backGroundStackColor;

  Function()? handlerIncreaseNumber;

  bool? isHasHandler;

  Color? iconColor;

  bool? isHalf;

  bool? isReverse;

  DisplayFormRangeValueWidget(
      {Key? key,
      this.iconUrl,
      this.labelForm,
      this.valueForm,
      this.handlerClick,
      this.backGroundStackColor,
      this.handlerIncreaseNumber,
      this.isHasHandler,
      this.iconColor,
      this.isHalf,
      this.isReverse})
      : super(key: key);

  @override
  _DisplayFormRangeValueWidget createState() => _DisplayFormRangeValueWidget();
}

class _DisplayFormRangeValueWidget extends State<DisplayFormRangeValueWidget> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: widget.handlerClick,
      child: Container(
        height: height * 0.11,
        decoration: const BoxDecoration(
            color: ColorCustom.colorWhite,
            borderRadius: BorderRadius.all(
                Radius.circular(RadiusCustom.radiusInputFormField))),
        margin: const EdgeInsets.only(top: 25),
        padding: EdgeInsets.only(left: (widget.isHalf ?? false) ? 0 : 25),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  width: (widget.isHalf ?? false) ? width * 0.055 : width * 0.11,
                  padding: const EdgeInsets.all(6),
                  margin: EdgeInsets.only(top: height * 0.025),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(
                          (widget.isHalf ?? false)
                              ? RadiusCustom.radiusInputFormField
                              : RadiusCustom.radiusImagePortrait)),
                      color: (widget.backGroundStackColor ??
                              ColorCustom.doveGrayColor)
                          .withOpacity(0.2)),
                  child: (widget.isReverse ?? false) ?  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(widget.iconUrl ?? "",
                          height: 20, color: widget.iconColor),
                      Container(
                        height: height * 0.035,
                        margin: const EdgeInsets.only(top: 2),
                        child: const DottedLine(
                          direction: Axis.vertical,
                          lineLength: double.infinity,
                          lineThickness: 1.0,
                          dashLength: 4.0,
                          dashColor: ColorCustom.indigoPurple,
                          dashRadius: 0.0,
                          dashGapLength: 4.0,
                          dashGapColor: Colors.white,
                          dashGapRadius: 0.0,
                        ),
                      )
                    ],
                  ) : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [


                      Container(
                        height: height * 0.035,
                        margin: const EdgeInsets.only(bottom: 2),
                        child: const DottedLine(
                          direction: Axis.vertical,
                          lineLength: double.infinity,
                          lineThickness: 1.0,
                          dashLength: 4.0,
                          dashColor: ColorCustom.indigoPurple,
                          dashRadius: 0.0,
                          dashGapLength: 4.0,
                          dashGapColor: Colors.white,
                          dashGapRadius: 0.0,
                        ),
                      ),

                      Image.asset(widget.iconUrl ?? "",
                          height: 20, color: widget.iconColor),
                    ],
                  ),
                )),
            const SizedBox(width: 25),
            Expanded(
                flex: (widget.isHasHandler ?? false) ? 2 : 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    widget.labelForm != null
                        ? Text(widget.labelForm ?? "",
                            style: const TextStyle(
                                fontSize: FontSizes.s12,
                                fontWeight: FontWeight.normal,
                                color: ColorCustom.doveGrayColor),
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.clip)
                        : const SizedBox(
                            height: 0,
                          ),
                    SizedBox(height: widget.labelForm != null ? 15 : 0),
                    Text(widget.valueForm ?? "",
                        style: const TextStyle(
                            fontSize: FontSizes.s14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.clip)
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
