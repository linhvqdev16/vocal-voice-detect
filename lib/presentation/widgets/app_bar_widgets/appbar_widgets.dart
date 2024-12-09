import 'package:base_flutter_app/constants/colors.dart';
import 'package:base_flutter_app/constants/font_sizes.dart';
import 'package:base_flutter_app/constants/icons.dart';
import 'package:base_flutter_app/constants/images.dart';
import 'package:base_flutter_app/constants/radius.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatefulWidget {
  Function()? buttonHandle;

  Function()? buttonHandlerFilter;

  String? labelAppBar;

  String? contentAppBar;

  bool? isRowAppBar;

  bool? isShowIconSort;

  Widget? widget;

  String? dateStr;

  String? numberPeople;

  String? typeFlight;

  AppBarWidget(
      {Key? key,
      this.buttonHandle,
      this.labelAppBar,
      this.contentAppBar,
      this.isRowAppBar,
      this.isShowIconSort,
      this.buttonHandlerFilter,
      this.widget,
      this.dateStr,
      this.typeFlight,
      this.numberPeople})
      : super(key: key);

  @override
  _AppBarWidget createState() => _AppBarWidget();
}

class _AppBarWidget extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return AppBar(
      backgroundColor: ColorCustom.pageModelBackgroundColor,
      elevation: 0,
      leading: Container(),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(RadiusCustom.radiusHeader)),
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [ColorCustom.mediumPurple, ColorCustom.indigoPurple]),
          image: DecorationImage(
              image: AssetImage(ImagesCustom.ovalImageHeader),
              fit: BoxFit.fill),
        ),
        child: (widget.isRowAppBar ?? false)
            ? Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(top: height * 0.1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: Image.asset(IconCustom.iconBack),
                              onPressed: widget.buttonHandle,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: (widget.widget == null)
                                  ? Text(widget.labelAppBar ?? "",
                                      style: const TextStyle(
                                          fontSize: FontSizes.s22,
                                          fontWeight: FontWeight.bold,
                                          color: ColorCustom.colorWhite))
                                  : widget.widget,
                            ),
                            (widget.isShowIconSort ?? false)
                                ? Container()
                                : IconButton(
                                    icon: Image.asset(IconCustom.iconSort),
                                    onPressed: widget.buttonHandlerFilter,
                                  ),
                          ],
                        )),

                    (widget.dateStr == null) ? SizedBox(height: 0) : Padding(
                        padding: EdgeInsets.only(bottom: 13),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(widget.dateStr ?? "",
                                  style: const TextStyle(
                                      fontSize: FontSizes.s12,
                                      fontWeight: FontWeight.normal,
                                      color: ColorCustom.colorWhite)),
                            ),

                               Padding(
                                   padding: const EdgeInsets.symmetric(horizontal: 5),
                                   child: Image.asset(IconCustom.iconOval, color: ColorCustom.colorWhite,)),

                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(widget.numberPeople ?? "",
                                  style: const TextStyle(
                                      fontSize: FontSizes.s12,
                                      fontWeight: FontWeight.normal,
                                      color: ColorCustom.colorWhite)),
                            ),

                            Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                child: Image.asset(IconCustom.iconOval, color: ColorCustom.colorWhite,)),

                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(widget.typeFlight ?? "",
                                  style: const TextStyle(
                                      fontSize: FontSizes.s12,
                                      fontWeight: FontWeight.normal,
                                      color: ColorCustom.colorWhite)),
                            ),

                            Container(
                                height: 15,
                                padding: const EdgeInsets.symmetric(horizontal: 3),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(4)),
                                  color: ColorCustom.colorWhite
                                ),
                                child: Align(child: Image.asset(IconCustom.iconSingleArrow, color: ColorCustom.indigoPurple,))),
                          ],
                        ))
                  ],
                ))
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                      padding: EdgeInsets.only(top: height * 0.13, left: 32),
                      child: IconButton(
                        icon: Image.asset(IconCustom.iconBack),
                        onPressed: widget.buttonHandle,
                      )),
                  Padding(
                      padding: EdgeInsets.only(bottom: 0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(widget.labelAppBar ?? "",
                            style: const TextStyle(
                                fontSize: FontSizes.s18,
                                fontWeight: FontWeight.bold,
                                color: ColorCustom.colorWhite)),
                      )),
                  Padding(
                      padding: EdgeInsets.only(bottom: 13),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(widget.contentAppBar ?? "",
                            style: const TextStyle(
                                fontSize: FontSizes.s12,
                                fontWeight: FontWeight.normal,
                                color: ColorCustom.colorWhite)),
                      ))
                ],
              ),
      ),
    );
  }
}
