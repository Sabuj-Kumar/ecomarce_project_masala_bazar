import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DragAbleList extends StatelessWidget {
  const DragAbleList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return DraggableScrollableSheet(
      initialChildSize: 0.6.h,
        maxChildSize: 0.88.h,
        minChildSize: 0.3.h,
        builder: (context, scrollController) => ClipRRect(
          borderRadius: BorderRadius.only(topRight:Radius.circular(24.r),topLeft: Radius.circular(24.r) ),
          child: Container(
            color: Theme.of(context).backgroundColor,
            child: ListView(
              controller: scrollController,
              children: [
                Column(
                  children: [
                    SizedBox(height: 33.73.h,),
                    Text("Product Title"),
                    Container(
                      color: Colors.purple,
                      height: height * 0.3,
                      width: width,
                    ),
                    Container(
                      color: Colors.blue,
                      height: height * 0.3,
                      width: width,
                    ),
                    Container(
                      color: Colors.green,
                      height: height * 0.3,
                      width: width,
                    ),
                  ],
                ),
                Divider(color: Colors.deepPurpleAccent,height: 21.h,thickness: 1,),
                Column(
                  children: [
                    Container(
                      color: Colors.red,
                      height: height * 0.3,
                      width: width,
                    ),
                    Container(
                      color: Colors.yellow,
                      height: height * 0.3,
                      width: width,
                    ),
                    Container(
                      color: Colors.black,
                      height: height * 0.3,
                      width: width,
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
