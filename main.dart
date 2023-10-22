import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: ColorPaletteGenerator(),
  ));
}

class ColorPaletteGenerator extends StatefulWidget {
  @override
  _ColorPaletteGeneratorState createState() => _ColorPaletteGeneratorState();
}

class _ColorPaletteGeneratorState extends State<ColorPaletteGenerator> {
  List<Color> _colorPalette = [];

  void _generatePalette() {
    setState(() {
      _colorPalette = List.generate(5, (index) {
        final random = Random();
        return Color.fromRGBO(
          random.nextInt(256), // Red (0-255)
          random.nextInt(256), // Green (0-255)
          random.nextInt(256), // Blue (0-255)
          1.0, // Opacity (0.0 - 1.0)
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Palette Generator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _generatePalette,
              child: Text('Generate Palette'),
            ),
            SizedBox(height: 20),
            _colorPalette.isNotEmpty
                ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _colorPalette
                  .map(
                    (color) => Container(
                  width: 50,
                  height: 50,
                  color: color,
                ),
              )
                  .toList(),
            )
                : Container(),
          ],
        ),
      ),
    );
  }
}
