import 'package:base_flutter_app/constants/colors.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class StepperWidget extends StatefulWidget{
  
  const StepperWidget({Key? key}) : super(key: key);

  @override
  _StepperWidget createState() => _StepperWidget();
}

class _StepperWidget extends State<StepperWidget>{
  
  List<Step> listStep = [];
  
  @override
  void didChangeDependencies(){
    super.didChangeDependencies(); 
    listStep.add(new Step(title: Text(
        "Book and Review"
    ), content: Container()));

    listStep.add(new Step(title: Text(
        "Payment"
    ), content: Container()));

    listStep.add(new Step(title: Text(
        "Confirm"
    ), content: Container()));
  }
  
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorCustom.colorWhite
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text("1",style: TextStyle(fontWeight: FontWeight.bold, color: ColorCustom.indigoPurple, fontSize: 13),),
            ),
          ),

          SizedBox(width: 5),
          Text("Book and Review", style: TextStyle(fontWeight: FontWeight.bold, color: ColorCustom.colorWhite)),
          SizedBox(width: 5),
          Container(
            height: 2,
            width: width * 0.05,
            decoration: BoxDecoration(
              color: ColorCustom.colorWhite
            ),
          ),
        SizedBox(width: 5),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorCustom.colorWhite.withOpacity(0.5)
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text("2",style: TextStyle(fontWeight: FontWeight.bold, color: ColorCustom.colorWhite, fontSize: 13)),
          ),
        ),

        SizedBox(width: 5),
        Text("Payment", style: TextStyle(fontWeight: FontWeight.bold, color: ColorCustom.colorWhite)),
        SizedBox(width: 5),
        Container(
          height: 2,
          width: width * 0.05,
          decoration: BoxDecoration(
              color: ColorCustom.colorWhite
          ),
        ),
        SizedBox(width: 5),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorCustom.colorWhite.withOpacity(0.5)
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text("3",style: TextStyle(fontWeight: FontWeight.bold, color: ColorCustom.colorWhite, fontSize: 13)),
          ),
        ),
        SizedBox(width: 5),
        Text("Confirm", style: TextStyle(fontWeight: FontWeight.bold, color: ColorCustom.colorWhite)),

      ],
    );
  }
  
}