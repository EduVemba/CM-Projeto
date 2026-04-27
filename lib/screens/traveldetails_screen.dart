import 'package:flutter/material.dart';
import '../components/navbar.dart';

class TravelDetails extends StatefulWidget {
  const TravelDetails({super.key});

  @override
  State<TravelDetails> createState() => _TravelDetailsState();
}

class _TravelDetailsState extends State<TravelDetails> {
  final _noteController = TextEditingController();

  int _currentRating = 3; // Valor inicial
  int _currentIndex = 1;

  final List<String> _selectedHighlights = ['Gastronomia', 'Arquitetura'];
  final List<String> _allHighlights = ['Gastronomia', 'Arquitetura', 'Cultura', 'Natureza'];

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
                  const Text(
                    'Berlin, Germany',
                    style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w400),
                  ),
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
                  behavior: const ScrollBehavior().copyWith(overscroll: false),
                  child: SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    child: Column(
                      children: [
                        const SizedBox(height: 30),
                        
                        const Text('RANK', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54)),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(5, (index) {
                            final int starValue = index + 1;
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (_currentRating == starValue) {
                                    _currentRating = 0; // Desmarca se clicar na mesma
                                  } else {
                                    _currentRating = starValue;
                                  }
                                });
                              },
                              child: Icon(
                                index < _currentRating ? Icons.star : Icons.star_border,
                                size: 40,
                                color: index < _currentRating ? Colors.black87 : Colors.black26,
                              ),
                            );
                          }),
                        ),

                        const SizedBox(height: 30),

                        const Text('DESTAQUES', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54)),
                        const SizedBox(height: 15),
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: _allHighlights.map((highlight) {
                            final bool isSelected = _selectedHighlights.contains(highlight);
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (isSelected) {
                                    _selectedHighlights.remove(highlight);
                                  } else {
                                    _selectedHighlights.add(highlight);
                                  }
                                });
                              },
                              child: _buildChip(highlight, isSelected),
                            );
                          }).toList(),
                        ),

                        const SizedBox(height: 40),

                        const Text('NOTA', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54)),
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

                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF27A87A),
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(vertical: 15),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                  elevation: 0,
                                ),
                                child: const Text('EDITAR'),
                              ),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF2A2A2A),
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(vertical: 15),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                  elevation: 0,
                                ),
                                child: const Text('REMOVER'),
                              ),
                            ),
                          ],
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
              onItemTapped: (index) => setState(() => _currentIndex = index),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChip(String label, bool isSelected) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF27A87A) : const Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isSelected ? Icons.check : Icons.add, 
            color: isSelected ? Colors.white : Colors.black38, 
            size: 16
          ),
          const SizedBox(width: 4),
          Text(
            label, 
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black38, 
              fontSize: 13,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            )
          ),
        ],
      ),
    );
  }
}