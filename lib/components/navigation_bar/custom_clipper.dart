import 'package:efgecom/config/theme_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Clipper extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {

    final paint = Paint()..style = PaintingStyle.stroke..strokeWidth = 2.0..color = irisOrange;
    final paint1 = Paint()..style = PaintingStyle.stroke..strokeWidth = 3.0..color = const Color(0xFFEFF4FF);
    final path = Path();
    final path1 = Path();

    path.addRRect(RRect.fromLTRBR(size.width * 0.02,size.height * 0.4,size.width * 0.98,size.height,const Radius.circular(15)));
    path.moveTo(size.width * 0.38, size.height * 0.4);
    path.quadraticBezierTo(size.width * 0.41, size.height * 0.02, size.width * 0.5, size.height * 0.01);
    path.quadraticBezierTo(size.width * 0.59, size.height * 0.02, size.width * 0.62, size.height * 0.4);

    path.moveTo(size.width * 0.38, size.height * 0.4);
    path.lineTo(size.width * 0.62, size.height * 0.4);
    canvas.drawPath(path,paint);
    path.close();
    canvas.drawPath(path,paint);

    path1.moveTo(size.width * 0.3835, size.height * 0.4);
    path1.lineTo(size.width * 0.6165, size.height * 0.4);
    path1.close();
    canvas.drawPath(path1,paint1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
class CustomClipperDown extends CustomClipper<Path>{

  @override
  Path getClip(Size size) {
    var x = size.width;
    var y = size.height;

    print(x);
    print(y);
    var path = Path();
    path.moveTo(0.0, y * 0.55);
    path.quadraticBezierTo(0.0, y * 0.36, x * 0.1, y * 0.405);
    path.lineTo(x * 0.3, y * 0.4);
    path.quadraticBezierTo(x * 0.35, y * 0.4, x * 0.37,y * 0.355);
    path.quadraticBezierTo(x * 0.41,y * 0.077, x * 0.49, y * 0.068);// control point 1 curve left middle
    path.quadraticBezierTo(x * 0.57, y * 0.105, x * 0.6, y * 0.35); //control point 3 curve right middle
    path.quadraticBezierTo(x * 0.6, y * 0.39, x * 0.65, y * 0.4);
    path.lineTo(x * 0.93, y * 0.4);//cornerCurveStarting point
    path.quadraticBezierTo(x, y * 0.4, x, y * 0.6);
    //path.lineTo(x, y * 0.37);//rightUp
    path.lineTo(x, y);//bottomRight
    path.lineTo(0.0, y);//bottomLeft

    path.close();
    return path;

  }
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
class CustomClipperUp extends CustomClipper<Path>{

  @override
  Path getClip(Size size) {
    var x = size.width;
    var y = size.height;

    print(x);
    print(y);
    var path = Path();
    path.moveTo(0.0, y * 0.58);
    path.quadraticBezierTo(0.0, y * 0.35, x * 0.1, y * 0.402);
    path.lineTo(x * 0.3, y * 0.4);
    path.quadraticBezierTo(x * 0.35, y * 0.4, x * 0.37,y * 0.354);
    path.quadraticBezierTo(x * 0.41,y * 0.076, x * 0.48, y * 0.045);// control point 1 curve left middle
    path.quadraticBezierTo(x * 0.565, y * 0.07, x * 0.6, y * 0.35); //control point 3 curve right middle
    path.quadraticBezierTo(x * 0.6, y * 0.39, x * 0.65, y * 0.4);
    path.lineTo(x * 0.93, y * 0.4);//cornerCurveStarting point
    path.quadraticBezierTo(x, y * 0.4, x, y * 0.6);
    //path.lineTo(x, y * 0.37);//rightUp
    path.lineTo(x, y);//bottomRight
    path.lineTo(0.0, y);//bottomLeft

    path.close();
    return path;

  }
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}

