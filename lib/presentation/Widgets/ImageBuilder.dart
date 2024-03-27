
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:green_control/config/SetBytes.dart';


class ImageBuilder extends StatefulWidget {
  const ImageBuilder({super.key, required this.mediaID});

  final String  mediaID;

  @override
  State<ImageBuilder> createState() => _ImageBuilderState();
}

class _ImageBuilderState extends State<ImageBuilder> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List?>(
      future: SetBytes.setBytes(widget.mediaID),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.memory(
              snapshot.data!,
              fit: BoxFit.cover,
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Error loading image');
        } else {
          return Center(child: SizedBox(width: 50, height: 50,child: CircularProgressIndicator()));
        }
      },
    );
  }
}
