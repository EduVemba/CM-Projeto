import 'package:flutter/material.dart';
import '../../components/navbar.dart';
import '../home/map_screen.dart';
import '../connections/connections_screen.dart';
import '../perfil/profile_screen.dart';

class MyTravels extends StatefulWidget {
  const MyTravels({super.key});

  @override
  State<MyTravels> createState() => _MyTravelsState();
}

class _MyTravelsState extends State<MyTravels> {
  int _currentIndex = 1;

  final Map<String, int> _travelRatings = {
    'BRL': 0,
    'TKY': 0,
  };

  void _onItemTapped(int index) {
    if (index == _currentIndex) return;

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
      backgroundColor: const Color(0xFF3DBE7A),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage('https://i.pravatar.cc/150?u=1'),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        'My Travels',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Text(
                        'personal ranking',
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
                child: ScrollConfiguration(
                  behavior: const ScrollBehavior().copyWith(overscroll: false), // Remove efeito de puxar
                  child: ListView(
                    physics: const ClampingScrollPhysics(), // Scroll firme
                    padding: const EdgeInsets.only(top: 10),
                    children: [
                      _buildTravelTile('BRL', 'Germany'),
                      _buildDivider(),
                      _buildTravelTile('TKY', 'Japan'),
                      _buildDivider(),
                    ],
                  ),
                ),
              ),
            ),

            CustomNavbar(
              currentIndex: _currentIndex,
              onItemTapped: _onItemTapped,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTravelTile(String code, String country) {

    int currentRating = _travelRatings[code] ?? 0;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(code, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF2A2A2A))),
                Text(country, style: const TextStyle(fontSize: 14, color: Colors.grey)),
              ],
            ),
          ),
          
          Row(
            children: List.generate(5, (index) {
              final int starValue = index + 1;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    // Se clicar na nota que já tem, desmarca tudo (0)
                    _travelRatings[code] = (currentRating == starValue) ? 0 : starValue;
                  });
                },
                child: Icon(
                  index < currentRating ? Icons.star : Icons.star_border,
                  color: index < currentRating ? Colors.black87 : Colors.black26,
                  size: 26,
                ),
              );
            }),
          ),

          const SizedBox(width: 12),
          _buildActionButton(Icons.add),
          const SizedBox(width: 8),
          _buildActionButton(Icons.edit_note),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(color: Color(0xFF2A2A2A), shape: BoxShape.circle),
      child: Icon(icon, color: Colors.white, size: 22),
    );
  }

  Widget _buildDivider() {
    return const Divider(height: 1, thickness: 1, color: Color(0xFFEEEEEE), indent: 20, endIndent: 20);
  }
}