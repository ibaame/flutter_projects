import 'package:colors_list/screens/color_screen.dart';
import 'package:flutter/material.dart';

class CardSquare extends StatelessWidget {
  const CardSquare({
    Key? key,
    required this.color,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        height: 70,
        child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ColorScreen(
                  color: color,
                ),
              ),
            );
          },
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(color)),
          child: const Text(""),
        ),
      ),
    );
  }
}
