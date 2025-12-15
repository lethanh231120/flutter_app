import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../core/constants/colors.dart';
import '../features/home/home_page.dart';
// import '../features/trip_route/trip_route.dart';
// import '../features/message/message.dart';
// import '../features/profile/profile.dart';

class MainLayout extends StatefulWidget {
  // final int initialIndex;
  // const MainLayout({super.key, this.initialIndex = 0});
  final Widget child; // ← go_router sẽ tự nhét page vào đây
  const MainLayout({required this.child, super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  // late int _selectedIndex;
  int _currentIndex = 0;
  final GlobalKey<NavigatorState> homeNavKey = GlobalKey<NavigatorState>();
  late Widget child;
  late final List<Widget> _pages;

  @override
  // void initState() {
  //   super.initState();
  //   _selectedIndex = widget.initialIndex;
  //   _pages = [
  //     HomeNavigator(navigatorKey: homeNavKey),
  //     // HomePage(),
  //     const Placeholder(), // TripRoute
  //     const Placeholder(), // Message
  //     const Placeholder(), // Profile
  //   ];
  // }
  int _getCurrentIndex(BuildContext context) {
    final path = GoRouterState.of(context).uri.path;
    if (path.startsWith('/home')) return 0;
    if (path.startsWith('/trips')) return 1;
    if (path.startsWith('/messages')) return 2;
    if (path.startsWith('/profile')) return 3;
    return 0;
  }

  void _onItemTapped(int index) {
    setState(() => _currentIndex = index);
    switch (index) {
      case 0:
        context.push('/home');
        break;
      case 1:
        context.push('/trips');
        break;
      case 2:
        context.push('/chat');
        break;
      case 3:
        context.push('/profile');
        break;
    }
    // if (_selectedIndex == index && index == 0) {
    //   if (homeNavKey.currentState != null) {
    //     homeNavKey.currentState!.popUntil((route) => route.isFirst);
    //   }
    // } else {
    //   setState(() {
    //     _selectedIndex = index;
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      // body: SafeArea(
      //   top: false,
      //   bottom: false,
      //   child: IndexedStack(index: _selectedIndex, children: _pages),
      // ),
      body: widget.child,
      bottomNavigationBar: SizedBox(
        height: 93,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: Theme(
            data: Theme.of(context).copyWith(
              splashFactory: NoSplash.splashFactory, // tắt ripple
              highlightColor: Colors.transparent, // tắt highlight
            ),
            child: BottomNavigationBar(
              backgroundColor: AppColors.primary,
              type: BottomNavigationBarType.fixed, // luôn hiển thị label
              // currentIndex: _selectedIndex,
              // currentIndex: _currentIndex,
              currentIndex: _getCurrentIndex(context),
              selectedItemColor: AppColors.white,
              unselectedItemColor: Colors.grey,
              showUnselectedLabels: true,
              onTap: _onItemTapped,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Trang chủ",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.lock_clock),
                  label: "Chuyến đi",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.chat),
                  label: "Tin nhắn",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: "Tài khoản",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
