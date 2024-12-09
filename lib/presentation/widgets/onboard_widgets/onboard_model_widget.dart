import 'package:base_flutter_app/constants/colors.dart';
import 'package:base_flutter_app/constants/images.dart';
import 'package:base_flutter_app/presentation/widgets/buttons/evaluate_button_widget.dart';
import 'package:base_flutter_app/presentation/widgets/onboard_widgets/page_model_widgets.dart';
import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';


class OnBoardModelWidget extends StatefulWidget{

  const OnBoardModelWidget({Key? key}) : super(key: key);

  @override
  _OnBoardModelWidget createState() => _OnBoardModelWidget();

}

class _OnBoardModelWidget extends State<OnBoardModelWidget>{


  int index = 0;

  @override
  void initState(){
    super.initState();
    index = 0;
  }

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
  }

  final onBoardingPageList = [
    PageModel(
      widget: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(width: 1.0, color: ColorCustom.pageModelBackgroundColor)
          ),
        child: PageModelWidget(imageUrl: ImagesCustom.onBoardImage1,
        textLabel: "Book a flight",
        textContent: "Found a flight that matches your destination and schedule? Book it instantly."),
      )
    ),

    PageModel(
        widget: DecoratedBox(
          decoration: BoxDecoration(
              border: Border.all(width: 1.0, color: ColorCustom.pageModelBackgroundColor)
          ),
          child: PageModelWidget(imageUrl: ImagesCustom.onBoardImage2,
              textLabel: "Find a hotel room",
              textContent: "Select the day, book your room. We give you the best price."),
        )
    ),

    PageModel(
        widget: DecoratedBox(
          decoration: BoxDecoration(
              border: Border.all(width: 1.0, color: ColorCustom.pageModelBackgroundColor)
          ),
          child: PageModelWidget(imageUrl: ImagesCustom.onBoardImage3,
              textLabel: "Enjoy your trip",
              textContent: "Easy discovering new places and share these between your friends and travel together.."),
        )
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: ColorCustom.doveGrayColor,
        ),
      child: Column(
        children: [
           Expanded(
               flex: 1,
               child: Column(
             children: [
               Row(
                 children: [
                   Container(
                     // padding: EdgeInsets.symmetric(vertical: ),
                     child: Text("Giọng hát tốt nhất của bạn là gì?"),
                   )
                 ],
               ),
               Row(
                 children: [
                   Container(
                     child: Text("Hãy đưa ra giọng hát tốt nhất của bạn lúc thể hiển"),
                   )
                 ],
               ),
             ],
           )),

          Expanded(
              flex: 9,
              child: Column(
                 mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Container(
                        child: Text("Giọng hát tốt nhất của bạn là gì?"),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        child: Text("Hãy đưa ra giọng hát tốt nhất của bạn lúc thể hiển"),
                      )
                    ],
                  ),
                ],
              )),
        ],
      ),
      ),
    );
  }

  void handleNextButton( { void Function(int)? setIndex, int? index, int? length} ){
     setIndex!(index ?? 0);
  }

}