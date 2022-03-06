import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/theme_config.dart';

class KeyDescription extends StatelessWidget {
  const KeyDescription({Key? key, this.description, this.category, this.tags})
      : super(key: key);
  final List<String>? description;
  final List<String>? category;
  final List<String>? tags;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Key Description",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                  color: fuschiaBlueGem)),
          SizedBox(height: 6.h),
          Text(
            description!.join('\n\n'),
            style: TextStyle(
              color: fuschiaText,
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 20.h),
          SizedBox(
            height: 70.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Categories :     ",
                      style: TextStyle(
                          color: fuschiaText,
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp),
                    ),
                    Text(
                      "Tags              :     ",
                      style: TextStyle(
                          color: fuschiaText,
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp),
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        category!.join(','),
                        style: TextStyle(
                            color: fuschiaText,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp),
                      ),
                      Text(
                        tags!.join(','),
                        style: TextStyle(
                            color: fuschiaText,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 6.h),
          /*SizedBox(height: 6.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Tags      :     ",style: TextStyle(color: fuschiaText,fontWeight: FontWeight.w600,fontSize: 14.sp),),
              Flexible(child: Text(tags!.join(","),maxLines: 2,overflow: TextOverflow.ellipsis,))
            ],
          ),*/
        ],
      ),
    );
  }
}
