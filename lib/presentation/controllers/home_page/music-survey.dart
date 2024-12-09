import 'package:base_flutter_app/constants/colors.dart';
import 'package:base_flutter_app/constants/font_sizes.dart';
import 'package:base_flutter_app/constants/images.dart';
import 'package:base_flutter_app/presentation/controllers/home_page/home.dart';
import 'package:base_flutter_app/presentation/controllers/home_page/voice-identity.dart';
import 'package:base_flutter_app/presentation/widgets/common/layout_screen.dart';
import 'package:flutter/material.dart';

import '../../../constants/icons.dart';
import '../../../constants/radius.dart';

class SurveyMusicScreen extends StatefulWidget{

  const SurveyMusicScreen({Key? key}) : super(key: key);

  @override
  _SurveyMusicScreen createState() => _SurveyMusicScreen();
}

class _SurveyMusicScreen extends State<SurveyMusicScreen>{

  int ageSelected = 10;

  @override
  void initState(){
    super.initState();
  }

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<int> musicSelected = [];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return HomeScreen(
      widget: Container(
        decoration: const BoxDecoration(
            gradient:  LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF14171C),
                Color(0xFF292449),
              ],
            ),
          image: DecorationImage(image: AssetImage(ImagesCustom.imageBackground), fit: BoxFit.fill)
        ),
        height: height,
        child: Stack(
          children: [
            const Align(
              alignment: Alignment.bottomCenter,
              child: Image(image: AssetImage(ImagesCustom.imageLightGrow),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  Expanded(
                      flex: 1,
                      child:  Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child:  Text("Bạn thường hay nghe thể loại nhạc gì ?",
                                        style:  TextStyle(
                                            fontSize: FontSizes.s25,
                                            fontWeight: FontWeight.w500,
                                            color: ColorCustom.colorWhite
                                        )),
                                  ),
                                  SizedBox(height: 15),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("Chọn 3 thể loại yêu thích hoặc hay hát nhất",
                                        style: TextStyle(
                                            fontSize: FontSizes.s12,
                                            fontWeight: FontWeight.normal,
                                            color: ColorCustom.colorWhite
                                        )),
                                  ),
                                ],
                              )
                          ),
                        ],
                      )
                  ),

                  Expanded(
                    flex: 5,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if(musicSelected.contains(1)){
                                        musicSelected.remove(1);
                                      }else{
                                        musicSelected.add(1);
                                      }
                                    });
                                  },
                                  child: Container(
                                    height: height * 0.16,
                                    padding: const EdgeInsets.only(top: 15, left: 15,),
                                    decoration:  BoxDecoration(
                                        image: musicSelected.contains(1) ? const DecorationImage(
                                            image: AssetImage(ImagesCustom.imageBackgroundSelected),
                                            fit: BoxFit.fill
                                        ) : const DecorationImage(
                                            image: AssetImage(ImagesCustom.imageBackgroundUnSelected),
                                            fit: BoxFit.fill
                                        )
                                    ),
                                    child: Center(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            width: 50,
                                            height:50,
                                            child: Container(
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: ColorCustom.doveGrayColor.withOpacity(0.4),
                                                border: Border.all(
                                                  color: Colors.grey.withOpacity(0.1),
                                                  width: 0,
                                                ),
                                                  image: musicSelected.contains(1) ?  const DecorationImage(
                                                      image: AssetImage(IconCustom.iconSelectedBackground)
                                                  ) : null
                                              ),
                                              child: Center(
                                                child:
                                                Image.asset( musicSelected.contains(1) ? IconCustom.iconSelected : IconCustom.iconSelectAdd),
                                              ),
                                            ),
                                          ),
                                          Row(
                                            children: const [
                                              Expanded(
                                                  child: Padding(
                                                      padding: EdgeInsets.only(top: 15),
                                                      child: Text("TV & Phim ảnh", style: TextStyle(color: ColorCustom.colorWhite, fontSize: FontSizes.s16, fontWeight: FontWeight.w500),)))
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if(musicSelected.contains(2)){
                                        musicSelected.remove(2);
                                      }else{
                                        musicSelected.add(2);
                                      }
                                    });
                                  },
                                  child: Container(
                                    height: height * 0.16,
                                    padding: const EdgeInsets.only(top: 15, left: 15,),
                                    decoration:  BoxDecoration(
                                      image: musicSelected.contains(2) ? const DecorationImage(
                                        image: AssetImage(ImagesCustom.imageBackgroundSelected),
                                        fit: BoxFit.fill
                                      ) : const DecorationImage(
                                          image: AssetImage(ImagesCustom.imageBackgroundUnSelected),
                                          fit: BoxFit.fill
                                      )
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          width: 50,
                                          height: 50,
                                          child: Container(
                                            width: 50,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: ColorCustom.doveGrayColor.withOpacity(0.4),
                                              border: Border.all(
                                                color: Colors.grey.withOpacity(0.1),
                                                width: 0,
                                              ),
                                              image: musicSelected.contains(2) ?  const DecorationImage(
                                                image: AssetImage(IconCustom.iconSelectedBackground)
                                              ) : null
                                            ),
                                            child: Center(
                                              child:
                                              Image.asset( musicSelected.contains(2) ? IconCustom.iconSelected : IconCustom.iconSelectAdd),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: const [
                                            Expanded(
                                                child: Padding(
                                                    padding: EdgeInsets.only(top: 15),
                                                    child: Text("Pop", style: TextStyle(color: ColorCustom.colorWhite, fontSize: FontSizes.s16, fontWeight: FontWeight.w500),)))
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if(musicSelected.contains(3)){
                                        musicSelected.remove(3);
                                      }else{
                                        musicSelected.add(3);
                                      }
                                    });
                                  },
                                  child: Container(
                                    height: height * 0.16,
                                    padding: const EdgeInsets.only(top: 15, left: 15,),
                                    decoration:  BoxDecoration(
                                        image: musicSelected.contains(3) ? const DecorationImage(
                                            image: AssetImage(ImagesCustom.imageBackgroundSelected),
                                            fit: BoxFit.fill
                                        ) : const DecorationImage(
                                            image: AssetImage(ImagesCustom.imageBackgroundUnSelected),
                                            fit: BoxFit.fill
                                        )
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          width: 50,
                                          height: 50,
                                          child: Container(
                                            width: 50,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: ColorCustom.doveGrayColor.withOpacity(0.4),
                                              border: Border.all(
                                                color: Colors.grey.withOpacity(0.1),
                                                width: 0,
                                              ),
                                                image: musicSelected.contains(3) ?  const DecorationImage(
                                                    image: AssetImage(IconCustom.iconSelectedBackground)
                                                ) : null
                                            ),
                                            child: Center(
                                              child: Image.asset( musicSelected.contains(3) ? IconCustom.iconSelected : IconCustom.iconSelectAdd),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: const [
                                            Expanded(
                                                child: Padding(
                                                    padding: EdgeInsets.only(top: 15),
                                                    child: Text("Hip Hop & Rap", style: TextStyle(color: ColorCustom.colorWhite, fontSize: FontSizes.s16, fontWeight: FontWeight.w500),)))
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if(musicSelected.contains(4)){
                                        musicSelected.remove(4);
                                      }else{
                                        musicSelected.add(4);
                                      }
                                    });
                                  },
                                  child: Container(
                                    height: height * 0.16,
                                    padding: const EdgeInsets.only(top: 15, left: 15,),
                                    decoration:  BoxDecoration(
                                        image: musicSelected.contains(4) ? const DecorationImage(
                                            image: AssetImage(ImagesCustom.imageBackgroundSelected),
                                            fit: BoxFit.fill
                                        ) : const DecorationImage(
                                            image: AssetImage(ImagesCustom.imageBackgroundUnSelected),
                                            fit: BoxFit.fill
                                        )
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          width: 50,
                                          height: 50,
                                          child: Container(
                                            width: 50,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: ColorCustom.doveGrayColor.withOpacity(0.4),
                                              border: Border.all(
                                                color: Colors.grey.withOpacity(0.1),
                                                width: 0,
                                              ),
                                                image: musicSelected.contains(4) ?  const DecorationImage(
                                                    image: AssetImage(IconCustom.iconSelectedBackground)
                                                ) : null
                                            ),
                                            child: Center(
                                              child:
                                              Image.asset( musicSelected.contains(4) ? IconCustom.iconSelected : IconCustom.iconSelectAdd),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: const [
                                            Expanded(
                                                child: Padding(
                                                    padding: EdgeInsets.only(top: 15),
                                                    child: Text("Bolero", style: TextStyle(color: ColorCustom.colorWhite, fontSize: FontSizes.s16, fontWeight: FontWeight.w500),)))
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if(musicSelected.contains(5)){
                                        musicSelected.remove(5);
                                      }else{
                                        musicSelected.add(5);
                                      }
                                    });
                                  },
                                  child: Container(
                                    height: height * 0.16,
                                    padding: const EdgeInsets.only(top: 15, left: 15,),
                                    decoration:  BoxDecoration(
                                        image: musicSelected.contains(5) ? const DecorationImage(
                                            image: AssetImage(ImagesCustom.imageBackgroundSelected),
                                            fit: BoxFit.fill
                                        ) : const DecorationImage(
                                            image: AssetImage(ImagesCustom.imageBackgroundUnSelected),
                                            fit: BoxFit.fill
                                        )
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          width: 50,
                                          height: 50,
                                          child: Container(
                                            width: 50,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: ColorCustom.doveGrayColor.withOpacity(0.4),
                                              border: Border.all(
                                                color: Colors.grey.withOpacity(0.1),
                                                width: 0,
                                              ),
                                                image: musicSelected.contains(5) ?  const DecorationImage(
                                                    image: AssetImage(IconCustom.iconSelectedBackground)
                                                ) : null
                                            ),
                                            child: Center(
                                              child: Image.asset(musicSelected.contains(5) ? IconCustom.iconSelected : IconCustom.iconSelectAdd),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: const [
                                            Expanded(
                                                child: Padding(
                                                    padding: EdgeInsets.only(top: 15),
                                                    child: Text("R&B & Jazz", style: TextStyle(color: ColorCustom.colorWhite, fontSize: FontSizes.s16, fontWeight: FontWeight.w500),)))
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if(musicSelected.contains(6)){
                                        musicSelected.remove(6);
                                      }else{
                                        musicSelected.add(6);
                                      }
                                    });
                                  },
                                  child: Container(
                                    height: height * 0.16,
                                    padding: const EdgeInsets.only(top: 15, left: 15,),
                                    decoration:  BoxDecoration(
                                        image: musicSelected.contains(6) ? const DecorationImage(
                                            image: AssetImage(ImagesCustom.imageBackgroundSelected),
                                            fit: BoxFit.fill
                                        ) : const DecorationImage(
                                            image: AssetImage(ImagesCustom.imageBackgroundUnSelected),
                                            fit: BoxFit.fill
                                        )
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          width: 50,
                                          height: 50,
                                          child: Container(
                                            width: 50,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: ColorCustom.doveGrayColor.withOpacity(0.4),
                                              border: Border.all(
                                                color: Colors.grey.withOpacity(0.1),
                                                width: 0,
                                              ),
                                                image: musicSelected.contains(6) ?  const DecorationImage(
                                                    image: AssetImage(IconCustom.iconSelectedBackground)
                                                ) : null
                                            ),
                                            child: Center(
                                              child:
                                              Image.asset( musicSelected.contains(6) ? IconCustom.iconSelected : IconCustom.iconSelectAdd),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: const [
                                            Expanded(
                                                child: Padding(
                                                    padding: EdgeInsets.only(top: 15),
                                                    child: Text("Ballad & Acoustic", style: TextStyle(color: ColorCustom.colorWhite, fontSize: FontSizes.s16, fontWeight: FontWeight.w500),)))
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if(musicSelected.contains(7)){
                                        musicSelected.remove(7);
                                      }else{
                                        musicSelected.add(7);
                                      }
                                    });
                                  },
                                  child: Container(
                                    height: height * 0.16,
                                    padding: const EdgeInsets.only(top: 15, left: 15,),
                                    decoration:  BoxDecoration(
                                        image: musicSelected.contains(7) ? const DecorationImage(
                                            image: AssetImage(ImagesCustom.imageBackgroundSelected),
                                            fit: BoxFit.fill
                                        ) : const DecorationImage(
                                            image: AssetImage(ImagesCustom.imageBackgroundUnSelected),
                                            fit: BoxFit.fill
                                        )
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          width: 50,
                                          height: 50,
                                          child: Container(
                                            width: 50,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: ColorCustom.doveGrayColor.withOpacity(0.4),
                                              border: Border.all(
                                                color: Colors.grey.withOpacity(0.1),
                                                width: 0,
                                              ),
                                                image: musicSelected.contains(7) ?  const DecorationImage(
                                                    image: AssetImage(IconCustom.iconSelectedBackground)
                                                ) : null
                                            ),
                                            child: Center(
                                              child: Image.asset(musicSelected.contains(7) ? IconCustom.iconSelected : IconCustom.iconSelectAdd),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: const [
                                            Expanded(
                                                child: Padding(
                                                    padding: EdgeInsets.only(top: 15),
                                                    child: Text("Nhạc điện tử", style: TextStyle(color: ColorCustom.colorWhite, fontSize: FontSizes.s16, fontWeight: FontWeight.w500),)))
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if(musicSelected.contains(8)){
                                        musicSelected.remove(8);
                                      }else{
                                        musicSelected.add(8);
                                      }
                                    });
                                  },
                                  child: Container(
                                    height: height * 0.16,
                                    padding: const EdgeInsets.only(top: 15, left: 15,),
                                    decoration:  BoxDecoration(
                                        image: musicSelected.contains(8) ? const DecorationImage(
                                            image: AssetImage(ImagesCustom.imageBackgroundSelected),
                                            fit: BoxFit.fill
                                        ) : const DecorationImage(
                                            image: AssetImage(ImagesCustom.imageBackgroundUnSelected),
                                            fit: BoxFit.fill
                                        )
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          width: 50,
                                          height: 50,
                                          child: Container(
                                            width: 50,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: ColorCustom.doveGrayColor.withOpacity(0.4),
                                              border: Border.all(
                                                color: Colors.grey.withOpacity(0.1),
                                                width: 0,
                                              ),
                                                image: musicSelected.contains(8) ?  const DecorationImage(
                                                    image: AssetImage(IconCustom.iconSelectedBackground)
                                                ) : null
                                            ),
                                            child: Center(
                                              child:
                                              Image.asset(musicSelected.contains(8) ? IconCustom.iconSelected :  IconCustom.iconSelectAdd),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: const [
                                            Expanded(
                                                child: Padding(
                                                    padding: EdgeInsets.only(top: 15),
                                                    child: Text("Cổ điển", style: TextStyle(color: ColorCustom.colorWhite, fontSize: FontSizes.s16, fontWeight: FontWeight.w500),)))
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          flex: 3,
                          child: Container(
                            height: width * 0.05,
                            decoration: BoxDecoration(
                                border: Border.all(color: ColorCustom.doveGrayColor, width: 1),
                                borderRadius: const BorderRadius.all(Radius.circular(15))
                            ),
                            padding: const EdgeInsets.all(4),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: Container(
                                    width: height * 0.2,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(15)),
                                      color: ColorCustom.colorWhite,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    width: height * 0.2,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: ColorCustom.doveGrayColor,
                                    ),
                                  ),
                                ),

                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    width: height * 0.2,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: ColorCustom.doveGrayColor,
                                    ),
                                  ),
                                )

                              ],
                            ),
                          )
                      ),
                      const SizedBox(width: 25),
                      Expanded(
                        flex: 4,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const VoiceIdentityScreen()));
                          },
                          child: Container(
                            height: width * 0.15,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(
                                        RadiusCustom.radiusCardItem)),
                                gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xFF7624F9),
                                    Color(0xFF9A63F1),
                                  ],
                                ),
                                image: const DecorationImage(
                                    image: AssetImage(ImagesCustom.imageButtonContinue),
                                    fit: BoxFit.fill
                                )
                            ),
                            // child: Row(
                            //   children: [
                            //     Expanded(
                            //         flex: 3,
                            //         child: Row(
                            //           mainAxisAlignment: MainAxisAlignment.center,
                            //           children: const [
                            //             Text("Tiếp tục", style: TextStyle(fontSize: FontSizes.s18, fontWeight: FontWeight.bold, color: ColorCustom.colorWhite),)
                            //           ],
                            //         )),
                            //     Expanded(
                            //         flex: 1,
                            //         child: Container(
                            //           decoration: const BoxDecoration(
                            //             shape: BoxShape.circle,
                            //           ),
                            //           width: 50,
                            //           height: 50,
                            //           child: Container(
                            //             width: 50,
                            //             height: 50,
                            //             decoration: BoxDecoration(
                            //               shape: BoxShape.circle,
                            //               color: Colors.black,
                            //               border: Border.all(
                            //                 color: Colors.grey.withOpacity(0.1),
                            //                 width: 0,
                            //               ),
                            //             ),
                            //             child: Center(
                            //               child:
                            //               Image.asset(IconCustom.iconArrowH, color: ColorCustom.colorWhite),
                            //             ),
                            //           ),
                            //         ))
                            //   ],
                            // ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}