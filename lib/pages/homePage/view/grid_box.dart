import 'package:flutter/material.dart';

import '../../../config/theme_config.dart';

class GridTileView extends StatelessWidget {
  const GridTileView({Key? key,this.image,this.productName,this.presentPrice,this.oldPrice,this.rating,this.views,this.bangli}) : super(key: key);
  final String? image;
  final String? productName;
  final int? presentPrice;
  final int? oldPrice;
  final double? rating;
  final int? views;
  final String? bangli;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white
      ),
      child: GridTile(
        child: InkWell(
          onTap: (){
            print("pressed column");
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(image!,height: height * 0.12,width: width * 0.35,),
              Padding(
                padding: EdgeInsets.only(left: width * 0.032),
                child: Text(productName!,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
              ),
              Text(bangli!,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
              SizedBox(height: height * 0.01,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(left: width * 0.025),
                    child: Text("TK-$presentPrice/kg",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: width * 0.1),
                    child: RichText(
                      text: TextSpan(
                        text: "TK-$oldPrice/kg",
                        style: const TextStyle(fontWeight: FontWeight.bold,fontSize:12,color: Colors.grey,decoration: TextDecoration.lineThrough),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(left: width * 0.01),
                    child:  const Icon(Icons.star,color: Colors.yellow,size: 12,),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(right: width * 0.01),
                    child: Text("$rating",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: width * 0.1),
                    child: Text("$views Reviews",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
                  ),
                ],
              )
            ],
          ),
        ),
        footer: InkWell(
          onTap: (){
            print("pressed Cart");
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 4.0,left: 4.0,right: 4.0),
            child: Card(
              elevation: 0,
              color: buttonColor,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text("Add to Cart",style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold),),
                    Icon(Icons.shopping_cart_outlined,color: Colors.white,size: 18,)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
