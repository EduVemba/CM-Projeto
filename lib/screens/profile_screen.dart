import 'package:flutter/material.dart';
import '../components/navbar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2A2A2A),
      body: SafeArea(
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
                    onTap: () {},
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

            CustomNavbar(
              currentIndex: _currentIndex,
              onItemTapped: (index) => setState(() => _currentIndex = index),
            ),
          ],
        ),
      ),
    );
  }
}