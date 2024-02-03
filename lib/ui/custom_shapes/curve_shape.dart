import 'package:flutter/material.dart';
import 'package:new_project/theme/styles.dart';

class CurveShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * -1.850467, size.height * -0.07490637);
    path_0.cubicTo(
        size.width * -1.850467,
        size.height * -0.07904345,
        size.width * -1.848376,
        size.height * -0.08239700,
        size.width * -1.845794,
        size.height * -0.08239700);
    path_0.lineTo(size.width * 1.575514, size.height * -0.08239700);
    path_0.cubicTo(
        size.width * 1.578096,
        size.height * -0.08239700,
        size.width * 1.580187,
        size.height * -0.07904345,
        size.width * 1.580187,
        size.height * -0.07490637);
    path_0.lineTo(size.width * 1.580187, size.height);
    path_0.cubicTo(
        size.width * 1.580187,
        size.height,
        size.width * 1.509037,
        size.height * 0.4358951,
        size.width * 1.149421,
        size.height * 0.4588015);
    path_0.cubicTo(
        size.width * 0.7898014,
        size.height * 0.4817041,
        size.width * 0.4452944,
        size.height * 0.8994232,
        size.width * 0.2130841,
        size.height * 0.8614906);
    path_0.cubicTo(
        size.width * -0.2212736,
        size.height * 0.7905356,
        size.width * 0.1446766,
        size.height * 0.4165581,
        size.width * -0.6071776,
        size.height * 0.4165581);
    path_0.cubicTo(
        size.width * -1.309285,
        size.height * 0.4165581,
        size.width * -1.784294,
        size.height * 0.7077079,
        size.width * -1.844079,
        size.height * 0.7462360);
    path_0.cubicTo(
        size.width * -1.847185,
        size.height * 0.7482360,
        size.width * -1.850467,
        size.height * 0.7444831,
        size.width * -1.850467,
        size.height * 0.7391161);
    path_0.lineTo(size.width * -1.850467, size.height * -0.07490637);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = MyStyles.themeData().primaryColor.withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
