import 'package:base_flutter_app/application/models/catgory_model.dart';
import 'package:base_flutter_app/constants/colors.dart';
import 'package:base_flutter_app/constants/font_sizes.dart';
import 'package:base_flutter_app/constants/images.dart';
import 'package:base_flutter_app/presentation/controllers/home_page/home.dart';
import 'package:base_flutter_app/presentation/controllers/home_page/survay-age.dart';
import 'package:base_flutter_app/presentation/widgets/common/layout_screen.dart';
import 'package:flutter/material.dart';

import '../../../constants/icons.dart';
import '../../../constants/radius.dart';

class HomePageScreen extends StatefulWidget{

  const HomePageScreen({Key? key}) : super(key: key);

  @override
  _HomePageScreen createState() => _HomePageScreen();
}

class _HomePageScreen extends State<HomePageScreen>{

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
  }

  int isSelected = -1;

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
            )
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
                                    child:  Text("Giọng hát tốt nhất của bạn là gì ?",
                                        style:  TextStyle(
                                            fontSize: FontSizes.s25,
                                            fontWeight: FontWeight.w500,
                                            color: ColorCustom.colorWhite
                                        )),
                                  ),
                                  SizedBox(height: 15),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("Hãy đưa ra giọng hát tốt nhất của bạn lúc bạn thể hiện",
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
                      flex: 4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [

                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Designed by: LinhVQ",
                                style: TextStyle(
                                    fontSize: FontSizes.s22,
                                    fontWeight: FontWeight.normal,
                                    color: ColorCustom.colorWhite
                                )),
                          ),

                          SizedBox(height: 50,),

                          Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isSelected = 1;
                                    });
                                  },
                                  child: Container(
                                    height: height * 0.16,
                                    padding: const EdgeInsets.only(top: 15, left: 15,),
                                    decoration: BoxDecoration(
                                        image: isSelected == 1 ? const DecorationImage(
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
                                          height:50,
                                          child: Container(
                                            width: 50,
                                            height: 50,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: isSelected != 1 ?  ColorCustom.doveGrayColor.withOpacity(0.4) : null,
                                                border: Border.all(
                                                  color: Colors.grey.withOpacity(0.1),
                                                  width: 0,
                                                ),
                                                image: isSelected == 1 ?  const DecorationImage(
                                                    image: AssetImage(IconCustom.iconSelectedBackground)
                                                ) : null
                                            ),
                                            child: Center(
                                              child:
                                              Image.asset(IconCustom.iconMale),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: const [
                                            Expanded(
                                                child: Padding(
                                                    padding: EdgeInsets.only(top: 15),
                                                    child: Text("Giọng nam", style: TextStyle(color: ColorCustom.colorWhite, fontSize: FontSizes.s18, fontWeight: FontWeight.w500),)))
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
                                      isSelected = 2;
                                    });
                                  },
                                  child: Container(
                                    height: height * 0.16,
                                    padding: const EdgeInsets.only(top: 15, left: 15,),
                                    decoration: BoxDecoration(
                                        image: isSelected == 2 ? const DecorationImage(
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
                                          height:50,
                                          child: Container(
                                            width: 50,
                                            height: 50,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: isSelected != 2 ?  ColorCustom.doveGrayColor.withOpacity(0.4) : null,
                                                border: Border.all(
                                                  color: Colors.grey.withOpacity(0.1),
                                                  width: 0,
                                                ),
                                                image: isSelected == 2 ?  const DecorationImage(
                                                    image: AssetImage(IconCustom.iconSelectedBackground)
                                                ) : null
                                            ),
                                            child: Center(
                                              child:
                                              Image.asset(IconCustom.iconFemale),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: const [
                                            Expanded(
                                                child: Padding(
                                                    padding: EdgeInsets.only(top: 15),
                                                    child: Text("Giọng nữ", style: TextStyle(color: ColorCustom.colorWhite, fontSize: FontSizes.s18, fontWeight: FontWeight.w500),)))
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                  flex: 3,
                                  child: Container(
                                    height: width * 0.05,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: ColorCustom.doveGrayColor, width: 1),
                                        borderRadius: BorderRadius.all(Radius.circular(15))
                                    ),
                                    padding: const EdgeInsets.all(4),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 5,
                                          child: Container(
                                            width: width * 0.3,
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(Radius.circular(15)),
                                              color: ColorCustom.colorWhite,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            width: width * 0.3,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: ColorCustom.doveGrayColor,
                                            ),
                                          ),
                                        ),

                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            width: width * 0.3,
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
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SurveyAgeScreen()));
                                  },
                                  child: Container(
                                    height: width * 0.15,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 5),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(
                                                RadiusCustom.radiusHeader)),
                                        gradient: const LinearGradient(
                                            colors: [
                                              Color(0xFF7624F9),
                                              Color(0xFF9A63F1),
                                            ],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomCenter,
                                            transform: GradientRotation(3.14 /4)
                                        ),
                                        image: const DecorationImage(
                                            image: AssetImage(ImagesCustom.imageButtonContinue),
                                            fit: BoxFit.fill
                                        )
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      )),
                  const SizedBox(height: 10)
                ],
              ),
            )

          ],
        ),
      ),
    );
  }

}