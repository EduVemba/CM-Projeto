import 'package:flutter/material.dart';

class MyTravels extends StatefulWidget {
  const MyTravels({super.key});

  @override
  State<MyTravels> createState() => _MyTravelsState();
}

class _MyTravelsState extends State<MyTravels> {
  int _currentIndex = 1;
  int _hoverIndex = -1;

  final Map<String, int> _travelRatings = {
    'BRL': 0,
    'TKY': 0,
  };

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
                  Align(
                    alignment: Alignment.centerLeft,
                    child: const CircleAvatar(
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

            Container(
              decoration: const BoxDecoration(color: Color(0xFFF2EAF5)),
              padding: const EdgeInsets.only(top: 10, bottom: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(Icons.language_outlined, 'Home', 0),
                  _buildNavItem(Icons.folder_open_outlined, 'Travels', 1),
                  _buildNavItem(Icons.people_outline, 'Connections', 2),
                  _buildNavItem(Icons.person_outline, 'Perfil', 3),
                ],
              ),
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

  Widget _buildNavItem(IconData icon, String label, int index) {
    final bool isHovered = _hoverIndex == index;
    final bool isSelected = _currentIndex == index;

    return MouseRegion(
      onEnter: (_) => setState(() => _hoverIndex = index),
      onExit: (_) => setState(() => _hoverIndex = -1),
      child: GestureDetector(
        onTap: () => setState(() => _currentIndex = index),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                color: (isSelected || isHovered) ? const Color(0xFFE2D6E8) : Colors.transparent,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(
                icon,
                size: 26,
                color: (isSelected || isHovered) ? Colors.black : Colors.black54,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}