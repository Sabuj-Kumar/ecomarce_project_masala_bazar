import 'package:efgecom/config/custom_text_style.dart';
import 'package:efgecom/config/theme_config.dart';
import 'package:efgecom/pages/Product_Details_Page/Widgets/photos_with_cupartino_dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../models/reviews_model.dart';

class PersonComments extends StatefulWidget {
  const PersonComments(
      {Key? key,}) : super(key: key);

  @override
  State<PersonComments> createState() => _PersonCommentsState();
}

class _PersonCommentsState extends State<PersonComments> {

  List<String> imageList = [
    "assets/img/bakery.png",
    "assets/img/hilsha.png",
    "assets/img/katla.png",
    "assets/img/meat.png",
    "assets/img/shrimp.png",
    "assets/img/masala.png",
    "assets/img/Snacks.png",
    "assets/img/mbOnline.png",
  ];
  @override
  void initState() {
    _reviewsModel = [
          ReviewsModel(
              id: '1',
              productId: '235',
              name: "Gangnam Style",
              rating: 4.6,
              createdBy: "",
              image: "assets/img/mbOnline.png",
              starCount: 5,
              uploadedImages: imageList,
              comments: ["Guru ghor banaila ki diya dorja janala kisoi nai kmne tumay dekhte pai guru ghor banaila ki diya."],
              currentDate: DateFormat("dd-MM-yyyy").format((DateTime.now())),
          ),
          ReviewsModel(
              id: '1',
              productId: '235',
              name: "Gangnam Style",
              rating: 4.6,
              createdBy: "",
              image: "assets/img/mbOnline.png",
              starCount: 5,
              uploadedImages: imageList,
              comments: ["Guru ghor banaila ki diya dorja janala kisoi nai kmne tumay dekhte pai guru ghor banaila ki diya."],
              currentDate: DateFormat("dd-MM-yyyy").format((DateTime.now())),
          ),
          ReviewsModel(
            id: '1',
            productId: '235',
            name: "Gangnam Style",
            rating: 4.6,
            createdBy: "",
            image: "assets/img/mbOnline.png",
            starCount: 5,
            uploadedImages: imageList,
            comments: ["Guru ghor banaila ki diya dorja janala kisoi nai kmne tumay dekhte pai guru ghor banaila ki diya."],
            currentDate: DateFormat("dd-MM-yyyy").format((DateTime.now())),
          ),
          ReviewsModel(
            id: '1',
            productId: '235',
            name: "Gangnam Style",
            rating: 4.6,
            createdBy: "",
            image: "assets/img/mbOnline.png",
            starCount: 5,
            uploadedImages: imageList,
            comments: ["Guru ghor banaila ki diya dorja janala kisoi nai kmne tumay dekhte pai guru ghor banaila ki diya."],
            currentDate: DateFormat("dd-MM-yyyy").format((DateTime.now())),
          ),
    ];
    // TODO: implement initState
    super.initState();
  }
  List<ReviewsModel> _reviewsModel = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(_reviewsModel.length, (index) => SizedBox(
        height: 200.h,
        child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Image.asset("${_reviewsModel[0].image}"),
                SizedBox(width: 30.w),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${_reviewsModel[0].name}",
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
                        children: List.generate(_reviewsModel[0].starCount!+1, (index) {
                          if (index < 3) {
                            return Icon(Icons.star, size: 10.h, color: irisYellow);
                          }
                          if (index == 3) {
                            return Icon(Icons.star_half, size: 10.h, color: irisYellow);
                          } else if (index == 4) {
                            return Icon(Icons.star_border,
                                size: 10.h, color: irisYellow);
                          } else {
                            return Text(" (${_reviewsModel[0].rating})",
                                style: CustomTextStyle.subHeader2(context).copyWith(
                                    color: fuschiaText,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w400));
                          }
                        }),
                      ),
                      Text(_reviewsModel[0].comments![0],
                        style: CustomTextStyle.subHeader2(context).copyWith(
                            color: fuschiaText,
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      DialogWithPhotos(
                        imageList: _reviewsModel[0].uploadedImages,
                        imageHeight: 60.h,
                        imageWidth: 60.w,
                        mainAxisAlignment: MainAxisAlignment.start,
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ],
            ),
      ),
      )
    );
  }
}
