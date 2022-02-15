import 'package:efgecom/config/theme_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_clipper.dart';

class NavigationBBar extends StatelessWidget {
  const NavigationBBar({Key? key,required this.onClick,required this.currentPage}) : super(key: key);

  final Function(int) onClick;
  final int currentPage;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    print("Height $height");
    print(width);
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Stack(
            alignment: Alignment.center,
            children: [
              ClipPath(
                clipper: CustomClipperDown(),
                child: Container(
                  height: height * 0.1125,
                  width: width * 0.932,
                  decoration:  BoxDecoration(
                    color: Colors.amberAccent,
                    borderRadius: const BorderRadius.all(Radius.circular(13.0)),
                    border: Border.all(color: Colors.amberAccent),

                  ),
                ),
              ),
              Positioned(
                top: 3.2,
                child: ClipPath(
                  clipper: CustomClipperUp(),
                  child: Container(
                    height: height * 0.1075,
                    width: width * 0.93,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:  const BorderRadius.all(Radius.circular(13.0)),
                      border: Border.all(color: Colors.amberAccent),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 33,left: 12),
                    child: InkWell(
                      onTap: (){
                        onClick(0);
                      },
                      child: Column(
                        children:  [
                          Icon(Icons.home_outlined,size: 25,color:  currentPage != 0? const Color(0xff21305A):primaryColor),
                          Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: Text("HOME",style: TextStyle(color:  currentPage != 0? const Color(0xff21305A):primaryColor,fontSize: 10,),),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: width * 0.015,),
                  Padding(
                    padding: const EdgeInsets.only(top: 33),
                    child: InkWell(
                      onTap: (){
                        onClick(1);
                      },
                      child: Column(
                        children: [
                          Icon(Icons.messenger_outline,size: 25,color: currentPage != 1? const Color(0xff21305A):primaryColor),
                           Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: Text("INBOX",style: TextStyle(color:  currentPage != 1? const Color(0xff21305A):primaryColor,fontSize: 10),),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: width * 0.25,),
                  Padding(
                    padding: const EdgeInsets.only(top: 33),
                    child: InkWell(
                      onTap: (){
                        onClick(3);
                      },
                      child: Column(
                        children: [
                          Icon(Icons.shopping_cart_outlined,size: 25,color: currentPage != 3? const Color(0xff21305A):primaryColor),
                           Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: Text("CART",style: TextStyle(color:  currentPage != 3? const Color(0xff21305A):primaryColor,fontSize: 10,)),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: width * 0.015,),
                  Padding(
                    padding: const EdgeInsets.only(top: 33,right: 13),
                    child: InkWell(
                      onTap: (){
                        onClick(4);
                      },
                      child: Column(
                        children: [
                          Icon(Icons.person,size: 25,color: currentPage != 4? const Color(0xff21305A):primaryColor),
                           Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: Text("PROFILE",style: TextStyle(color:  currentPage != 4? const Color(0xff21305A):primaryColor,fontSize: 10),),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                  top: 12,
                  child: InkWell(
                    onTap: (){
                      onClick(2);
                    },
                    child: Column(
                      children: [
                        Icon(Icons.search_outlined,size: 42,color:  currentPage != 2? const Color(0xff21305A):primaryColor,),
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: Text("WISHLIST",style: TextStyle(color: currentPage != 2? const Color(0xff21305A):primaryColor,fontSize: 10,)),
                        ),
                      ],
                    ),
                  )),
            ]
        ),
      ],
    );
  }
}

