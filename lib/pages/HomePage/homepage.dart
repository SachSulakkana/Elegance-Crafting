import 'package:first_project/extras/colors.dart';
import 'package:first_project/pages/Catogary/CraftCatogary.dart';
import 'package:first_project/pages/account/accountPage.dart';
import 'package:first_project/pages/cart/cart_history.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';


import 'MainPage.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex =0;
  late PersistentTabController _controller;



  List pages=[
    MainPage(),
    CraftCatogary(),
    CartHistory(),
    AccountPage(),

  ];

  void onTapnav(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState(){
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() {
    return [
      MainPage(),
      CraftCatogary(),
      CartHistory(),
      AccountPage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home_outlined),
        //title: ("Home"),
        activeColorPrimary: AppColors.navipink,
        inactiveColorPrimary: AppColors.signColor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.category),
        //title: ("Chat"),
        activeColorPrimary: AppColors.navipink,
        inactiveColorPrimary: AppColors.signColor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.shopping_cart_outlined),
        //title: ("Cart"),
        activeColorPrimary: AppColors.navipink,
        inactiveColorPrimary: AppColors.signColor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person_rounded),
        //title: ("Profile"),
        activeColorPrimary:AppColors.navipink,
        inactiveColorPrimary: AppColors.signColor,
      ),
    ];
  }

  /*@override
  Widget build(BuildContext context) {
    return Scaffold(
      body:pages[_selectedIndex] ,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.navipink,
        unselectedItemColor: AppColors.signColor,
        showSelectedLabels: false,
        showUnselectedLabels:false ,
        selectedFontSize: 0.0,
        unselectedFontSize: 0.0,
        currentIndex:_selectedIndex ,
        onTap: onTapnav ,


        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label:"Home" ,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_customize_outlined),
            label:"Customize" ,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label:"Cart" ,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded),
            label:"Profile" ,
          ),

        ],
      ),

      //--------------------------bottom navigation bar--------------------------------

    );
  }*/

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: AppColors.naviwhite, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style6, // Choose the nav bar style with this property.
    );
  }
}

