import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/custom_text_style.dart';
import '../../../config/theme_config.dart';

class CountdownTimerPage extends StatefulWidget {
  final int? flashDealTime;

  CountdownTimerPage({Key? key, required this.flashDealTime}) : super(key: key);

  @override
  _CountdownTimerPageState createState() => _CountdownTimerPageState();
}

class _CountdownTimerPageState extends State<CountdownTimerPage> {
  late CountdownTimerController controller;

  @override
  void initState() {
    super.initState();
    controller =
        CountdownTimerController(endTime: widget.flashDealTime!, onEnd: onEnd);
  }

  void onEnd() {
    print('onEnd');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CountdownTimer(
        controller: controller,
        widgetBuilder: (_, CurrentRemainingTime? time) {
          if (time == null) {
            return Center(
              child: Text(
                "Offer Ends",
                style: CustomTextStyle.bodySmall(context).copyWith(
                  fontSize: 14.sp,
                  color: buttonColor,
                ),
              ),
            );
          }
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildTimeCard(time: time.days.toString() != 'null' ? time.days.toString() : '00', header: 'Days'),
              SizedBox(width: 13.w,),
              buildTimeCard(time: time.hours.toString() != 'null' ? time.hours.toString() : '00', header: 'Hours'),
              SizedBox(width: 13.w,),
              buildTimeCard(time: time.min.toString() != 'null' ? time.min.toString() : '00', header: 'Minutes'),
              SizedBox(width: 13.w,),
              buildTimeCard(time: time.sec.toString() != 'null' ? time.sec.toString() : '00', header: 'Seconds'),

            ],
          );
        },
      ),
    );
  }

  Widget buildTimeCard({required String time, required String header}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      width: 70.w,
      decoration: BoxDecoration(
          color: offers,
          borderRadius: BorderRadius.circular(counterCurve.r)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            time.toString(), style: CustomTextStyle.bodySmall(context).copyWith(color: Colors.white),
          ),
          SizedBox(width: 3.w,),
          Text(
            header, style: CustomTextStyle.linkText(context).copyWith(color: Colors.white, fontWeight: FontWeight.w300),
          ),

        ],
      ),
    );
  }


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}