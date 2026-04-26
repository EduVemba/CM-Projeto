import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  int _currentIndex = 3; // Índice do Perfil selecionado na barra
  int _hoverIndex = -1;
  
  final _nameController = TextEditingController(text: 'Karlos Sousa');
  final _emailController = TextEditingController(text: 'sousafulano@gmail.com');
  final _passController = TextEditingController(text: '************');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3DBE7A), // Cor verde do topo
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Center(
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    const CircleAvatar(
                      radius: 60,
                      backgroundColor: Color(0xFFE2D6E8), // Cor lilás claro do design
                      child: Icon(Icons.person, size: 80, color: Colors.white),
                    ),
                    // Ícone de editar sobre a foto
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.edit_note, color: Colors.white, size: 32),
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 35),
                decoration: const BoxDecoration(
                  color: Color(0xFF424242), // Cor cinza escuro do Frame 7
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLabel("Name"),
                      _buildTextField(_nameController),
                      const SizedBox(height: 20),
                      
                      _buildLabel("Email"),
                      _buildTextField(_emailController),
                      const SizedBox(height: 20),
                      
                      _buildLabel("Password"),
                      _buildTextField(_passController),
                      
                      const SizedBox(height: 60),

                      // BOTÕES CANCEL / SAVE
                      Row(
                        children: [
                          Expanded(child: _buildButton("Cancel", Colors.grey)),
                          const SizedBox(width: 20),
                          Expanded(child: _buildButton("Save", Colors.grey)),
                        ],
                      ),
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

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 4),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.white70),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.black12, // Leve transparência para destacar o campo
        suffixIcon: const Icon(Icons.edit_note, color: Colors.white, size: 28),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.white38),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.white, width: 1.5),
        ),
      ),
    );
  }

  Widget _buildButton(String text, Color color) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF757575), // Tom de cinza dos botões
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 0,
      ),
      child: Text(text, style: const TextStyle(fontSize: 16)),
    );
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