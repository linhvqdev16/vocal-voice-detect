
import 'package:base_flutter_app/constants/font_sizes.dart';
import 'package:base_flutter_app/constants/images.dart';
import 'package:base_flutter_app/presentation/controllers/home_page/home.dart';
import 'package:base_flutter_app/presentation/controllers/home_page/voice-identity.dart';
import 'package:base_flutter_app/presentation/widgets/common/layout_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors.dart';
import '../../../constants/icons.dart';
import '../../../constants/radius.dart';

class ResultVoiceDetailScreen extends StatefulWidget{

  const ResultVoiceDetailScreen({Key? key}) : super(key: key);

  @override
  _ResultVoiceDetailScreen createState() => _ResultVoiceDetailScreen();
}

class _ResultVoiceDetailScreen extends State<ResultVoiceDetailScreen> {


  bool isClickButton = false;
  int step  = 0;
  @override
  void initState(){
    super.initState();
    if(step == 0){
      listSpeedTextCharacter = listSpeedText[0].split(''); // Split the text into individual characters
    }
  }


  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
  }


  late AnimationController _controller;
  late Animation<int> _animation;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double height =0;
  double width = 0;

  List<int> stepDone = [];
  bool isCompletedThisStep = false;


  List<String> listSpeedText = [
    'Hình bóng ai đó nhẹ nhàng vụt qua nơi đây - Quyến rũ ngây ngất loạn nhịp làm tim mê say',
    'Hummmmmmmmmm',
    'Yee-yeahhh',
    'Hey! Hey! Hey!'
  ];

  List<String> listSpeedTextCharacter = [];

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    // final counter = Provider.of<Counter>(context);
    // counter.setState(listSpeedTextCharacter, _animation);
    return Scaffold(
      backgroundColor: ColorCustom.pageModelBackgroundColor,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Xác định âm vực'),
        flexibleSpace: Container(
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
        ),
        leading: GestureDetector(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.arrow_back)),
        actions: const [
          // Padding(padding: EdgeInsets.only(right: 10), child: Icon(Icons.info),)
        ],
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.only(bottom: 15),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              flex: 5,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20,),
                   LayoutScreen(
                     child: Column(
                       children: [
                         SizedBox(
                           height: height * 0.32,
                           child: Stack(
                             children: [
                               Container(
                                 margin: EdgeInsets.only(top: 60),
                                 child: Row(
                                   children: [
                                     Expanded(
                                       child: GestureDetector(
                                         onTap: () {
                                           setState(() {
                                           });
                                         },
                                         child: Container(
                                           height: height * 0.24,
                                           padding: const EdgeInsets.only(top: 55),
                                           decoration: const BoxDecoration(
                                             borderRadius:  BorderRadius.all(
                                                 Radius.circular(
                                                     RadiusCustom.radiusHeader)),
                                             image: DecorationImage(
                                               image: AssetImage(ImagesCustom.imageBackgroundResult),
                                               fit: BoxFit.fill
                                             )
                                           ),
                                           child: Column(
                                             crossAxisAlignment: CrossAxisAlignment.center,
                                             children: [
                                               Row(
                                                 children: const [
                                                   Expanded(
                                                       child: Padding(
                                                           padding: EdgeInsets.only(top: 15),
                                                           child: Text("Âm vực của bạn là A3-D06 ", style: TextStyle(color: ColorCustom.colorWhite, fontSize: FontSizes.s14, fontWeight: FontWeight.w300), textAlign: TextAlign.center,)))
                                                 ],
                                               ),
                                               Row(
                                                 children: const [
                                                   Expanded(
                                                       child: Padding(
                                                           padding: EdgeInsets.only(top: 15),
                                                           child: Text("Baritone", style: TextStyle(color: ColorCustom.colorWhite, fontSize: FontSizes.s26, fontWeight: FontWeight.w500), textAlign: TextAlign.center)))
                                                 ],
                                               )
                                             ],
                                           ),
                                         ),
                                       ),
                                     ),
                                   ],
                                 ),
                               ),
                               Positioned(
                                 top: -0, // Align the image with the top edge of the container
                                 left: 0, // Align the image to the left edge of the container
                                 right: 0,
                                 child: Stack(
                                   alignment: Alignment.center,
                                   children: [
                                     // Container(
                                     //   decoration:  BoxDecoration(
                                     //       shape: BoxShape.circle,
                                     //       border: Border.all(color: Color(0xFF7827F9).withOpacity(0.4), width: 0.5)
                                     //   ),
                                     //   width: 120,
                                     //   height: 120,
                                     // ),


                                     Container(
                                       decoration: const BoxDecoration(
                                         shape: BoxShape.circle,
                                         image: DecorationImage(image: AssetImage(ImagesCustom.imageSpeedText))
                                       ),
                                       width: 110,
                                       height: 110,
                                     ),
                                   ],

                                 ),
                               ),
                             ],
                           ),
                         ),
                         const SizedBox(height: 15),

                         Row(
                           children: [
                             Expanded(child: Text("Nghệ sĩ tương tự", style: TextStyle(color: ColorCustom.colorWhite, fontSize: FontSizes.s18, fontWeight: FontWeight.w500),))
                           ],
                         ),
                         SizedBox(height: 5),
                         Row(
                           children: const [
                             Expanded(
                               flex: 5,
                               child: Text("Các nghệ sĩ có âm vực giọng hát tương tự giống bạn.", style: TextStyle(fontSize: FontSizes.s13,
                                   fontWeight: FontWeight.w300
                                   , color: ColorCustom.colorWhite,height: 2),),
                             )
                           ],
                         ),
                         const SizedBox(height: 15),
                         ListView.builder(
                           shrinkWrap: true,
                           physics:  NeverScrollableScrollPhysics(),
                           itemCount: 5,  // Number of items in the list
                           itemBuilder: (context, index) {
                             return Container(
                               margin: EdgeInsets.symmetric(vertical: 10),
                               padding: EdgeInsets.symmetric(vertical: 10),
                               decoration: BoxDecoration(
                                   border: index == 4 ? null :  Border(
                                     bottom: BorderSide(width: 0, color: ColorCustom.anthensGray),
                                   )
                               ),
                               child: Row(
                                 children: [
                                   Expanded(
                                     flex: 1,
                                     child: Container(
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
                                         ),
                                         child: Center(
                                           child:
                                           Image.asset(IconCustom.iconMale),
                                         ),
                                       ),
                                     ),
                                   ),
                                   Expanded(
                                       flex: 2,
                                       child: Column(children: [
                                         Row(
                                           children: [
                                             Expanded(child: Text("Sơn Tùng", style: TextStyle(color: ColorCustom.colorWhite, fontSize: FontSizes.s18, fontWeight: FontWeight.w500),))
                                           ],
                                         ),
                                         SizedBox(height: 5),
                                         Row(
                                           children: const [
                                             Expanded(
                                               flex: 5,
                                               child: Text("Nghệ sĩ.", style: TextStyle(fontSize: FontSizes.s13,
                                                   fontWeight: FontWeight.w300
                                                   , color: ColorCustom.colorWhite),),
                                             )
                                           ],
                                         ),
                                       ],)),
                                   Expanded(child: Container(
                                     height: width * 0.1,
                                     padding: const EdgeInsets.symmetric(
                                         horizontal: 5, vertical: 5),
                                     decoration: BoxDecoration(
                                       border: Border.all(color: Colors.grey),
                                       borderRadius: const BorderRadius.all(
                                           Radius.circular(
                                               RadiusCustom.radiusCardItem)),
                                     ),
                                     child: Row(
                                       children: [
                                         Expanded(
                                             flex: 3,
                                             child: Row(
                                               mainAxisAlignment: MainAxisAlignment.center,
                                               children:  [
                                                 Text('Theo dõi', style: TextStyle(fontSize: FontSizes.s12, fontWeight: FontWeight.w500, color: ColorCustom.colorWhite),)
                                               ],
                                             )),
                                       ],
                                     ),
                                   ),)
                                 ],
                               ),
                             );
                           },
                         ),

                         const SizedBox(height: 15),

                         Row(
                           children: [
                             Expanded(child: Text("Bạn có thể hát thử", style: TextStyle(color: ColorCustom.colorWhite, fontSize: FontSizes.s18, fontWeight: FontWeight.w500),))
                           ],
                         ),
                         SizedBox(height: 5),
                         Row(
                           children: const [
                             Expanded(
                               flex: 5,
                               child: Text("Các bài hát được để xuất phù hợp với quãng giọng và sở thích âm nhạc của bạn.", style: TextStyle(fontSize: FontSizes.s13,
                                   fontWeight: FontWeight.w300
                                   , color: ColorCustom.colorWhite, height: 1.5),),
                             )
                           ],
                         ),

                         const SizedBox(height: 15),
                         ListView.builder(
                           shrinkWrap: true,
                           physics:  NeverScrollableScrollPhysics(),
                           itemCount: 5,  // Number of items in the list
                           itemBuilder: (context, index) {
                             return Container(
                               margin: EdgeInsets.symmetric(vertical: 10),
                               padding: EdgeInsets.symmetric(vertical: 10),
                               decoration: BoxDecoration(
                                   border: index == 4 ? null :  Border(
                                     bottom: BorderSide(width: 0, color: ColorCustom.anthensGray),
                                   )
                               ),
                               child: Row(
                                 children: [
                                   Expanded(
                                     flex: 1,
                                     child: Container(
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
                                         ),
                                         child: Center(
                                           child:
                                           Image.asset(IconCustom.iconMale),
                                         ),
                                       ),
                                     ),
                                   ),
                                   Expanded(
                                       flex: 2,
                                       child: Column(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         children: [
                                           Container(
                                             height: width * 0.07,
                                             padding: const EdgeInsets.symmetric(
                                                 horizontal: 15, vertical: 3),
                                             decoration: BoxDecoration(
                                               border: Border.all(color: Colors.grey),
                                               borderRadius: const BorderRadius.all(
                                                   Radius.circular(
                                                       20)),
                                             ),
                                             child:  Text('Dễ', style: TextStyle(fontSize: FontSizes.s16, fontWeight: FontWeight.w300, color: ColorCustom.colorWhite),),
                                           ),
                                           SizedBox(height: 3,),
                                           Row(
                                             children: [
                                               Expanded(child: Text("Bầu trời mới", style: TextStyle(color: ColorCustom.colorWhite, fontSize: FontSizes.s18, fontWeight: FontWeight.w500),))
                                             ],
                                           ),
                                           SizedBox(height: 5),
                                           Row(
                                             children: const [
                                               Expanded(
                                                 flex: 5,
                                                 child: Text("Nghệ sĩ.", style: TextStyle(fontSize: FontSizes.s13,
                                                     fontWeight: FontWeight.w300
                                                     , color: ColorCustom.colorWhite),),
                                               )
                                             ],
                                           ),
                                         ],)),
                                   Expanded(child: Row(
                                     mainAxisAlignment: MainAxisAlignment.end,
                                     children: [
                                       Icon(Icons.more_vert, color: ColorCustom.colorWhite,)
                                     ],
                                   ))
                                 ],
                               ),
                             );
                           },
                         ),
                       ],
                     ),
                   ),

                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.only(
                           topRight: Radius.circular(RadiusCustom.radiusCardItem),
                           topLeft: Radius.circular(RadiusCustom.radiusCardItem),),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const IdentityVoiceDetailScreen()));
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
                                      child: Text("Hoàn thành", style: TextStyle(fontSize: FontSizes.s18, fontWeight: FontWeight.bold, color: ColorCustom.colorWhite),),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const IdentityVoiceDetailScreen()));
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
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 3,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: const [
                                                Text("Thử lại", style: TextStyle(fontSize: FontSizes.s18, fontWeight: FontWeight.bold, color: ColorCustom.colorWhite),)
                                              ],
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}