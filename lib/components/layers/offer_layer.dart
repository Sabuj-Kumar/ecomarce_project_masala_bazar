import 'package:flutter/cupertino.dart';

import '../../config/theme_config.dart';

class OfferLayer extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    Paint paint0 = Paint()
      ..color = offers.withOpacity(0.5)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;


    Path path0 = Path();
    path0.moveTo(size.width*0.1098901,0);
    path0.quadraticBezierTo(size.width*0.1902747,size.height*0.4591667,size.width*0.4065934,size.height*0.7333333);
    path0.quadraticBezierTo(size.width*0.5667582,size.height*0.9275833,size.width,size.height*0.9083333);
    path0.lineTo(size.width,0);
    path0.lineTo(size.width*0.1098901,0);
    path0.close();

    canvas.drawPath(path0, paint0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}


