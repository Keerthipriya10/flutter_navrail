import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
class AnimatedRaillWidget extends StatelessWidget {
  final Widget child;

  const AnimatedRaillWidget({
    required this.child,
    required Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animation = NavigationRail.extendedAnimation(context);

    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) => Container(
        height: 56,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: FloatingActionButton.extended(
            backgroundColor: Colors.red,
            label: Text("child"),
            isExtended: animation.status != AnimationStatus.dismissed,
            onPressed: () {},
          ),
        ),
      ),
      child: child,
    );
  }
}
//ExtentedLeading(onPressed: oncl,),
              /*AnimatedRailWidget(
                onpre: oncl,
                child: const Icon(Icons.logout, color: Colors.white),
              ),*/
              /* 
              Container(
                padding: EdgeInsets.only(right: 0),
                child: IconButton(
                
                          icon : !toggle ? const Icon(Icons.arrow_back) : const Icon(Icons.arrow_forward),
                          onPressed: (() {
                            setState(() {
                              toggle= !toggle;
                            });
                          }),
                          ),
              ),*/
                        /*Row(
                children: [
                  //Icon(!extended ? Icons.arrow_back : Icons.arrow_forward)
                  // Text(toggle ? "RURT":"") ,
                  Container(
                    //padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                    child: 
                  ),
                ],
              ),*/
              
/**
 *Widget build(BuildContext context){
  final Animation<double> animation = NavigationRail.extendedAnimation(context);
  return AnimatedBuilder(animation: animation,builder: ((context, child) {
    return Container(
      height: 56,
      padding: EdgeInsets.symmetric(vertical: lerpDouble(0, 6, animation.value)!,
      ),
      child: animation.value == 0 ? FloatingActionButton(onPressed: (() {
        
      }),
      child: Icon(Icons.add),
      ) :  Align(
        alignment: AlignmentDirectional.centerStart,
        widthFactor: animation.value,
        child: Padding(padding: const EdgeInsetsDirectional.only(start:8),
        child: FloatingActionButton.extended(onPressed: (){}, label: Text("Create"),icon: Icon(Icons.add),),
        ),
      )
    );
  }),);
}
 */

/*

class ExtentedLeading extends StatelessWidget{
  ExtentedLeading({super.key,this.onPressed});
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context){
  final Animation<double> animation = NavigationRail.extendedAnimation(context);
  return AnimatedBuilder(animation: animation,
  builder: ((context, child) {
    return Container(
      height: 56,
      padding: EdgeInsets.symmetric(vertical: lerpDouble(0, 6, animation.value)!,
      ),
      child: animation.value == 0 ? IconButton(
            icon: const Icon(Icons.menu),
            iconSize: 32,
            onPressed: onPressed,
          ) /*FloatingActionButton(onPressed: onPressed,
      child: Icon(Icons.menu),
      )*/ :  Align(
        alignment: AlignmentDirectional.centerStart,
        widthFactor: animation.value,
        child: Padding(
          padding: const EdgeInsets.only(left:8.0),
          child: IconButton(
            padding: EdgeInsets.all(0),
              icon: const Icon(Icons.arrow_back),
              iconSize: 32,
              onPressed: onPressed,
            ),
        ),
      )
    );
  }),);
}

}
class AnimatedRailWidget extends StatelessWidget {
  final Widget child;
  final VoidCallback onpre;
  const AnimatedRailWidget({
    required this.child,
    required this.onpre
  });


  @override
  Widget build(BuildContext context) {
    final animation = NavigationRail.extendedAnimation(context);

    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) => Container(
        height: 56,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: FloatingActionButton.extended(
            backgroundColor: Colors.red,
            label: child?? Icon(Icons.arrow_back),
            isExtended: animation.status != AnimationStatus.dismissed,
            onPressed: onpre,
          ),
        ),
      ),
      child: child,
    );
  }
}

 */