import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/custom_text_style.dart';
import '../../../config/theme_config.dart';

class CountDownTime extends StatefulWidget {
  final int? endTime;
  const CountDownTime({Key? key, this.endTime = 1647348059}) : super(key: key);

  @override/**/
  _CountDownTimeState createState() => _CountDownTimeState();
}

class _CountDownTimeState extends State<CountDownTime> {
  //Duration duration = Duration(days: 15);
  late Duration duration;
  Timer? _timer;
  late DateTime from;
  late DateTime to;
  //late Duration countDownTime;

  //the birthday's date
  final currentDate = DateTime.now();
  late Duration difference;



  @override
  void initState() {
    super.initState();
    final DateTime timeStamp = DateTime.fromMillisecondsSinceEpoch(widget.endTime! * 1000);
    difference = daysBetween(currentDate, DateTime(timeStamp.year, timeStamp.month, timeStamp.day, timeStamp.hour, timeStamp.minute, timeStamp.second));
    duration = Duration(days: difference.inDays);
    startTimer();
  }

  Duration daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day, from.hour, from.minute, from.second);
    to = DateTime(to.year, to.month, to.day, to.hour, to.minute, to.second);
    return (to.difference(from));
  }


  void startTimer(){
    _timer = Timer.periodic(Duration(seconds: 1), (_) => decreaseTime());
  }

  void decreaseTime(){
    final decreaseSecond = -1;
    setState(() {
      final seconds = duration.inSeconds + decreaseSecond;
      if(seconds < 0){
        _timer?.cancel();
      }else {
        duration = Duration(seconds: seconds);
      }
    });
  }

  String twoDigit (int n){
    return n.toString().padLeft(2, '0');
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildTimeCard(time: twoDigit(duration.inDays), header: 'Days'),
          SizedBox(width: 13.w,),
          buildTimeCard(time: twoDigit(duration.inHours.remainder(24)), header: 'Hours'),
          SizedBox(width: 13.w,),
          buildTimeCard(time: twoDigit(duration.inMinutes.remainder(60)), header: 'Minutes'),
          SizedBox(width: 13.w,),
          buildTimeCard(time: twoDigit(duration.inSeconds.remainder(60)), header: 'Seconds'),
        ]
      /*List.generate(
                  4,
                  (index) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.1.h),
                    child: Container(
                        decoration: BoxDecoration(
                            color: offers,
                            borderRadius: BorderRadius.circular(productTileCurve.r)),
                        child: Padding(
                          padding: EdgeInsets.all(7.0.w),
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: value[index] + " ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.sp),
                              ),
                              TextSpan(
                                text: time[index],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.sp,
                                    letterSpacing: 0.2),
                              ),
                            ]),
                          ),
                        )),
                  ),
                )*/
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
            time, style: CustomTextStyle.bodySmall(context).copyWith(color: Colors.white),
          ),
          SizedBox(width: 3.w,),
          Text(
            header, style: CustomTextStyle.linkText(context).copyWith(color: Colors.white, fontWeight: FontWeight.w300),
          ),

        ],
      ),
    );
  }
}
