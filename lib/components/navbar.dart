import 'package:flutter/material.dart';

class CustomNavbar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onItemTapped;

  const CustomNavbar({
    super.key,
    required this.currentIndex,
    required this.onItemTapped,
  });

  @override
  State<CustomNavbar> createState() => _CustomNavbarState();
}

class _CustomNavbarState extends State<CustomNavbar> {
  late int _hoverIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF2EAF5),
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
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final bool isHovered = _hoverIndex == index;
    final bool isSelected = widget.currentIndex == index;
    return MouseRegion(
      onEnter: (_) => setState(() => _hoverIndex = index),
      onExit: (_) => setState(() => _hoverIndex = -1),
      child: GestureDetector(
        onTap: () => widget.onItemTapped(index),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
              decoration: BoxDecoration(
                color: (isSelected || isHovered) ? const Color(0xFFE2D6E8) : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(
                icon,
                size: 26,
                color: (isSelected || isHovered) ? Colors.black : Colors.black54,
              ),
            ),
            const SizedBox(height: 4),
            Text(label, style: const TextStyle(fontSize: 10, color: Colors.black)),
          ],
        ),
      ),
    );
  }
}
