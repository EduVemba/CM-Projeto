import 'package:flutter/material.dart';

class ConnectionsScreen extends StatefulWidget {
  const ConnectionsScreen({super.key});

  @override
  State<ConnectionsScreen> createState() => _ConnectionsScreenState();
}

class _ConnectionsScreenState extends State<ConnectionsScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 2;
  int _hoverIndex = -1;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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
                  const Text(
                    'Connections',
                    style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(height: 15),
                  // BARRA DE PESQUISA
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Buscar Pessoas',
                      hintStyle: const TextStyle(color: Colors.white70, fontSize: 14),
                      prefixIcon: const Icon(Icons.search, color: Colors.white70),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.2),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 0),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              color: const Color(0xFFF2EAF5),
              child: TabBar(
                controller: _tabController,
                indicatorColor: const Color(0xFF3DBE7A),
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black54,
                tabs: const [
                  Tab(icon: Icon(Icons.public, size: 20), text: 'Viagens'),
                  Tab(icon: Icon(Icons.people, size: 20), text: 'Pessoas'),
                  Tab(icon: Icon(Icons.explore_outlined, size: 20), text: 'Explorar'),
                ],
              ),
            ),

            Expanded(
              child: Container(
                color: Colors.white,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildViagensTab(), // Frame 16
                    _buildPessoasTab(), // Frame 17
                    _buildExplorarTab(), // Frame 19
                  ],
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

  Widget _buildViagensTab() {
    return ScrollConfiguration(
      behavior: const ScrollBehavior().copyWith(overscroll: false),
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('recentes das tuas conexões', style: TextStyle(color: Colors.grey, fontSize: 12)),
          const SizedBox(height: 15),
          _buildFeedItem(
            name: 'Ana Lima',
            action: 'adicionou viagem a Tóquio',
            time: '2h',
            content: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color(0xFFF8F9FA),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.black12),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(color: const Color(0xFF3DBE7A), borderRadius: BorderRadius.circular(10)),
                    child: const Center(child: Text('Tóquio, Japão', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (i) => const Icon(Icons.star_border, size: 20)),
                  ),
                  const SizedBox(height: 10),
                  _buildMiniChip('Cultura'),
                  _buildMiniChip('Arquitetura'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPessoasTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text('sugestões para ti', style: TextStyle(color: Colors.grey, fontSize: 12)),
        _buildPersonTile('Ana lima', '14 viagens - Lisboa'),
        _buildPersonTile('Ana lima', '37 viagens - Lisboa'),
      ],
    );
  }

  Widget _buildExplorarTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Row(
          children: [
            const Text('Connections', style: TextStyle(fontWeight: FontWeight.bold)),
            const Spacer(),
            // Avatares empilhados (simulação)
            const CircleAvatar(radius: 12, backgroundColor: Colors.orange),
            const CircleAvatar(radius: 12, backgroundColor: Colors.blue),
            const Text(' +1', style: TextStyle(fontSize: 12)),
          ],
        ),
        const SizedBox(height: 20),
        _buildExploreItem('Title', 'Description', hasMessage: true),
        _buildExploreItem('Ana', 'Description', hasMessage: false),
      ],
    );
  }

  Widget _buildMiniChip(String label) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(color: const Color(0xFF3DBE7A), borderRadius: BorderRadius.circular(5)),
      child: Text(label, style: const TextStyle(color: Colors.white, fontSize: 11)),
    );
  }

  Widget _buildFeedItem({required String name, required String action, required String time, required Widget content}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const CircleAvatar(radius: 15, backgroundColor: Colors.grey),
            const SizedBox(width: 10),
            Expanded(child: Text('$name $action', style: const TextStyle(fontSize: 13))),
            Text(time, style: const TextStyle(color: Colors.grey, fontSize: 11)),
          ],
        ),
        Padding(padding: const EdgeInsets.only(left: 40, top: 10, bottom: 20), child: content),
      ],
    );
  }

  Widget _buildPersonTile(String name, String subtitle) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(border: Border.all(color: Colors.black12), borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(radius: 15),
              const SizedBox(width: 10),
              Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 5),
          Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 12)),
          const SizedBox(height: 10),
          _buildMiniChip('Cultura'),
        ],
      ),
    );
  }

  Widget _buildExploreItem(String title, String desc, {required bool hasMessage}) {
    return ListTile(
      leading: const CircleAvatar(),
      title: Text(title),
      subtitle: Text(desc),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (hasMessage) const Icon(Icons.chat_bubble_outline, size: 20, color: Colors.grey),
          const SizedBox(width: 10),
          const Icon(Icons.person_add_alt_1, size: 24, color: Colors.black),
        ],
      ),
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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                color: (isSelected || isHovered) ? const Color(0xFFE2D6E8) : Colors.transparent,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(icon, size: 26, color: (isSelected || isHovered) ? Colors.black : Colors.black54),
            ),
            const SizedBox(height: 4),
            Text(label, style: const TextStyle(fontSize: 10, color: Colors.black)),
          ],
        ),
      ),
    );
  }
}