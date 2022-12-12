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
      home: NavRailExample(),
    );
  }
}

class NavRailExample extends StatefulWidget {
  @override
  _NavRailExampleState createState() => _NavRailExampleState();
}

class _NavRailExampleState extends State<NavRailExample> {
  List<NavigationRailDestination> _buildDestinations() {
    return [
      NavigationRailDestination(
        icon: Icon(Icons.home),
        label: Text('Home'),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.favorite),
        label: Text('Favorites'),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.logout),
        label: Text('Logout'),
      ),
    ];
  }
  int selectedIndex = 0;
  bool toggle = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Row(
          children: <Widget>[
            NavigationRail(
          selectedIndex: selectedIndex,
          minExtendedWidth: 150,
          destinations: _buildDestinations(),
          extended: toggle,
          leading: InkWell(
            onTap: () {
              setState(() => toggle = !toggle);
            },
            child: 
            Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              //Icon(!extended ? Icons.arrow_back : Icons.arrow_forward)
              Container(
            //padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
            child: Icon(!toggle ? Icons.arrow_back : Icons.arrow_forward),
          ),
            ],
          ),
          ),
          onDestinationSelected: (int index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ),
            Expanded(
                child: Container(
              color: Color(0xff28282e),
              child: Center(
                child: Text("Selected index is $selectedIndex"),
              ),
            )),
          ],
        ),
      ),
    );
  }
}


