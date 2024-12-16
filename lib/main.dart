import 'package:base_flutter_app/presentation/controllers/home_page/home_page.dart';
import 'package:base_flutter_app/presentation/controllers/home_page/identity-voice-detail.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  //ShaderMaskDemo()
      const SafeArea(
        bottom: true,
        child: HomePageScreen(),
      ),
    );
  }
}


class ShaderMaskDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ShaderMask Demo'),
      ),
      body: Center(
        child: ShaderMask(
          shaderCallback: (Rect rect) {
            return LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, Colors.transparent, Colors.transparent, Colors.white],
              stops: [0.0, 0.1, 0.9, 1.0], // 10% purple, 80% transparent, 10% purple
            ).createShader(rect);
          },
          blendMode: BlendMode.dstOut,
          child: ListView.builder(
            itemCount: 100,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                color: Colors.grey,
                child: ListTile(
                  title: Text('test'),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}