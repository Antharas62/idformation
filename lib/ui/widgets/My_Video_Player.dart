import 'package:flutter/material.dart';
import 'package:flutter_netflix/utils/constant.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MyVideoPlayer extends StatefulWidget {
  final String movieId;
  const MyVideoPlayer({Key? key, required this.movieId}) : super(key: key);

  @override
  State<MyVideoPlayer> createState() => _MyVideoPlayerState();
}

class _MyVideoPlayerState extends State<MyVideoPlayer> {
  YoutubePlayerController? controller;

  @override
  void initState() {
    super.initState();
    controller = YoutubePlayerController(
      initialVideoId: widget.movieId,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        hideThumbnail: true,
      ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return (controller == null)
        ? Center(
            child: SpinKitFadingCircle(
              size: 20,
              color: kPrimarycolor,
            ),
          )
        : YoutubePlayer(
            controller: controller!,
            progressColors: ProgressBarColors(
              handleColor: kPrimarycolor,
              playedColor: kPrimarycolor,
            ),
            onEnded: (YoutubeMetaData meta){
              controller!.play();
              controller!.pause();
            },
          );
  }
}
