import 'package:flutter/material.dart';
import 'package:movie_app/models/video_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPage extends StatefulWidget {
  VideoPage({super.key, required this.video});
  VideoModel video;

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late YoutubePlayerController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = YoutubePlayerController(
      initialVideoId: widget.video.key,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
      if (orientation == Orientation.landscape) {
        return Scaffold(
          body: Container(
            child: Align(
              alignment: Alignment.center,
              child: FittedBox(
                fit: BoxFit.fill,
                child: YoutubePlayer(
                  controller: controller,
                ),
              ),
            ),
          ),
        );
      } else {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.video.name),
          ),
          body: Hero(
            tag: widget.video.key,
            child: Container(
              child: Align(
                alignment: Alignment.center,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: YoutubePlayer(
                    controller: controller,
                  ),
                ),
              ),
            ),
          ),
        );
      }
    });
  }
}
