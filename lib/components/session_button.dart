import 'package:flutter/material.dart';

class SessionButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color foregroundColor;
  final Widget nextScreen;
  final double? width;
  final double height;

  const SessionButton({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.nextScreen,
    this.width,
    this.height = 50,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 800),
              pageBuilder: (context, animation, secondaryAnimation) => nextScreen,
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                var slideAnimation = Tween<Offset>(
                  begin: const Offset(1, 0),
                  end: Offset.zero,
                ).animate(CurvedAnimation(parent: animation, curve: Curves.easeInOut));

                var fadeAnimation = Tween<double>(begin: 0.7, end: 1.0)
                    .animate(CurvedAnimation(parent: animation, curve: Curves.easeInOut));

                return FadeTransition(
                  opacity: fadeAnimation,
                  child: SlideTransition(
                    position: slideAnimation,
                    child: child,
                  ),
                );
              },
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.3,
          ),
        ),
      ),
    );
  }
}
