import 'package:efgecom/config/custom_text_style.dart';
import 'package:efgecom/config/theme_config.dart';
import 'package:efgecom/pages/Product_Details_Page/Widgets/photos_with_cupartino_dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonComments extends StatelessWidget {
  const PersonComments(
      {Key? key,
      this.profileImage,
      this.location,
      this.comments,
      this.imagesUrl,
      this.rating})
      : super(key: key);
  final List<String>? imagesUrl;
  final String? comments;
  final String? location;
  final double? rating;
  final String? profileImage;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.asset("$profileImage"),
          SizedBox(width: 30.w),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$location",
                  style: CustomTextStyle.subHeader2(context).copyWith(
                      color: fuschiaText,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(6, (index) {
                    if (index < 3) {
                      return Icon(Icons.star, size: 10.h, color: irisYellow);
                    }
                    if (index == 3) {
                      return Icon(Icons.star_half, size: 10.h, color: irisYellow);
                    } else if (index == 4) {
                      return Icon(Icons.star_border,
                          size: 10.h, color: irisYellow);
                    } else {
                      return Text(" ($rating)",
                          style: CustomTextStyle.subHeader2(context).copyWith(
                              color: fuschiaText,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400));
                    }
                  }),
                ),
                Text("$comments",
                     style: CustomTextStyle.subHeader2(context).copyWith(
                         color: fuschiaText,
                         fontWeight: FontWeight.w400,
                         fontSize: 12.sp),
                   maxLines: 2,
                   overflow: TextOverflow.ellipsis,
                 ),
                DialogWithPhotos(
                  imageList: imagesUrl,
                  imageHeight: 60.h,
                  imageWidth: 60.w,
                  mainAxisAlignment: MainAxisAlignment.start,
                ),
                SizedBox(height: 20.h)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
