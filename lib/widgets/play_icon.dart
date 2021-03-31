import 'package:flutter/material.dart';

class PlayIcon extends StatelessWidget {
  const PlayIcon({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Center(
        child: Material(
          elevation: 6,
          color: Colors.white.withOpacity(0.9),
          borderRadius: const BorderRadius.all(Radius.circular(40)),
          child: const Padding(
            padding: EdgeInsets.all(6),
            child: Icon(Icons.play_arrow, size: 40, color: Colors.black87),
          ),
        ),
      ),
    );
  }
}
