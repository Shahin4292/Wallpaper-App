import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Wallpaper extends StatefulWidget {
  const Wallpaper({super.key});

  @override
  State<Wallpaper> createState() => _WallpaperState();
}

class _WallpaperState extends State<Wallpaper> {
  List images = [];

  @override
  void initState() {
    fetchApi();
    super.initState();
  }

  fetchApi() {
    http.get(Uri.parse('https://api.pexels.com/v1/curated?per_page=80'),
        headers: {
          'Authorization':
              "PzrwjMFFdssYI6z3sTYrAFpGwUnlnTE0Nft6rnGEsy8O6A0gKvBf6khO"
        }).then((value) {
      Map result = jsonDecode(value.body);
      setState(() {
        images = result['photos'];
      });
      print(images);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
                itemCount: images.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2,
                    crossAxisCount: 3,
                    childAspectRatio: 2 / 3),
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.white,
                    child: Image.network(
                      images[index]['src']['tiny'],
                      fit: BoxFit.cover,
                    ),
                  );
                }),
          ),
          Container(
            height: 60,
            width: MediaQuery.sizeOf(context).width,
            color: Colors.black,
            child: const Center(
              child: Text(
                "Load more",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
