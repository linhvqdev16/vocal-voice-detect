
import 'dart:math';

import 'package:base_flutter_app/constants/font_sizes.dart';
import 'package:base_flutter_app/constants/images.dart';
import 'package:base_flutter_app/presentation/controllers/home_page/home_page.dart';
import 'package:base_flutter_app/presentation/controllers/home_page/identity-voice-detail.dart';
import 'package:base_flutter_app/presentation/widgets/common/layout_screen.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/radius.dart';

class ResultVoiceDetailScreen extends StatefulWidget{

  final int gender;
  const ResultVoiceDetailScreen({Key? key, required this.gender}) : super(key: key);

  @override
  _ResultVoiceDetailScreen createState() => _ResultVoiceDetailScreen();
}

class _ResultVoiceDetailScreen extends State<ResultVoiceDetailScreen> {

  late final Counter counter;

  bool isClickButton = false;
  int step  = 0;
  @override
  void initState(){
    super.initState();
    if(step == 0){
      listSpeedTextCharacter = listSpeedText[0].split(''); // Split the text into individual characters
    }
    initData();
  }

  bool isFirstLoad = true;

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
  }

  late AnimationController _controller;
  late Animation<int> _animation;

  @override
  void dispose() {
    super.dispose();
  }

  double height =0;
  double width = 0;

  List<int> stepDone = [];
  bool isCompletedThisStep = true;


  List<String> listSpeedText = [
    'Hình bóng ai đó nhẹ nhàng vụt qua nơi đây - Quyến rũ ngây ngất loạn nhịp làm tim mê say',
    'Hummmmmmmmmm',
    'Yee-yeahhh',
    'Hey! Hey! Hey!'
  ];

  List<String> listSpeedTextCharacter = [];

  List<Person> persons =  [];
  List<Music> musics =  [];
  List<Voice> voices =  [];
  int randomVoice = 0;

  Random random = Random();

  void initData()  async {
    /// Tone 1
    persons.add(Person("Frank Sinatra", "assets/images/components/baritone/Singer/image.png", "Nghệ sĩ", 1));
    persons.add(Person("Quân A.P", "assets/images/components/baritone/Singer/image-1.png", "Nghệ sĩ", 1));
    persons.add(Person("ERIK", "assets/images/components/baritone/Singer/image-2.png", "Nghệ sĩ", 1));
    persons.add(Person("Hồ Quang Hiếu", "assets/images/components/baritone/Singer/image-3.png", "Nghệ sĩ", 1));
    persons.add(Person("Alec Benjamin", "assets/images/components/baritone/Singer/image-4.png", "Nghệ sĩ", 1));

    musics.add(Music("assets/images/components/baritone/Song/image.png", "Ai Là Người Thương Em", "Quân A.P", "Dễ", 1));
    musics.add(Music("assets/images/components/baritone/Song/image-1.png", "Sau tất cả", "ERIK", "Dễ", 1));
    musics.add(Music("assets/images/components/baritone/Song/image-2.png", "Chạm Đáy Nỗi Đau", "ERIK", "Dễ", 1));
    musics.add(Music("assets/images/components/baritone/Song/image-3.png", "Perfect", "Ed Sheeran", "Trung bình", 1));
    musics.add(Music("assets/images/components/baritone/Song/image-4.png", "Đập Vỡ Cây Đàn", "Duy Khánh", "Khó", 1));
    /// Tone 2
    persons.add(Person("Vũ", "assets/images/components/bass/Singer/image.png", "Nghệ sĩ, Nhạc sĩ", 2));
    persons.add(Person("HIEUTHUHAI", "assets/images/components/bass/Singer/image-1.png", "Nghệ sĩ", 2));
    persons.add(Person("Grey D", "assets/images/components/bass/Singer/image-2.png", "Nghệ sĩ", 2));
    persons.add(Person("Alexander Rybak", "assets/images/components/bass/Singer/image-3.png", "Nghệ sĩ", 2));
    persons.add(Person("James Arthur", "assets/images/components/bass/Singer/image-4.png", "Nghệ sĩ", 2));

    musics.add(Music("assets/images/components/bass/Song/image.png", "Lạ Lùng", "Vũ", "Dễ", 2));
    musics.add(Music("assets/images/components/bass/Song/image-1.png", "Exis Sign", "HIEUTHUHAI", "Dễ", 2));
    musics.add(Music("assets/images/components/bass/Song/image-2.png", "Nothing Else Matters", "Metallica", "Trung bình", 2));
    musics.add(Music("assets/images/components/bass/Song/image-3.png", "Thành Phố Buồn", "Đan Nguyên", "Trung bình", 2));
    musics.add(Music("assets/images/components/bass/Song/image-4.png", "Through the Valley", "Shawn James", "Khó", 2));

    /// Tone 3
    persons.add(Person("Bruno Mars", "assets/images/components/tenor/Singer/image.png", "Nghệ sĩ", 3));
    persons.add(Person("Sơn Tùng M-TP", "assets/images/components/tenor/Singer/image-1.png", "Nghệ sĩ", 3));
    persons.add(Person("Đức Phúc", "assets/images/components/tenor/Singer/image-2.png", "Nghệ sĩ", 3));
    persons.add(Person("Noo Phước Thịnh", "assets/images/components/tenor/Singer/image-3.png", "Nghệ sĩ", 3));
    persons.add(Person("Hà Anh Tuấn", "assets/images/components/tenor/Singer/image-4.png", "Nghệ sĩ", 3));

    musics.add(Music("assets/images/components/tenor/Song/image.png", "Hơn Cả Yêu", "Đức Phúc", "Dễ", 3));
    musics.add(Music("assets/images/components/tenor/Song/image-1.png", "Tháng Tư Là Lời Nói Dối Của Em", "Hà Anh Tuấn", "Dễ", 3));
    musics.add(Music("assets/images/components/tenor/Song/image-2.png", "Cause I Love You", "Noo Phước Thịnh", "Trung bình", 3));
    musics.add(Music("assets/images/components/tenor/Song/image-3.png", "When I Was Your Man", "Bruno Mars", "Trung bình", 3));
    musics.add(Music("assets/images/components/tenor/Song/image-4.png", "All of Me", "John Legend", "Khó", 3));
    /// Tone 4
    persons.add(Person("Adele", "assets/images/components/alto/Singer/image.png", "Nghệ sĩ", 4));
    persons.add(Person("Ariana Grande", "assets/images/components/alto/Singer/image-1.png", "Nghệ sĩ", 4));
    persons.add(Person("Mỹ Linh", "assets/images/components/alto/Singer/image-2.png", "Nghệ sĩ", 4));
    persons.add(Person("Bảo Anh", "assets/images/components/alto/Singer/image-3.png", "Nghệ sĩ", 4));
    persons.add(Person("Tóc Tiên", "assets/images/components/alto/Singer/image-4.png", "Nghệ sĩ", 4));

    musics.add(Music("assets/images/components/alto/Song/image.png", "Someone Like You", "Adele", "Dễ", 4));
    musics.add(Music("assets/images/components/alto/Song/image-1.png", "If I Ain't Got You", "Alicia Keys", "Dễ", 4));
    musics.add(Music("assets/images/components/alto/Song/image-2.png", "Piece of My Heart", "Janis Joplin", "Trung bình", 4));
    musics.add(Music("assets/images/components/alto/Song/image-3.png", "Tình Lỡ", "Lệ Quyên", "Trung bình", 4));
    musics.add(Music("assets/images/components/alto/Song/image-4.png", "My Heart Will Go On", "Celine Dion", "Khó", 4));
    /// Tone 5
    persons.add(Person("Leona Lewis", "assets/images/components/mezzo/Singer/image.png", "Nghệ sĩ", 5));
    persons.add(Person("Hồ Ngọc Hà", "assets/images/components/mezzo/Singer/image-1.png", "Nghệ sĩ", 5));
    persons.add(Person("Hoàng Thùy Linh", "assets/images/components/mezzo/Singer/image-2.png", "Nghệ sĩ", 5));
    persons.add(Person("Mỹ Tâm", "assets/images/components/mezzo/Singer/image-3.png", "Nghệ sĩ", 5));
    persons.add(Person("MIN", "assets/images/components/mezzo/Singer/image-4.png", "Nghệ sĩ", 5));

    musics.add(Music("assets/images/components/mezzo/Song/image.png", "Em Gái Mưa", "Hương Tràm", "Dễ", 5));
    musics.add(Music("assets/images/components/mezzo/Song/image-1.png", "Because of You", "Kelly Clarkson", "Dễ", 5));
    musics.add(Music("assets/images/components/mezzo/Song/image-2.png", "Bleeding Love", "Leona Lewis", "Trung bình", 5));
    musics.add(Music("assets/images/components/mezzo/Song/image-3.png", "Yêu Một Người Vô Tâm", "Bảo Anh", "Trung bình", 5));
    musics.add(Music("assets/images/components/mezzo/Song/image-4.png", "I Will Always Love You", "Whitney Houston", "Khó", 5));
    /// Tone 6
    persons.add(Person("Lương Bích Hữu", "assets/images/components/soprano/Singer/image.png", "Nghệ sĩ", 6));
    persons.add(Person("Ái Phương", "assets/images/components/soprano/Singer/image-1.png", "Nghệ sĩ", 6));
    persons.add(Person("Vũ Cát Tường", "assets/images/components/soprano/Singer/image-2.png", "Nghệ sĩ", 6));
    persons.add(Person("Hương Giang", "assets/images/components/soprano/Singer/image-3.png", "Nghệ sĩ", 6));
    persons.add(Person("Beyoncé", "assets/images/components/soprano/Singer/image-4.png", "Nghệ sĩ", 6));

    musics.add(Music("assets/images/components/soprano/Song/image.png", "Halo", "Beyoncé", "Dễ", 6));
    musics.add(Music("assets/images/components/soprano/Song/image-1.png", "Có Em Chờ", "MIN", "Dễ", 6));
    musics.add(Music("assets/images/components/soprano/Song/image-2.png", "Bùa Yêu", "Bích Phương", "Trung bình", 6));
    musics.add(Music("assets/images/components/soprano/Song/image-3.png", "Bèo Dạt Mây Trôi", "Thùy Chi", "Trung bình", 6));
    musics.add(Music("assets/images/components/soprano/Song/image-4.png", "Không Thể Cùng Nhau Suốt Kiếp", "Hòa Minzy", "Khó", 6));

    /// Add voice
    voices.add(Voice("Baritone", "Âm vực của bạn là A3-D6", 1, 1));
    voices.add(Voice("Bass", "Âm vực của bạn là A3-D6", 2, 1));
    voices.add(Voice("Tenor", "Âm vực của bạn là A3-D6", 3, 1));
    voices.add(Voice("Alto", "Âm vực của bạn là A3-D6", 4, 2));
    voices.add(Voice("Mezzo", "Âm vực của bạn là A3-D6", 5, 2));
    voices.add(Voice("Soprano", "Âm vực của bạn là A3-D6", 6, 2));

    if(widget.gender == 1){
      randomVoice = random.nextInt(3) + 1;
    }else{
      randomVoice = random.nextInt(3) + 4;
    }

  }
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorCustom.pageModelBackgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: Container(),
      ),
      // AppBar(
      //   // Here we take the value from the MyHomePage object that was created by
      //   // the App.build method, and use it to set our appbar title.
      //   title: const Text('Xác định âm vực'),
      //   flexibleSpace: Container(
      //     decoration: const BoxDecoration(
      //         color: Color(0xFF14171C)
      //     ),
      //   ),
      //   leading: GestureDetector(
      //       onTap: (){
      //         Navigator.of(context).pop();
      //       },
      //       child: const Icon(Icons.arrow_back)),
      //   actions: const [
      //     // Padding(padding: EdgeInsets.only(right: 10), child: Icon(Icons.info),)
      //   ],
      //   centerTitle: true,
      // ),
      body: Container(
        decoration: const BoxDecoration(
            color: Color(0xFF14171C)
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

                    SizedBox(
                      height: height * 0.44,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: SizedBox(
                                width: width,
                                child: const Image(image: AssetImage(ImagesCustom.imageLightGrowRevert), fit: BoxFit.cover,)),
                          ),

                          Container(
                            margin: const EdgeInsets.only(left: 15, right: 15, top: 20),
                            child: Row(
                              children:  [
                                   GestureDetector(
                                       onTap: (){
                                         Navigator.of(context).pop();
                                       },
                                       child: const Icon(Icons.arrow_back_ios, color: ColorCustom.colorWhite, size: 20,)),
                                   SizedBox(width: MediaQuery.of(context).size.width * 0.24,),
                                   Expanded(child: Text('Xác định âm vực', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: ColorCustom.colorWhite),))
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 125, left: 15, right: 15),
                            child: Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                      });
                                    },
                                    child: Container(
                                      height: height * 0.28,
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
                                            children:  [
                                              Expanded(
                                                  child: Padding(
                                                      padding: EdgeInsets.only(top: 15),
                                                      child: Text( "${voices.firstWhere((item) => item.id == randomVoice).description ?? ""}", style: TextStyle(color: ColorCustom.colorTextHeader, fontSize: FontSizes.s14, fontWeight: FontWeight.w400), textAlign: TextAlign.center,)))
                                            ],
                                          ),
                                          Row(
                                            children:  [
                                              Expanded(
                                                  child: Padding(
                                                      padding: EdgeInsets.only(top: 15),
                                                      child: Text("${voices.firstWhere((item) => item.id == randomVoice).name ?? ""}", style: TextStyle(color: ColorCustom.colorWhite, fontSize: 48, fontWeight: FontWeight.w500), textAlign: TextAlign.center)))
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
                            top: 70, // Align the image with the top edge of the container
                            left: 0, // Align the image to the left edge of the container
                            right: 0,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
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

                    LayoutScreen(
                      child: Column(
                        children: [

                          const SizedBox(height: 15),

                          Row(
                            children: const [
                              Expanded(child: Text("Nghệ sĩ tương tự", style: TextStyle(color: ColorCustom.colorWhite, fontSize: 20, fontWeight: FontWeight.w600),))
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: const [
                              Expanded(
                                flex: 5,
                                child: Text("Các nghệ sĩ có âm vực giọng hát tương tự giống bạn.", style: TextStyle(fontSize: FontSizes.s14,
                                    fontWeight: FontWeight.w400
                                    , color: ColorCustom.colorTextHeader, height: 1.5),),
                              )
                            ],
                          ),
                          const SizedBox(height: 15),
                          ListView.builder(
                            shrinkWrap: true,
                            physics:  NeverScrollableScrollPhysics(),
                            itemCount: persons.where((item) => item.id == randomVoice).length,  // Number of items in the list
                            itemBuilder: (context, index) {
                              return Container(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                    border: index == 4 ? null : const  Border(
                                      bottom: BorderSide(width: 1, color: Color(0xFF242B35)),
                                    )
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 64,
                                      child: Image(
                                        image: AssetImage(persons.where((item) => item.id == randomVoice).toList()[index].imageUrl ?? ""),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(width: 15),
                                    Expanded(
                                        flex: 2,
                                        child: Column(children: [
                                          Row(
                                            children: [
                                              Expanded(child: Text("${persons.where((item) => item.id == randomVoice).toList()[index].name}", style: TextStyle(color: ColorCustom.colorWhite, fontSize: FontSizes.s16, fontWeight: FontWeight.w600),))
                                            ],
                                          ),
                                          SizedBox(height: 5),
                                          Row(
                                            children:  [
                                              Expanded(
                                                flex: 5,
                                                child: Text("${persons.where((item) => item.id == randomVoice).toList()[index].title}", style: TextStyle(fontSize: FontSizes.s14,
                                                    fontWeight: FontWeight.w400
                                                    , color: ColorCustom.colorTextHeader),),
                                              )
                                            ],
                                          ),
                                        ],)),
                                    Expanded(child: Container(
                                      height: width * 0.08,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 2, vertical: 2),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Color(0xFF242B35), width: 2),
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
                            children: const [
                              Expanded(child: Text("Bạn có thể hát thử", style: TextStyle(color: ColorCustom.colorWhite, fontSize: 20, fontWeight: FontWeight.w600),))
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: const [
                              Expanded(
                                flex: 5,
                                child: Text("Các bài hát được để xuất phù hợp với quãng giọng và sở thích âm nhạc của bạn.", style: TextStyle(fontSize: FontSizes.s14,
                                    fontWeight: FontWeight.w400
                                    , color: ColorCustom.colorTextHeader, height: 1.5),),
                              )
                            ],
                          ),

                          const SizedBox(height: 15),
                          ListView.builder(
                            shrinkWrap: true,
                            physics:  const NeverScrollableScrollPhysics(),
                            itemCount: musics.where((item) => item.id == randomVoice).toList().length,  // Number of items in the list
                            itemBuilder: (context, index) {
                              return Container(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                    border: index == 4 ? null : const Border(
                                      bottom:   BorderSide(width: 1, color: Color(0xFF242B35)),
                                    )
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Image(
                                        image: AssetImage(musics.where((item) => item.id == randomVoice).toList()[index].imageUrl ?? ""),
                                      ),
                                    ),
                                    const SizedBox(width: 15),
                                Expanded(
                                    flex: 2,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 3),
                                          decoration: BoxDecoration(
                                            border: Border.all(color: Color(0xFF242B35), width: 2),
                                            borderRadius: const BorderRadius.all(
                                                Radius.circular(
                                                    20)),
                                          ),
                                          child:  Text('${musics.where((item) => item.id == randomVoice).toList()[index].level}', style: TextStyle(fontSize: FontSizes.s12, fontWeight: FontWeight.w600, color: ColorCustom.colorWhite),),
                                        ),
                                        const SizedBox(height: 7,),
                                        Row(
                                          children:  [
                                            Expanded(child: Text("${musics.where((item) => item.id == randomVoice).toList()[index].name}", style: TextStyle(color: ColorCustom.colorWhite, fontSize: FontSizes.s16, fontWeight: FontWeight.w600),))
                                          ],
                                        ),
                                        const SizedBox(height: 7),
                                        Row(
                                          children:  [
                                            Expanded(
                                              flex: 5,
                                              child: Text("${musics.where((item) => item.id == randomVoice).toList()[index].artist}", style: TextStyle(fontSize: FontSizes.s14,
                                                  fontWeight: FontWeight.w400
                                                  , color: ColorCustom.colorTextHeader),),
                                            )
                                          ],
                                        ),
                                      ],)),
                                Expanded(child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: const [
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
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.grey, width: 0.5, style: BorderStyle.solid),
                          right: BorderSide(color: Colors.grey, width: 0.5, style: BorderStyle.solid),
                          bottom: BorderSide(color: Colors.grey, width: 0.5, style: BorderStyle.solid),
                          left: BorderSide(color: Colors.grey, width: 0.5, style: BorderStyle.solid),
                        ),
                        borderRadius:  BorderRadius.only(
                           topRight: Radius.circular(RadiusCustom.radiusCardItem),
                           topLeft: Radius.circular(RadiusCustom.radiusCardItem),),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomePageScreen()));
                                  },
                                  child: Container(
                                    height: width * 0.15,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 5),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(RadiusCustom.radiusCardItem)),
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
                         const SizedBox(height: 5),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomePageScreen()));
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

class Person{
  String? imageUrl;
  String? name;
  String? title;
  int? id;
  Person(
      this.name,
      this.imageUrl,
      this.title,
      this.id);
}

class Music{
  String? imageUrl;
  String? name;
  String? artist;
  String? level;
  int? id;
  Music(
      this.imageUrl,
      this.name,
      this.artist,
      this.level,
      this.id);
}

class Voice{
  String? name;
  String? description;
  int? id;
  int? gender;

  Voice(this.name, this.description, this.id, this.gender);
}