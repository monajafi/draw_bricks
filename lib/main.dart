import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DrawBricks(),
    );
  }
}

class DrawBricks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: null,
      body: BrickRows(),
    );
  }
}

class BrickRows extends StatelessWidget {
  final PYRAMID_HEIGHT = 13;
  Widget brick(column, row) {
    BorderSide brickSide = BorderSide(color: Colors.black, width: 1);
    Border brickBorder;
    if (column == PYRAMID_HEIGHT - 1) {
      brickBorder = row == column - 1 ? 
        Border(top: brickSide, left: brickSide,right: brickSide, bottom: brickSide):
        Border(top: brickSide, left: brickSide, bottom: brickSide); 
    } else if (row == column - 1) {
      brickBorder = Border(top: brickSide, right: brickSide, left: brickSide);
    } else {
      brickBorder = Border(top: brickSide, left: brickSide);
    }
    return Center(
      child: Container(
        width: 50,
        height: 20,
        decoration: BoxDecoration(
          border: brickBorder,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(PYRAMID_HEIGHT, (column) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(column, (row) {
              return brick(column, row);
            }),
          );
        }));
  }
}
