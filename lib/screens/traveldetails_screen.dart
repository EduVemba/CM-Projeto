import 'package:flutter/material.dart';

class TravelDetails extends StatefulWidget {
  const TravelDetails({super.key});

  @override
  State<TravelDetails> createState() => _TravelDetailsState();
}

class _TravelDetailsState extends State<TravelDetails> {
  final _noteController = TextEditingController();

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
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 18,
                        backgroundImage: NetworkImage('https://i.pravatar.cc/150?u=1'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Berlin, Germany',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.w400,
                    ),
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
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      
                      // RANK
                      const Text('RANK', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54)),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(5, (index) => 
                          const Icon(Icons.star_border, size: 40, color: Colors.black87)
                        ),
                      ),

                      const SizedBox(height: 30),

                      const Text('DESTAQUES', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54)),
                      const SizedBox(height: 15),
                      Wrap(
                        spacing: 10,
                        children: [
                          _buildChip('Gastronomia'),
                          _buildChip('Arquitetura'),
                        ],
                      ),

                      const SizedBox(height: 40),

                      const Text('NOTA', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54)),
                      const SizedBox(height: 15),
                      TextField(
                        controller: _noteController,
                        maxLines: 4,
                        decoration: InputDecoration(
                          hintText: 'Descrição',
                          hintStyle: const TextStyle(color: Colors.black26),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Colors.black12),
                          ),
                          enabledBorder: OutlineInputBorder(
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

            Container(
              color: const Color(0xFFF2EAF5),
              padding: const EdgeInsets.only(top: 10, bottom: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(Icons.language_outlined, 'Home', false),
                  _buildNavItem(Icons.folder_open_outlined, 'Travels', true),
                  _buildNavItem(Icons.people_outline, 'Connections', false),
                  _buildNavItem(Icons.person_outline, 'Perfil', false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF27A87A),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.check, color: Colors.white, size: 16),
          const SizedBox(width: 4),
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 13)),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isSelected) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.black54, size: 26),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 10, color: Colors.black)),
      ],
    );
  }
}