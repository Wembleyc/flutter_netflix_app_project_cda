import 'package:flutter/material.dart';

class AppBarMenu extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          'assets/Netflix_Symbol_RGB.png', // Remplacez ceci par le chemin de votre logo Netflix
          fit: BoxFit.contain,
        ),
      ),
      actions: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _AppBarButton(text: "Series"),
              _AppBarButton(text: "Films"),
              _AppBarButton(text: "Ma liste"),
            ],
          ),
        ),
      ],
    );
  }
}

class _AppBarButton extends StatelessWidget {
  final String text;

  const _AppBarButton({required this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        // Handle button press here
      },
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
