import 'package:base_flutter_app/constants/colors.dart';
import 'package:base_flutter_app/constants/font_sizes.dart';
import 'package:base_flutter_app/constants/icons.dart';
import 'package:base_flutter_app/constants/images.dart';
import 'package:base_flutter_app/constants/radius.dart';
import 'package:flutter/material.dart';

class HomePageAppBarWidget extends StatefulWidget{

  Function()? buttonHandle;

  String? labelAppBar;

  String? contentAppBar;

  HomePageAppBarWidget({Key? key, this.buttonHandle, this.labelAppBar, this.contentAppBar}) : super(key: key);

  @override
  _HomePageAppBarWidget createState() => _HomePageAppBarWidget();
}

class _HomePageAppBarWidget extends State<HomePageAppBarWidget>{

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return AppBar(
      backgroundColor: ColorCustom.pageModelBackgroundColor,
      elevation: 0,
      leading: Container(),
      flexibleSpace:  Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(RadiusCustom.radiusHeader)),
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                ColorCustom.mediumPurple,
                ColorCustom.indigoPurple
              ]
          ),
          // image: DecorationImage(image: AssetImage(ImagesCustom.ovalImageHeader), fit: BoxFit.fill),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(widget.labelAppBar ?? "",
                            style: const TextStyle(
                                fontSize: FontSizes.s25,
                                fontWeight: FontWeight.w500,
                                color: ColorCustom.colorWhite
                            )),
                      ),
                      const SizedBox(height: 15),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(widget.contentAppBar ?? "",
                            style: const TextStyle(
                                fontSize: FontSizes.s12,
                                fontWeight: FontWeight.normal,
                                color: ColorCustom.colorWhite
                            )),
                      ),
                    ],
                  )
                )
            ),

            // Container(
            //   margin: const EdgeInsets.only(right: 25),
            //   child: Align(
            //     alignment: Alignment.centerRight,
            //     child: Row(
            //       children: [
            //         Stack(
            //           children: [
            //
            //             IconButton(
            //                 onPressed: (){
            //
            //                 },
            //                 icon: Image.asset(IconCustom.iconNotification, height: 35,)),
            //
            //             Positioned(
            //               right: 13, top: 12,
            //                 child:  ClipOval(
            //                   child: Material(
            //                     color: Colors.red,
            //                     child: Container(
            //                       height: 9,
            //                       width: 9,
            //                     ),
            //                   ),
            //                 ))
            //
            //
            //           ],
            //         ),
            //         const SizedBox(width: 15,),
            //         Container(
            //           height: 45,
            //           width: 45,
            //           decoration: const BoxDecoration(
            //               borderRadius: BorderRadius.all(Radius.circular(RadiusCustom.radiusImagePortrait)),
            //               image: DecorationImage(image: AssetImage(ImagesCustom.portraitImageHeader))
            //           ),
            //         )
            //       ],
            //     ),
            //   ),
            // )

            // Padding(padding: EdgeInsets.only(bottom: 13),
            //     child: Align(
            //       alignment: Alignment.bottomCenter,
            //       child: Text(widget.contentAppBar ?? "",
            //           style: const TextStyle(
            //               fontSize: FontSizes.s12,
            //               fontWeight: FontWeight.normal,
            //               color: ColorCustom.colorWhite
            //           )),
            //     )
            //
            // )
          ],
        ),
      ),

    );
  }

}