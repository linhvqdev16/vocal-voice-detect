import 'package:base_flutter_app/constants/colors.dart';
import 'package:base_flutter_app/constants/font_sizes.dart';
import 'package:base_flutter_app/presentation/controllers/home_page/home.dart';
import 'package:base_flutter_app/presentation/controllers/home_page/music-survey.dart';
import 'package:base_flutter_app/presentation/widgets/common/layout_screen.dart';
import 'package:flutter/material.dart';

import '../../../constants/icons.dart';
import '../../../constants/images.dart';
import '../../../constants/radius.dart';

class SurveyAgeScreen extends StatefulWidget{

  const SurveyAgeScreen({Key? key}) : super(key: key);

  @override
  _SurveyAgeScreen createState() => _SurveyAgeScreen();
}

class _SurveyAgeScreen extends State<SurveyAgeScreen>{


  int ageSelected = -1;

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
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                  width: width,
                  child: const Image(image: AssetImage(ImagesCustom.imageLightGrow), fit: BoxFit.cover,)),
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
                              children: const [
                                Expanded(
                                  child:  Text("Năm nay bạn bao nhiêu tuổi ?",
                                      style:  TextStyle(
                                        fontSize: FontSizes.s36,
                                        fontWeight: FontWeight.w500,
                                        color: ColorCustom.colorWhite,
                                      )),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Tuổi tác có thể ảnh hưởng đến quãng dọng",
                                      style: TextStyle(
                                          fontSize: FontSizes.s14,
                                          fontWeight: FontWeight.w400,
                                          color: ColorCustom.colorTextHeader
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
                  child: Container(
                    margin: EdgeInsets.only(top: width * 0.15),
                    child: ShaderMask(
                      shaderCallback: (Rect rect) {
                        return const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.grey, Colors.transparent, Colors.transparent, Colors.grey],
                          stops: [0.0, 0.1, 0.9, 1.0], // 10% purple, 80% transparent, 10% purple
                        ).createShader(rect);
                      },
                      blendMode: BlendMode.dstOut,
                      child: ListView.builder(
                        itemCount: 100,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  ageSelected = index;
                                });
                              },
                              child: Container(
                                height: width * 0.12,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 5),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(
                                            RadiusCustom.radiusImagePortrait)),
                                     image: ageSelected == index ?  const DecorationImage(
                                       image: AssetImage(ImagesCustom.imageBackgroundAge),
                                       fit: BoxFit.fill
                                     ) : null
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("${index}", style:  ageSelected == index ?  const TextStyle(fontSize: FontSizes.s18, fontWeight: FontWeight.bold, color: ColorCustom.colorWhite)
                                       :  TextStyle(fontSize: FontSizes.s18, fontWeight: FontWeight.bold, color: ColorCustom.colorWhite.withOpacity(0.5)),)
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),),
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
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SurveyMusicScreen()));
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
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10,)
              ],
            ),)
          ],
        ),
      ),
    );
  }

}