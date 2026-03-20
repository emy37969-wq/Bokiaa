import 'package:flutter/material.dart';

class Custombackbutton extends StatelessWidget {
  const Custombackbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
    
  }
}
