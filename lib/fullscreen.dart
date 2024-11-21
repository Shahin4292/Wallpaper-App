import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';

class Fullscreen extends StatefulWidget {
  final String imageUrl;

  const Fullscreen({super.key, required this.imageUrl});

  @override
  State<Fullscreen> createState() => _FullscreenState();
}

class _FullscreenState extends State<Fullscreen> {
  Future<void> setWallpaper() async {
    int location = WallpaperManager.HOME_SCREEN;
    var file = await DefaultCacheManager().getSingleFile(widget.imageUrl);
    String result =
        WallpaperManager.setWallpaperFromFile(file.path, location).toString();
  }

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
              onTap: () {
                setWallpaper();
                // Navigator.pop(context);
              },
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
