
import 'package:base_flutter_app/constants/font_sizes.dart';
import 'package:base_flutter_app/constants/images.dart';
import 'package:base_flutter_app/presentation/controllers/home_page/home.dart';
import 'package:base_flutter_app/presentation/controllers/home_page/identity-voice-detail.dart';
import 'package:base_flutter_app/presentation/widgets/common/layout_screen.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/icons.dart';
import '../../../constants/radius.dart';

class VoiceIdentityScreen extends StatefulWidget{

  const VoiceIdentityScreen({Key? key}) : super(key: key);

  @override
  _VoiceIdentityScreen createState() => _VoiceIdentityScreen();
}

class _VoiceIdentityScreen extends State<VoiceIdentityScreen>{

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

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return HomeScreen(
      widget: Container(
        padding: const EdgeInsets.only(bottom: 10),
        decoration: const BoxDecoration(
            gradient:  LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF14171C),
                Color(0xFF292449),
              ],
            ),
          image: DecorationImage(
            image: AssetImage(ImagesCustom.imageBackgroundVoice),
              fit: BoxFit.cover
          )
        ),
        height: height,
        child: LayoutScreen(
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
                                  child:  Text("Xác định quãng giọng bằng giọng hát của bạn",
                                      style:  TextStyle(
                                          fontSize: FontSizes.s25,
                                          fontWeight: FontWeight.w500,
                                          color: ColorCustom.colorWhite
                                      )),
                                ),
                                SizedBox(height: 15),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Tìm ra ậm vực của bạn chỉ trong một vài bước",
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
                        Container(
                          // decoration: const BoxDecoration(
                          //   image: DecorationImage(
                          //     image: AssetImage(ImagesCustom.imageBackgroundVoice),
                          //     fit: BoxFit.fill
                          //   )
                          // ),
                          height: height * 0.68,
                          width: width,
                          child: Stack(
                            children: [
                              // Container(
                              //   height: height * 0.68,
                              //   width: width,
                              //   child: Image.asset(ImagesCustom.imageBackgroundVoice, fit: BoxFit.fill),
                              // ),
                              Padding(
                                padding: const EdgeInsets.only(
                                top: 20, left: 10, bottom: 10),
                               child: Image.asset(ImagesCustom.imageIdentityVoice),
                          )
                        ],
                          ),
                        ),
                        // const SizedBox(height: 15),
                        // Row(
                        //   crossAxisAlignment: CrossAxisAlignment.center,
                        //   children: [
                        //     Expanded(
                        //       child: GestureDetector(
                        //         onTap: () {
                        //           Navigator.of(context).push(MaterialPageRoute(builder: (context) => const IdentityVoiceDetailScreen()));
                        //         },
                        //         child: Container(
                        //           height: width * 0.15,
                        //           padding: const EdgeInsets.symmetric(
                        //               horizontal: 5, vertical: 5),
                        //           decoration: BoxDecoration(
                        //               border: Border.all(color: Colors.grey),
                        //               borderRadius: const BorderRadius.all(
                        //                   Radius.circular(
                        //                       RadiusCustom.radiusCardItem)),
                        //               // gradient: const LinearGradient(
                        //               //   begin: Alignment.topLeft,
                        //               //   end: Alignment.bottomCenter,
                        //               //   colors: [
                        //               //     Color(0xFF7624F9),
                        //               //     Color(0xFF9A63F1),
                        //               //   ],
                        //               // ),
                        //               image: const DecorationImage(
                        //                   image: AssetImage(ImagesCustom.imageVoiceIdentityBackground),
                        //                   fit: BoxFit.cover
                        //               )
                        //           ),
                        //           child: Row(
                        //             children: [
                        //               Expanded(
                        //                   flex: 3,
                        //                   child: Row(
                        //                     mainAxisAlignment: MainAxisAlignment.center,
                        //                     children: const [
                        //                       Text("Tìm quãng giọng bài hát", style: TextStyle(fontSize: FontSizes.s18, fontWeight: FontWeight.bold, color: ColorCustom.colorWhite),)
                        //                     ],
                        //                   )),
                        //             ],
                        //           ),
                        //         ),
                        //       ),
                        //     )
                        //   ],
                        // )
                      ],
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const IdentityVoiceDetailScreen()));
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
                              // gradient: const LinearGradient(
                              //   begin: Alignment.topLeft,
                              //   end: Alignment.bottomCenter,
                              //   colors: [
                              //     Color(0xFF7624F9),
                              //     Color(0xFF9A63F1),
                              //   ],
                              // ),
                              image: const DecorationImage(
                                  image: AssetImage(ImagesCustom.imageVoiceIdentityBackground),
                                  fit: BoxFit.cover
                              )
                          ),
                          child: const  Center(
                            child: Text("Tìm quãng giọng bài hát", style: TextStyle(fontSize: FontSizes.s18, fontWeight: FontWeight.bold, color: ColorCustom.colorWhite),),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            )
        ),
      ),
    );
  }

}