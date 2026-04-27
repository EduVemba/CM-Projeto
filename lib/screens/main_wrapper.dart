import 'package:flutter/material.dart';
import '../components/navbar.dart';
import 'home/map_screen.dart';
import 'travel/mytravels_screen.dart';
import 'connections/connections_screen.dart';
import 'perfil/profile_screen.dart';

class MainWrapper extends StatefulWidget {
  final int initialIndex;
  const MainWrapper({super.key, this.initialIndex = 0});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  void _onItemTapped(int index) {
    if (index == _currentIndex) return;
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // O Scaffold externo controla a cor de fundo base para evitar flashes brancos
      backgroundColor: _currentIndex == 3 ? const Color(0xFF2A2A2A) : const Color(0xFF3DBE7A),
      body: Column(
        children: [
          Expanded(
            child: IndexedStack(
              index: _currentIndex,
              children: const [
                MapScreen(isWrapped: true),
                MyTravels(isWrapped: true),
                ConnectionsScreen(isWrapped: true),
                ProfileScreen(isWrapped: true),
              ],
            ),
          ),
          CustomNavbar(
            currentIndex: _currentIndex,
            onItemTapped: _onItemTapped,
          ),
        ],
      ),
    );
  }
}
