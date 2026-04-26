import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  int _currentIndex = 2; // Mantendo em Connections
  int _hoverIndex = -1;
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3DBE7A),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage('https://i.pravatar.cc/150?u=9'),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Ana',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

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
                child: Column(
                  children: [
                    Expanded(
                      child: ScrollConfiguration(
                        behavior: const ScrollBehavior().copyWith(overscroll: false),
                        child: ListView(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                          children: [
                            _buildMessageBubble(
                              message: "Hello there",
                              time: "2:00pm",
                              isMe: true,
                            ),
                            _buildMessageBubble(
                              message: "Hi!!!",
                              time: "2:00pm",
                              isMe: false,
                            ),
                            _buildMessageBubble(
                              message: "I like the places u visited",
                              time: "2:01pm",
                              isMe: false,
                            ),
                          ],
                        ),
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, -5),
                          )
                        ],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _messageController,
                              decoration: InputDecoration(
                                hintText: "Escreve uma mensagem...",
                                filled: true,
                                fillColor: const Color(0xFFF2F2F2),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          CircleAvatar(
                            backgroundColor: const Color(0xFF3DBE7A),
                            child: IconButton(
                              icon: const Icon(Icons.send, color: Colors.white, size: 20),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
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

  Widget _buildMessageBubble({required String message, required String time, required bool isMe}) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            constraints: const BoxConstraints(maxWidth: 250),
            decoration: BoxDecoration(
              color: isMe ? const Color(0xFFE3F7E9) : const Color(0xFFF2F2F2),
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(20),
                topRight: const Radius.circular(20),
                bottomLeft: Radius.circular(isMe ? 20 : 0),
                bottomRight: Radius.circular(isMe ? 0 : 20),
              ),
              border: Border.all(color: Colors.black.withOpacity(0.05)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Flexible(
                  child: Text(
                    message,
                    style: const TextStyle(color: Colors.black87, fontSize: 15),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  time,
                  style: TextStyle(color: Colors.black45, fontSize: 10),
                ),
                if (isMe) ...[
                  const SizedBox(width: 4),
                  const Icon(Icons.done_all, size: 14, color: Color(0xFF3DBE7A)),
                ]
              ],
            ),
          ),
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