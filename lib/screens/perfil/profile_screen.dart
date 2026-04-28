import 'package:flutter/material.dart';
import 'package:projeto/screens/perfil/editprofile_screen.dart';
import '../../components/navbar.dart';
import '../home/map_screen.dart';
import '../travel/mytravels_screen.dart';
import '../connections/connections_screen.dart';

class ProfileScreen extends StatefulWidget {
  final bool isWrapped;
  const ProfileScreen({super.key, this.isWrapped = false});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _currentIndex = 3;

  void _onItemTapped(int index) {
    if (index == _currentIndex) return;
    if (widget.isWrapped) return;

    Widget nextScreen;
    switch (index) {
      case 0:
        nextScreen = const MapScreen();
        break;
      case 1:
        nextScreen = const MyTravels();
        break;
      case 2:
        nextScreen = const ConnectionsScreen();
        break;
      case 3:
        nextScreen = const ProfileScreen();
        break;
      default:
        return;
    }

    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => nextScreen,
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2A2A2A),
      body: SafeArea(
        bottom: !widget.isWrapped,
        child: Column(
          children: [
            Container(
              color: const Color(0xFF3DBE7A),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Perfil',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                       Navigator.push(context, 
                        PageRouteBuilder(
                          transitionDuration: const Duration(milliseconds: 800),
                          pageBuilder: (context, animation, secondaryAnimation) => EditProfile(),
                          transitionsBuilder: (context, animation, secondaryAnimation, child) {
                            var slideAnimation = Tween<Offset>(
                              begin: const Offset(1, 0),
                              end: Offset.zero,
                            ).animate(CurvedAnimation(parent: animation, curve: Curves.easeInOut));

                            var fadeAnimation = Tween<double>(begin: 0.7, end: 1.0)
                                .animate(CurvedAnimation(parent: animation, curve: Curves.easeInOut));

                            return FadeTransition(
                              opacity: fadeAnimation,
                              child: SlideTransition(
                                position: slideAnimation,
                                child: child,
                              ),
                            );
                          },
                        ),
                      );
                    },
                    child: const Text(
                      'edit',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Container(
                color: const Color(0xFF2A2A2A),
                child: Column(
                  children: [
                    const SizedBox(height: 32),
                    Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        color: const Color(0xFFD8D0F0),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white12, width: 2),
                      ),
                      child: const Icon(
                        Icons.person_outline,
                        size: 50,
                        color: Color(0xFF8B7FC7),
                      ),
                    ),
                    const SizedBox(height: 14),
                  ],
                ),
              ),
            ),

            if (!widget.isWrapped)
              CustomNavbar(
                currentIndex: _currentIndex,
                onItemTapped: _onItemTapped,
              ),
          ],
        ),
      ),
    );
  }
}