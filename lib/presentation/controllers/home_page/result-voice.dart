
import 'dart:math';

import 'package:base_flutter_app/constants/font_sizes.dart';
import 'package:base_flutter_app/constants/images.dart';
import 'package:base_flutter_app/presentation/controllers/home_page/home.dart';
import 'package:base_flutter_app/presentation/controllers/home_page/home_page.dart';
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
    initData();
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


  List<Person> persons =  [];
  List<Music> musics =  [];
  List<Voice> voices =  [];
  int randomVoice = 0;

  Random random = Random();

  void initData(){

    randomVoice = random.nextInt(6) + 1;

    /// Tone 1
    persons.add(Person("Frank Sinatra", ImagesCustom.imageArtist, "Nghệ sĩ", 1));
    persons.add(Person("Quân A.P", ImagesCustom.imageArtist, "Nghệ sĩ", 1));
    persons.add(Person("ERIK", ImagesCustom.imageArtist, "Nghệ sĩ", 1));
    persons.add(Person("Hồ Quang Hiếu", ImagesCustom.imageArtist, "Nghệ sĩ", 1));
    persons.add(Person("Alec Benjamin", ImagesCustom.imageArtist, "Nghệ sĩ", 1));

    musics.add(Music(ImagesCustom.imageMusic, "Ai Là Người Thương Em", "Quân A.P", "Dễ", 1));
    musics.add(Music(ImagesCustom.imageMusic, "Sau tất cả", "ERIK", "Dễ", 1));
    musics.add(Music(ImagesCustom.imageMusic, "Chạm Đáy Nỗi Đau", "ERIK", "Dễ", 1));
    musics.add(Music(ImagesCustom.imageMusic, "Perfect", "Ed Sheeran", "Trung bình", 1));
    musics.add(Music(ImagesCustom.imageMusic, "Đập Vỡ Cây Đàn", "Duy Khánh", "Khó", 1));
    /// Tone 2
    persons.add(Person("Vũ", ImagesCustom.imageArtist, "Nghệ sĩ, Nhạc sĩ", 2));
    persons.add(Person("HIEUTHUHAI", ImagesCustom.imageArtist, "Nghệ sĩ", 2));
    persons.add(Person("Grey D", ImagesCustom.imageArtist, "Nghệ sĩ", 2));
    persons.add(Person("Alexander Rybak", ImagesCustom.imageArtist, "Nghệ sĩ", 2));
    persons.add(Person("James Arthur", ImagesCustom.imageArtist, "Nghệ sĩ", 2));

    musics.add(Music(ImagesCustom.imageMusic, "Lạ Lùng", "Vũ", "Dễ", 2));
    musics.add(Music(ImagesCustom.imageMusic, "Exis Sign", "HIEUTHUHAI", "Dễ", 2));
    musics.add(Music(ImagesCustom.imageMusic, "Nothing Else Matters", "Metallica", "Trung bình", 2));
    musics.add(Music(ImagesCustom.imageMusic, "Thành Phố Buồn", "Đan Nguyên", "Trung bình", 2));
    musics.add(Music(ImagesCustom.imageMusic, "Through the Valley", "Shawn James", "Khó", 2));

    /// Tone 3
    persons.add(Person("Bruno Mars", ImagesCustom.imageArtist, "Nghệ sĩ", 3));
    persons.add(Person("Sơn Tùng M-TP", ImagesCustom.imageArtist, "Nghệ sĩ", 3));
    persons.add(Person("Đức Phúc", ImagesCustom.imageArtist, "Nghệ sĩ", 3));
    persons.add(Person("Noo Phước Thịnh", ImagesCustom.imageArtist, "Nghệ sĩ", 3));
    persons.add(Person("Hà Anh Tuấn", ImagesCustom.imageArtist, "Nghệ sĩ", 3));

    musics.add(Music(ImagesCustom.imageMusic, "Hơn Cả Yêu", "Đức Phúc", "Dễ", 3));
    musics.add(Music(ImagesCustom.imageMusic, "Tháng Tư Là Lời Nói Dối Của Em", "Hà Anh Tuấn", "Dễ", 3));
    musics.add(Music(ImagesCustom.imageMusic, "Cause I Love You", "Noo Phước Thịnh", "Trung bình", 3));
    musics.add(Music(ImagesCustom.imageMusic, "When I Was Your Man", "Bruno Mars", "Trung bình", 3));
    musics.add(Music(ImagesCustom.imageMusic, "All of Me", "John Legend", "Khó", 3));
    /// Tone 4
    persons.add(Person("Adele", ImagesCustom.imageArtist, "Nghệ sĩ", 4));
    persons.add(Person("Ariana Grande", ImagesCustom.imageArtist, "Nghệ sĩ", 4));
    persons.add(Person("Mỹ Linh", ImagesCustom.imageArtist, "Nghệ sĩ", 4));
    persons.add(Person("Bảo Anh", ImagesCustom.imageArtist, "Nghệ sĩ", 4));
    persons.add(Person("Tóc Tiên", ImagesCustom.imageArtist, "Nghệ sĩ", 4));

    musics.add(Music(ImagesCustom.imageMusic, "Someone Like You", "Adele", "Dễ", 4));
    musics.add(Music(ImagesCustom.imageMusic, "If I Ain't Got You", "Alicia Keys", "Dễ", 4));
    musics.add(Music(ImagesCustom.imageMusic, "Piece of My Heart", "Janis Joplin", "Trung bình", 4));
    musics.add(Music(ImagesCustom.imageMusic, "Tình Lỡ", "Lệ Quyên", "Trung bình", 4));
    musics.add(Music(ImagesCustom.imageMusic, "My Heart Will Go On", "Celine Dion", "Khó", 4));
    /// Tone 5
    persons.add(Person("Leona Lewis", ImagesCustom.imageArtist, "Nghệ sĩ", 5));
    persons.add(Person("Hồ Ngọc Hà", ImagesCustom.imageArtist, "Nghệ sĩ", 5));
    persons.add(Person("Hoàng Thùy Linh", ImagesCustom.imageArtist, "Nghệ sĩ", 5));
    persons.add(Person("Mỹ Tâm", ImagesCustom.imageArtist, "Nghệ sĩ", 5));
    persons.add(Person("MIN", ImagesCustom.imageArtist, "Nghệ sĩ", 5));

    musics.add(Music(ImagesCustom.imageMusic, "Em Gái Mưa", "Hương Tràm", "Dễ", 5));
    musics.add(Music(ImagesCustom.imageMusic, "Because of You", "Kelly Clarkson", "Dễ", 5));
    musics.add(Music(ImagesCustom.imageMusic, "Bleeding Love", "Leona Lewis", "Trung bình", 5));
    musics.add(Music(ImagesCustom.imageMusic, "Yêu Một Người Vô Tâm", "Bảo Anh", "Trung bình", 5));
    musics.add(Music(ImagesCustom.imageMusic, "I Will Always Love You", "Whitney Houston", "Khó", 5));
    /// Tone 6
    persons.add(Person("Lương Bích Hữu", ImagesCustom.imageArtist, "Nghệ sĩ", 6));
    persons.add(Person("Ái Phương", ImagesCustom.imageArtist, "Nghệ sĩ", 6));
    persons.add(Person("Vũ Cát Tường", ImagesCustom.imageArtist, "Nghệ sĩ", 6));
    persons.add(Person("Hương Giang", ImagesCustom.imageArtist, "Nghệ sĩ", 6));
    persons.add(Person("Beyoncé", ImagesCustom.imageArtist, "Nghệ sĩ", 6));

    musics.add(Music(ImagesCustom.imageMusic, "Halo", "Beyoncé", "Dễ", 6));
    musics.add(Music(ImagesCustom.imageMusic, "Có Em Chờ", "MIN", "Dễ", 6));
    musics.add(Music(ImagesCustom.imageMusic, "Bùa Yêu", "Bích Phương", "Trung bình", 6));
    musics.add(Music(ImagesCustom.imageMusic, "Bèo Dạt Mây Trôi", "Thùy Chi", "Trung bình", 6));
    musics.add(Music(ImagesCustom.imageMusic, "Không Thể Cùng Nhau Suốt Kiếp", "Hòa Minzy", "Khó", 6));

    /// Add voice
    voices.add(Voice("Baritone", "Âm vực của bạn là A3-D6", 1));
    voices.add(Voice("Bass", "Âm vực của bạn là A3-D6", 2));
    voices.add(Voice("Tenor", "Âm vực của bạn là A3-D6", 3));
    voices.add(Voice("Alto", "Âm vực của bạn là A3-D6", 4));
    voices.add(Voice("Mezzo", "Âm vực của bạn là A3-D6", 5));
    voices.add(Voice("Soprano", "Âm vực của bạn là A3-D6", 6));
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
                                                           child: Text("${voices.firstWhere((item) => item.id == randomVoice).name ?? ""}", style: TextStyle(color: ColorCustom.colorWhite, fontSize: FontSizes.s36, fontWeight: FontWeight.w500), textAlign: TextAlign.center)))
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
                           children: const [
                             Expanded(child: Text("Nghệ sĩ tương tự", style: TextStyle(color: ColorCustom.colorWhite, fontSize: FontSizes.s16, fontWeight: FontWeight.w600),))
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
                                   border: index == 4 ? null :  Border(
                                     bottom: BorderSide(width: 0, color: ColorCustom.anthensGray),
                                   )
                               ),
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Expanded(
                                     flex: 1,
                                     child: SizedBox(
                                       width: 40,
                                       child: Image(
                                         image: AssetImage(persons.where((item) => item.id == randomVoice).toList()[index].imageUrl ?? ""),
                                       ),
                                     ),
                                   ),
                                   const SizedBox(width: 5),
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
                           children: const [
                             Expanded(child: Text("Bạn có thể hát thử", style: TextStyle(color: ColorCustom.colorWhite, fontSize: FontSizes.s16, fontWeight: FontWeight.w600),))
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
                                     bottom:   BorderSide(width: 0, color: ColorCustom.anthensGray),
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
                                               border: Border.all(color: Colors.grey),
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

  Voice(this.name, this.description, this.id);
}