import 'dart:ui';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home: CollapsibleNavBar(),
    );
  }
}

class CollapsibleNavBar extends StatefulWidget {
  @override
  _CollapsibleNavBarState createState() => _CollapsibleNavBarState();
}

class _CollapsibleNavBarState extends State<CollapsibleNavBar> {
  List<NavigationRailDestination> _buildDestinations() {
    return [
      const NavigationRailDestination(
        icon: Icon(Icons.home),
        label: Text('Home'),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.settings),
        label: Text('Settings'),
      ),
    ];
  }
  void collapse(){
    setState(() {
      toggle = !toggle;
    });
  } 
  int selectedIndex = 0;
  bool toggle = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //appBar: AppBar(title: Text("Resource Usage Report Tool")),
        body: Row(
          children: <Widget>[
            NavigationRail(
              selectedIndex: selectedIndex,
              minExtendedWidth: 150,
              minWidth: 50,
              destinations: _buildDestinations(),
              extended: toggle,
              elevation: 100,
              backgroundColor: Colors.grey,
              leading: NavigationRailMenuButton(onPressed: collapse),
              unselectedLabelTextStyle: TextStyle(
                  color: Colors.black,
                ),

                selectedLabelTextStyle: TextStyle(color: Colors.blue),
                selectedIconTheme: IconThemeData(
                  color: Colors.blue,
                ),
              onDestinationSelected: (int index) {
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
            Expanded(
                child: Container(
              color: Colors.white,
              child: Text("Selected index is $selectedIndex")
            )),
          ],
        ),
      ),
    );
  }
}
class NavigationRailMenuButton extends StatelessWidget {

   const NavigationRailMenuButton({super.key, this.onPressed});
   final VoidCallback? onPressed;
   
   @override
   Widget build(BuildContext context) {
    final Animation<double> animation =
        NavigationRail.extendedAnimation(context);
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        return Container(
          padding: EdgeInsets.only(
            left: animation.value *100, //lerpDouble(0, 100, animation.value)!,
          ),
          child: animation.value==0 ? IconButton(
            icon: const Icon(Icons.menu),
            iconSize: 32,
            onPressed: onPressed,
          ) : IconButton(
            icon: const Icon(Icons.arrow_back),
            iconSize: 32,
            onPressed: onPressed,
          ),
        );
      },
    );
  }
}
