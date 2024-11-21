import 'package:flutter/material.dart';

class Fullscreen extends StatefulWidget {
  final String imageUrl;

  const Fullscreen({super.key, required this.imageUrl});

  @override
  State<Fullscreen> createState() => _FullscreenState();
}

class _FullscreenState extends State<Fullscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: Container(
              child: Image.network(widget.imageUrl),
            )),
            InkWell(
              onTap: () {},
              child: Container(
                height: 60,
                width: MediaQuery.sizeOf(context).width,
                color: Colors.black,
                child: const Center(
                  child: Text(
                    "Set Wallpaper",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
