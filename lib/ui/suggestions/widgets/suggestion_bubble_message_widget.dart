import 'package:fit_healthy/domain/utils/enums/suggestions_enum.dart';
import 'package:fit_healthy/domain/utils/themes/color_theme.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class SuggestionBubbleMessageWidget extends StatelessWidget {
  const SuggestionBubbleMessageWidget({
    Key? key,
    required this.message,
    required this.suggestion,
  }) : super(key: key);

  final String message;
  final TypeSuggestion suggestion;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8, left: 8, right: 1),
      child: suggestion == TypeSuggestion.physical
          ? Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 170,
                  //height: 140,
                  child: Stack(
                    //fit: StackFit.loose,
                    children: [
                      CustomPaint(
                        //size: const Size(170, 120),
                        painter: PainterPhysicalSuggestion(),
                        child: SizedBox(
                          width: 170,
                          //height: 120,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    message,
                                    style: const TextStyle(fontSize: 10),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Padding(
                                  padding: EdgeInsets.only(right: 24.0),
                                  child: Icon(Icons.favorite, size: 32),
                                ),
                              ],
                            ),
                          ),
                        ),
                        //child: Text('aea'),
                      ),
                      /*Positioned(
                        bottom: 5,
                        left: 90,
                        child: Icon(
                          Icons.favorite,
                          color: Colors.blue.shade700,
                          size: 40,
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        left: 90,
                        child: Icon(
                          Icons.favorite_border,
                          color: Colors.blue.shade700,
                          size: 40,
                        ),
                      ),*/
                    ],
                  ),
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 170,
                  //height: 140,
                  child: Stack(
                    children: [
                      CustomPaint(
                        //size: const Size(170, 120),
                        painter: PainterNutritionalSuggestion(),
                        child: SizedBox(
                          width: 170,
                          //height: 120,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    message,
                                    style: const TextStyle(fontSize: 10),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Padding(
                                  padding: EdgeInsets.only(left: 24.0),
                                  child: Icon(Icons.favorite, size: 32),
                                ),
                              ],
                            ),
                          ),
                        ),
                        //child: Text('aea'),
                      ),
                      /*Positioned(
                        bottom: 5,
                        left: 15,
                        child: Icon(
                          Icons.favorite,
                          color: Colors.red.shade400,
                          size: 40,
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        left: 15,
                        child: Icon(
                          Icons.favorite_border,
                          color: Colors.red.shade400,
                          size: 40,
                        ),
                      ),*/
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}

class PainterPhysicalSuggestion extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = ComplementPalette
          .green.shade800 //Colors.black //ComplementPalette.green.shade800
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final path = Path();
    // mover inicio hacia 5% del ancho total
    path.moveTo(size.width * 0.05, 0);

    // dibujar linea recta superior
    path.lineTo(size.width * 0.9, 0);

    // dibujar curva 1/4 de circulo (primer cuarto sentido horario)
    path.addArc(
      Rect.fromLTWH(
        size.width * 0.85,
        0.0,
        size.width * 0.1,
        size.height * 0.1,
      ),
      3 * pi / 2,
      pi / 2,
    );

    // dibujar linea recta derecha
    path.lineTo(size.width * 0.95, size.height * 0.75);

    // dibujar curva 1/4 de circulo (segundo cuarto sentido horario)
    path.addArc(
      Rect.fromLTWH(
        size.width * 0.85,
        size.height * 0.7,
        size.width * 0.1,
        size.height * 0.1,
      ),
      0,
      pi / 2,
    );

    // path.lineTo(size.width *0.05, size.height * 0.95); BASE

    // dibujar linea recta inferior parte 1
    path.lineTo(size.width * 0.4, size.height * 0.8);

    // curva inferior rara 1
    path.addArc(
      Rect.fromLTWH(
        size.width * 0.05,
        //size.height * 0.65,
        60,
        size.width * 0.35,
        //size.height * 0.3,
        45,
      ),
      0,
      pi / 2,
    );

    // linea rect para volver a la linea recta inferior
    path.lineTo(size.width * 0.230, size.height * 0.80);

    // dibujar linea recta inferior parte 2
    path.lineTo(size.width * 0.05, size.height * 0.80);

    // dibujar curva 1/4 de circulo (tercer cuarto sentido horario)
    path.addArc(
      Rect.fromLTWH(
        0,
        size.height * 0.70,
        size.width * 0.1,
        size.height * 0.1,
      ),
      pi / 2,
      pi / 2,
    );

    // dibujar linea recta izquierda
    path.lineTo(0, size.height * 0.05);

    // dibujar curva 1/4 de circulo (cuarto cuarto sentido horario)
    path.addArc(
      Rect.fromLTWH(
        0,
        0,
        size.width * 0.1,
        size.height * 0.1,
      ),
      pi,
      pi / 2,
    );

    // dibujar tdo en el canvas
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class PainterNutritionalSuggestion extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = ComplementPalette
          .green.shade800 //Colors.black //ComplementPalette.green.shade800
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final path = Path();
    // mover inicio hacia 5% del ancho total
    path.moveTo(size.width * 0.05, 0);

    // dibujar linea recta superior
    path.lineTo(size.width * 0.9, 0);

    // dibujar curva 1/4 de circulo (primer cuarto sentido horario)
    path.addArc(
      Rect.fromLTWH(
        size.width * 0.85,
        0.0,
        size.width * 0.1,
        size.height * 0.1,
      ),
      3 * pi / 2,
      pi / 2,
    );

    // dibujar linea recta derecha
    path.lineTo(size.width * 0.95, size.height * 0.75);

    // dibujar curva 1/4 de circulo (segundo cuarto sentido horario)
    path.addArc(
      Rect.fromLTWH(
        size.width * 0.85,
        size.height * 0.7,
        size.width * 0.1,
        size.height * 0.1,
      ),
      0,
      pi / 2,
    );

    // path.lineTo(size.width *0.05, size.height * 0.95); BASE

    // dibujar linea recta inferior parte 1
    path.lineTo(size.width * 0.70, size.height * 0.8);

    path.lineTo(size.width * 0.70, size.height * 0.95);

    path.addArc(
      Rect.fromLTWH(
        size.width * 0.52,
        size.height * 0.65,
        //90,
        size.width * 0.35,
        size.height * 0.3,
        //45,
      ),
      pi,
      -pi / 2,
    );

    path.moveTo(size.width * 0.51, size.height * 0.8);

    path.lineTo(size.width * 0.05, size.height * 0.8);

    // curva inferior rara 1
    /*path.addArc(
      Rect.fromLTWH(
        size.width * 0.05,
        size.height * 0.80,
        size.width * 0.35,
        size.height * 0.3,
      ),
      0,
      pi / 2,
    );*/

    // linea rect para volver a la linea recta inferior
    //path.lineTo(size.width * 0.230, size.height * 0.95);

    // dibujar linea recta inferior parte 2
    //path.lineTo(size.width * 0.4, size.height * 0.95);

    // dibujar curva 1/4 de circulo (tercer cuarto sentido horario)
    path.addArc(
      Rect.fromLTWH(
        0,
        size.height * 0.7,
        size.width * 0.1,
        size.height * 0.1,
      ),
      pi / 2,
      pi / 2,
    );

    // dibujar linea recta izquierda
    path.lineTo(0, size.height * 0.05);

    // dibujar curva 1/4 de circulo (cuarto cuarto sentido horario)
    path.addArc(
      Rect.fromLTWH(
        0,
        0,
        size.width * 0.1,
        size.height * 0.1,
      ),
      pi,
      pi / 2,
    );

    // dibujar tdo en el canvas
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
