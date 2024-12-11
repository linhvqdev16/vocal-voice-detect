
import 'package:base_flutter_app/constants/font_sizes.dart';
import 'package:base_flutter_app/constants/images.dart';
import 'package:base_flutter_app/presentation/controllers/home_page/result-voice.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/colors.dart';
import '../../../constants/icons.dart';
import '../../../constants/radius.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class IdentityVoiceDetailScreen extends StatefulWidget{

  const IdentityVoiceDetailScreen({Key? key}) : super(key: key);

  @override
  _IdentityVoiceDetailScreen createState() => _IdentityVoiceDetailScreen();
}

class _IdentityVoiceDetailScreen extends State<IdentityVoiceDetailScreen> {


  bool isClickButton = false;
  int step  = 0;
  @override
  void initState(){
    super.initState();
    if(step == 0){
      listSpeedTextCharacter = listSpeedText[0].split(' '); // Split the text into individual characters

      // _controller = AnimationController(
      //   vsync: this,
      //   duration: Duration(seconds: 5), // Duration for the animation
      // )..addListener(() {
      //   setState(() {});
      // });
      //
      // _animation = IntTween(begin: -1, end: -1).animate(_controller);
      // _controller.forward();
    }
    _initSpeech();
  }

  SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String lastWords = '';

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
  }

  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});

  }

  /// Each time to start a speech recognition session
  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  /// Manually stop the active speech recognition session
  /// Note that there are also timeouts that each platform enforces
  /// and the SpeechToText plugin supports setting timeouts on the
  /// listen method.
  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      lastWords = result.recognizedWords;
      print(lastWords);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  double height =0;
  double width = 0;

  List<int> stepDone = [];
  bool isCompletedThisStep = false;


  List<String> listSpeedText = [
    'Hình bóng ai đó nhẹ nhàng vụt qua nơi đây  Quyến rũ ngây ngất loạn nhịp làm tim mê say',
    'Đồ ồ ồ ồ ồ ồ',
    'Đố ố ố ố ố ố',
    'Hây! Hây! Hây!'
  ];

  List<String> listSpeedTextCharacter = [];

  Future<int> getValue() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('gender') ?? 0;
  }


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
                color: Color(0xFF14171C)
            ),
          ),
        leading: GestureDetector(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.arrow_back)),
        actions: const [
          Padding(padding: EdgeInsets.only(right: 10), child: Icon(Icons.info),)
        ],
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
            color: Color(0xFF14171C)
        ),
        height: height,
        child: Stack(
          children: [

             Align(
              alignment: Alignment.bottomCenter,
              child: !isClickButton || isCompletedThisStep ? null : SizedBox(
                   width: width,
                  child: const Image(image: AssetImage(ImagesCustom.imageLightGrow), fit: BoxFit.cover,)),
            ),

            Padding(padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      color: ColorCustom.doveGrayColor.withOpacity(0.4)
                  ),
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: List.generate(4, (index) =>  Expanded(
                        child: GestureDetector(
                          onTap: (){
                            // setState(() {
                            //   step = index;
                            //
                            // });
                            // counter.setState(listSpeedTextCharacter, _animation);
                          },
                          child: Container(
                            height: width * 0.09,
                            margin: const EdgeInsets.symmetric(horizontal: 2),
                            decoration: stepDone.contains(index)  ? BoxDecoration(
                                border: Border.all(color: Color(0xFF1DB16B)),
                                borderRadius: const BorderRadius.all(Radius.circular(RadiusCustom.radiusImagePortrait)),
                                color: const Color(0xFF1DB16B)
                            ) :  step != index && !((stepDone.isNotEmpty && stepDone.contains(index))) ? BoxDecoration(
                                border: Border.all(color: Colors.transparent),
                                borderRadius: const BorderRadius.all(Radius.circular(RadiusCustom.radiusImagePortrait)),
                                color: Colors.transparent
                            ) :  BoxDecoration(
                                border: Border.all(color: Color(0xFF1DB16B)),
                                borderRadius: const BorderRadius.all(Radius.circular(RadiusCustom.radiusImagePortrait)),
                                color: const Color(0xFF1DB16B).withOpacity(0.4)
                            ),
                            child: Center(
                              // ignore: unnecessary_null_comparison
                              child: (stepDone.isNotEmpty && stepDone.contains(index)) ? Image.asset(IconCustom.iconSelected, color: Colors.black,) : Text("${index + 1}", style: TextStyle(color: ColorCustom.colorWhite, fontWeight: FontWeight.w500),),
                            ),
                          ),
                        )
                    )),
                  ),
                ),

                Expanded(
                  flex: 5,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        step == 0 ?  _stepOne() : step == 1 ? _stepTwo() : step == 2 ? _stepThree() : _stepFour(),

                        SizedBox(height: isCompletedThisStep == false ? 50 : 60),
                      ],
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: isCompletedThisStep ? Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isCompletedThisStep = false;
                                  isClickButton = false;
                                  stepDone.remove(step);
                                });
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
                                            Text("Thử lại", style: TextStyle(fontSize: FontSizes.s16, fontWeight: FontWeight.bold, color: ColorCustom.colorWhite),)
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            child: GestureDetector(
                              onTap: () async {
                                if(step != 3){
                                 setState(() {
                                   stepDone.add(step);
                                   step += 1;
                                   isCompletedThisStep = false;
                                   isClickButton = false;
                                   listSpeedTextCharacter = listSpeedText[step].split(" ");
                                   lastWords = '';
                                 });
                                }else{
                                  int gender = await getValue();
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  ResultVoiceDetailScreen(gender: gender)));
                                }
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
                                    image: const DecorationImage(
                                        image: AssetImage(ImagesCustom.imageVoiceIdentityBackground),
                                        fit: BoxFit.cover
                                    )
                                ),
                                child: Center(
                                  child: Text('${step == 3 ? "Hoàn thành" : "Tiếp tục"}', style: const TextStyle(fontSize: FontSizes.s18, fontWeight: FontWeight.bold, color: ColorCustom.colorWhite),)
                                ),
                              ),
                            ),
                          )
                        ],
                      ) :  isClickButton ? GestureDetector(
                        onTap: () {
                          setState(() {
                            _stopListening();
                            isCompletedThisStep = true;
                          });
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              decoration:  BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Color(0xFF7827F9).withOpacity(0.4), width: 0.5)
                              ),
                              width: 120,
                              height: 120,
                            ),
                            Container(
                              decoration:  BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Color(0xFF7827F9).withOpacity(0.4), width: 0.5)
                              ),
                              width: 90,
                              height: 90,
                            ),

                            Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              width: 70,
                              height: 70,
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient:  LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xFF7827F9).withOpacity(0.9),
                                      Color(0xFF7928FA).withOpacity(0.2),
                                    ],
                                  ),
                                  border: Border.all(
                                    color: Colors.grey.withOpacity(0.1),
                                    width: 0,
                                  ),
                                ),
                                child: Center(
                                  child:
                                  Image.asset(IconCustom.iconMicro),
                                ),
                              ),
                            ),
                          ],

                        ),
                      ) : GestureDetector(
                        onTap: (){
                          setState(() {
                            isClickButton = true;
                            _startListening();
                          });
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          width: 70,
                          height: 70,
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient:  LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xFF7827F9).withOpacity(0.9),
                                  Color(0xFF7928FA).withOpacity(0.2),
                                ],
                              ),
                              border: Border.all(
                                color: Colors.grey.withOpacity(0.1),
                                width: 0,
                              ),
                            ),
                            child: Center(
                              child:
                              Image.asset(IconCustom.iconMicro),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                !isClickButton ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Nhấn vào micro để ghi âm", style: TextStyle(fontSize: FontSizes.s13,
                        fontWeight: FontWeight.w300
                        , color: ColorCustom.colorWhite),)
                  ],
                ) : const SizedBox(height: 0),
                const SizedBox(height: 10),
              ],
            ),)
          ],
        ),
      ),
    );
  }

  Widget _stepOne(){
    return  Container(
      height: height * 0.6,
      child: Column(
        children: [
          Container(
            height: height * 0.135,
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.symmetric( horizontal: 15, vertical: 0),
            decoration: BoxDecoration(
                border: Border.all(color: Color(0xFF7827F9)),
                borderRadius: const BorderRadius.all( Radius.circular(RadiusCustom.radiusHeader)),
                color: ColorCustom.doveGrayColor.withOpacity(0.2)),
            child: Row(
              children:  [
                Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: ShaderMask(
                        shaderCallback: (bounds) {
                          return const LinearGradient(
                            colors: [Color(0xFF7827F9), Colors.white], // Gradient colors
                            tileMode: TileMode.mirror,
                          ).createShader(bounds);
                        },
                        child: Text("01", style: TextStyle(color: ColorCustom.colorWhite, fontSize: 120, fontWeight: FontWeight.w500)))),

                const SizedBox(width: 10),

                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                     Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Container(
                          width: width * 0.35,
                          child: Row(
                            children: [
                              Expanded(child: Text("Giọng thấp nhất", style: TextStyle(color: ColorCustom.colorWhite, fontSize: FontSizes.s18, fontWeight: FontWeight.w500),))
                            ],
                          ),
                        )),
                    SizedBox(height: 15),
                    Container(
                      width: width * 0.35,
                      child: Row(
                        children: const [
                          Expanded(
                            flex: 5,
                            child: Text("Đọc đoạn hát trên bằng giọng tự nhiên của bạn", style: TextStyle(fontSize: FontSizes.s13,
                                fontWeight: FontWeight.w300
                                , color: ColorCustom.colorWhite),),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Wrap(
            children:  List.generate(
              listSpeedTextCharacter.length, (index) {
                // Change color for the current word or character
                bool isHighlighted = lastWords.toUpperCase().contains(listSpeedTextCharacter[index].toUpperCase());
                return  Text(
                  listSpeedTextCharacter[index] + " ",
                  style: TextStyle(
                    fontSize: FontSizes.s24,
                    fontWeight: FontWeight.w500
                    ,
                    color: isHighlighted ?  Color(0xFF7827F9) :  ColorCustom.colorWhite,// Default color for non-highlighted
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _stepTwo(){
    return  Container(
      height: height * 0.6,
      child: Column(
        children: [
          Container(
            height: height * 0.135,
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.symmetric( horizontal: 15, vertical: 0),
            decoration: BoxDecoration(
                border: Border.all(color: Color(0xFF7827F9)),
                borderRadius: const BorderRadius.all( Radius.circular(RadiusCustom.radiusHeader)),
                color: ColorCustom.doveGrayColor.withOpacity(0.2)),
            child: Row(
              children:  [
                Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: ShaderMask(
                        shaderCallback: (bounds) {
                          return const LinearGradient(
                            colors: [Color(0xFF7827F9), Colors.white], // Gradient colors
                            tileMode: TileMode.mirror,
                          ).createShader(bounds);
                        },
                        child: Text("02", style: TextStyle(color: ColorCustom.colorWhite, fontSize: 120, fontWeight: FontWeight.w500)))),

                const SizedBox(width: 10),

                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                     Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Container(
                          width: width * 0.35,
                          child: Row(
                            children: [
                              Expanded(child: Text("Giọng thấp nhất", style: TextStyle(color: ColorCustom.colorWhite, fontSize: FontSizes.s18, fontWeight: FontWeight.w500),))
                            ],
                          ),
                        )),
                    SizedBox(height: 15),
                    Container(
                      width: width * 0.35,
                      child: Row(
                        children: const [
                          Expanded(
                            flex: 5,
                            child: Text("Tạo âm thanh “Đồ ồ ồ ồ ồ ồ” với giọng thấp nhất của bạn.", style: TextStyle(fontSize: FontSizes.s13,
                                fontWeight: FontWeight.w300
                                , color: ColorCustom.colorWhite),),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Wrap(
          children:  List.generate(
            listSpeedTextCharacter.length,
                (index) {
              // Change color for the current word or character
                  bool isHighlighted = lastWords.toUpperCase().contains(listSpeedTextCharacter[index].toUpperCase());
              return Text(
                listSpeedTextCharacter[index] + " ",
                style: TextStyle(
                  fontSize: FontSizes.s24,
                  fontWeight: FontWeight.w500
                  ,
                  color: isHighlighted ?  Color(0xFF7827F9) :  ColorCustom.colorWhite,// Default color for non-highlighted
                ),
              );
            },
          ),
        ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _stepThree(){
    return  Container(
      height: height * 0.6,
      child: Column(
        children: [
          Container(
            height: height * 0.135,
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.symmetric( horizontal: 15, vertical: 0),
            decoration: BoxDecoration(
                border: Border.all(color: Color(0xFF7827F9)),
                borderRadius: const BorderRadius.all( Radius.circular(RadiusCustom.radiusHeader)),
                color: ColorCustom.doveGrayColor.withOpacity(0.2)),
            child: Row(
              children:  [
                Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: ShaderMask(
                        shaderCallback: (bounds) {
                          return const LinearGradient(
                            colors: [Color(0xFF7827F9), Colors.white], // Gradient colors
                            tileMode: TileMode.mirror,
                          ).createShader(bounds);
                        },
                        child: Text("03", style: TextStyle(color: ColorCustom.colorWhite, fontSize: 120, fontWeight: FontWeight.w500)))),

                const SizedBox(width: 10),

                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                     Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Container(
                          width: width * 0.35,
                          child: Row(
                            children: [
                              Expanded(child: Text("Giọng cao nhất", style: TextStyle(color: ColorCustom.colorWhite, fontSize: FontSizes.s18, fontWeight: FontWeight.w500),))
                            ],
                          ),
                        )),
                    SizedBox(height: 15),
                    Container(
                      width: width * 0.35,
                      child: Row(
                        children: const [
                          Expanded(
                            flex: 5,
                            child: Text("Thử “Đố ố ố ố ố ố” bằng giọng cao nhất.", style: TextStyle(fontSize: FontSizes.s13,
                                fontWeight: FontWeight.w300
                                , color: ColorCustom.colorWhite),),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Wrap(
            children:  List.generate(
              listSpeedTextCharacter.length,
                  (index) {
                // Change color for the current word or character
                    bool isHighlighted = lastWords.toUpperCase().contains(listSpeedTextCharacter[index].toUpperCase());
                return Text(
                  listSpeedTextCharacter[index] + " ",
                  style: TextStyle(
                    fontSize: FontSizes.s24,
                    fontWeight: FontWeight.w500
                    ,
                    color: isHighlighted ?  Color(0xFF7827F9) :  ColorCustom.colorWhite,// Default color for non-highlighted
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _stepFour(){
    return  Container(
      height: height * 0.6,
      child: Column(
        children: [
          Container(
            height: height * 0.135,
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.symmetric( horizontal: 15, vertical: 0),
            decoration: BoxDecoration(
                border: Border.all(color: Color(0xFF7827F9)),
                borderRadius: const BorderRadius.all( Radius.circular(RadiusCustom.radiusHeader)),
                color: ColorCustom.doveGrayColor.withOpacity(0.2)),
            child: Row(
              children:  [
                Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: ShaderMask(
                        shaderCallback: (bounds) {
                          return const LinearGradient(
                            colors: [Color(0xFF7827F9), Colors.white], // Gradient colors
                            tileMode: TileMode.mirror,
                          ).createShader(bounds);
                        },
                        child: Text("04", style: TextStyle(color: ColorCustom.colorWhite, fontSize: 120, fontWeight: FontWeight.w500)))),

                const SizedBox(width: 10),

                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                     Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Container(
                          width: width * 0.35,
                          child: Row(
                            children: [
                              Expanded(child: Text("Âm lượng", style: TextStyle(color: ColorCustom.colorWhite, fontSize: FontSizes.s18, fontWeight: FontWeight.w500),))
                            ],
                          ),
                        )),
                    SizedBox(height: 15),
                    Container(
                      width: width * 0.35,
                      child: Row(
                        children: const [
                          Expanded(
                            flex: 5,
                            child: Text("Thử “Hây” ba lần với âm thanh to nhất có thể.", style: TextStyle(fontSize: FontSizes.s13,
                                fontWeight: FontWeight.w300
                                , color: ColorCustom.colorWhite),),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Wrap(
            children:  List.generate(
              listSpeedTextCharacter.length,
                  (index) {
                // Change color for the current word or character
                    bool isHighlighted = lastWords.toUpperCase().contains(listSpeedTextCharacter[index].toUpperCase());
                return  Text(
                  listSpeedTextCharacter[index]  + " ",
                  style: TextStyle(
                    fontSize: FontSizes.s24,
                    fontWeight: FontWeight.w500
                    ,
                    color: isHighlighted ?  Color(0xFF7827F9) :  ColorCustom.colorWhite,// Default color for non-highlighted
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class Counter with ChangeNotifier {
  int _gender = 0;
  int get gender => _gender;

  void setGender(int value) {
     _gender = gender;
    notifyListeners();
  }
}