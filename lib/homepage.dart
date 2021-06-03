import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'pages/sessions.dart';
import 'pages/groups.dart';
import 'pages/profile.dart';
import 'pages/create.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var index = 0;
  void _onNavbarPress(int index) {
    print(index);

    setState(() {
      this.index = index;
    });
  }

  final _pages = [
    SessionsScreen(),
    GroupsScreen(),
    ProfileScreen(),
    CreateScreen()
  ];

  // var onToday;
  // void onTodayPress() {
  //   setState(() {
  //     onToday = true;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        primary: true,
        backgroundColor: Theme.of(context).colorScheme.background,
        //appBar: CustomAppBar(),
        body: _pages[index],
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32.0),
            topRight: Radius.circular(32.0),
          ),
          child: Theme(
            data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: BottomNavigationBar(
              currentIndex: index,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Theme.of(context).colorScheme.surface,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(top: 8.0, left: 12.0),
                    child: Icon(
                      Icons.sports_esports,
                      color: Theme.of(context).colorScheme.onBackground,
                      size: 28,
                    ),
                  ),
                  activeIcon: Padding(
                    padding: EdgeInsets.only(top: 8.0, left: 12.0),
                    child: SizedBox(
                      width: 64,
                      height: 40,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(33),
                        ),
                        child: Icon(
                          Icons.sports_esports,
                          color: Theme.of(context).colorScheme.onPrimary,
                          size: 28,
                        ),
                      ),
                    ),
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Icon(
                      Icons.grid_view,
                      color: Theme.of(context).colorScheme.onBackground,
                      size: 28,
                    ),
                  ),
                  activeIcon: Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: SizedBox(
                      width: 64,
                      height: 40,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(33),
                        ),
                        child: Icon(
                          Icons.grid_view,
                          color: Theme.of(context).colorScheme.onPrimary,
                          size: 28,
                        ),
                      ),
                    ),
                  ),
                  label: 'Groups',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Icon(
                      Icons.perm_identity,
                      color: Theme.of(context).colorScheme.onBackground,
                      size: 28,
                    ),
                  ),
                  activeIcon: Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: SizedBox(
                      width: 64,
                      height: 40,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(33),
                        ),
                        child: Icon(
                          Icons.perm_identity,
                          color: Theme.of(context).colorScheme.onPrimary,
                          size: 28,
                        ),
                      ),
                    ),
                  ),
                  label: 'Profile',
                ),
                BottomNavigationBarItem(
                  activeIcon: Padding(
                    padding: EdgeInsets.only(top: 8.0, right: 12.0),
                    child: SizedBox(
                      width: 64,
                      height: 40,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(33),
                        ),
                        child: Icon(
                          Icons.add,
                          color: Theme.of(context).colorScheme.onPrimary,
                          size: 28,
                        ),
                      ),
                    ),
                  ),
                  icon: Padding(
                    padding: EdgeInsets.only(top: 8.0, right: 12.0),
                    child: SizedBox(
                      height: 40,
                      width: 64,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).colorScheme.onBackground,
                            width: 1.3,
                          ),
                          borderRadius: BorderRadius.circular(33),
                        ),
                        child: Icon(
                          Icons.add,
                          color: Theme.of(context).colorScheme.onBackground,
                          size: 28,
                        ),
                      ),
                    ),
                  ),
                  label: 'Add',
                ),
              ],
              showSelectedLabels: false,
              showUnselectedLabels: false,
              onTap: _onNavbarPress,
            ),
          ),
        ),
      ),
    );
  }
}
