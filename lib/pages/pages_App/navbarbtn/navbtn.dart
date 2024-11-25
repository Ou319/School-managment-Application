import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ofppt_project/pages/pages_App/agendapage/agendapage.dart';
import 'package:ofppt_project/pages/pages_App/homepage/homePage.dart';
import 'package:ofppt_project/pages/pages_App/ropotpage/ropotpage.dart';

class Navbtn extends StatefulWidget {
  const Navbtn({super.key});

  @override
  State<Navbtn> createState() => _NavbtnState();
}

class _NavbtnState extends State<Navbtn> {
  int _selectedIndex = 0;
  // Create a PageController
  final PageController _pageController = PageController();

  // Store page instances
  final List<Widget> _pages = [
    const Homepage(),
    const Agendapage(),
    const Ropotpage(),
  ];

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Change page when tab is selected
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack( // Wrap the body in a Stack
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            children: _pages, // Pages to be shown when swiped
          ),
          // Your bottom navigation bar with animated position
          AnimatedPositioned(
            duration: const Duration(milliseconds: 600),
            bottom: _selectedIndex == 2 ? -100 : 0, // Moves bottom nav out when on Ropot page
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 80,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(13),
                  topRight: Radius.circular(13),
                ),
              ),
              child: GNav(
                gap: 8,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                backgroundColor: Colors.transparent,
                color: Colors.white,
                activeColor: Colors.white,
                tabBackgroundColor: Colors.black.withOpacity(0.2),
                selectedIndex: _selectedIndex,
                onTabChange: _onTabSelected,
                tabs: const [
                  GButton(icon: Icons.home, text: "Home"),
                  GButton(icon: Icons.assignment_add, text: "Agenda"),
                  GButton(icon: Icons.smart_toy_rounded, text: "Support Chat"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
