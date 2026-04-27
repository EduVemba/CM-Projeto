import 'package:flutter/material.dart';
import '../../components/navbar.dart';
import '../home/map_screen.dart';
import '../travel/mytravels_screen.dart';
import '../connections/connections_screen.dart';
import '../perfil/profile_screen.dart';

class AddRankingScreen extends StatefulWidget {
  const AddRankingScreen({super.key});

  @override
  State<AddRankingScreen> createState() => _AddRankingScreenState();
}

class _AddRankingScreenState extends State<AddRankingScreen> {
  final _noteController = TextEditingController();

  int _currentRating = 0; 
  final List<String> _selectedHighlights = ['Gastronomia', 'Arquitetura'];
  final List<String> _allHighlights = [
    'Gastronomia', 'Cultura', 'Natureza', 'Arquitetura', 'Eventos', 'Compras'
  ];

  int _currentIndex = 1;

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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: CircleAvatar(
                      radius: 18,
                      backgroundImage: NetworkImage('https://i.pravatar.cc/150?u=1'),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text('Berlin, Germany', 
                    style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w400)),
                  const Text('ranking', style: TextStyle(color: Colors.white70, fontSize: 14)),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(35), topRight: Radius.circular(35)),
                ),
                child: ScrollConfiguration(
                  behavior: const ScrollBehavior().copyWith(overscroll: false), // Remove o efeito de puxar
                  child: SingleChildScrollView(
                    physics: const ClampingScrollPhysics(), // Garante que a lista não "salte"
                    child: Column(
                      children: [
                        const SizedBox(height: 30),
                        const Text('A TUA NOTA', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54)),
                        const SizedBox(height: 15),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(5, (index) {
                            return GestureDetector(
                              onTap: () => setState(() => _currentRating = index + 1),
                              child: Icon(
                                index < _currentRating ? Icons.star : Icons.star_border,
                                size: 42,
                                color: index < _currentRating ? Colors.black87 : Colors.black26,
                              ),
                            );
                          }),
                        ),

                        const SizedBox(height: 35),
                        const Text('O QUE DESTACAS?', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54)),
                        const SizedBox(height: 20),

                        Wrap(
                          spacing: 10,
                          runSpacing: 12,
                          alignment: WrapAlignment.center,
                          children: _allHighlights.map((label) {
                            final isSelected = _selectedHighlights.contains(label);
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSelected ? _selectedHighlights.remove(label) : _selectedHighlights.add(label);
                                });
                              },
                              child: _buildChip(label, isSelected: isSelected),
                            );
                          }).toList(),
                        ),

                        const SizedBox(height: 40),
                        const Text('NOTA (OPCIONAL)', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54)),
                        const SizedBox(height: 15),
                        TextField(
                          controller: _noteController,
                          maxLines: 4,
                          decoration: InputDecoration(
                            hintText: 'Descrição',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Colors.black12),
                            ),
                          ),
                        ),

                        const SizedBox(height: 30),
                        
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF27A87A),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 18),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              elevation: 0,
                            ),
                            child: const Text('Guardar Ranking', style: TextStyle(fontSize: 16)),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
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

  Widget _buildChip(String label, {required bool isSelected}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF27A87A) : const Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isSelected) ...[
            const Icon(Icons.check, color: Colors.white, size: 16),
            const SizedBox(width: 6),
          ],
          Text(label, style: TextStyle(
            color: isSelected ? Colors.white : Colors.black38,
            fontSize: 13,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          )),
        ],
      ),
    );
  }
}