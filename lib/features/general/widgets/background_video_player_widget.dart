import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/mylogger.dart';
import 'package:flutter_85bet_mobile/res.dart';
import 'package:video_player/video_player.dart';

class BackgroundVideoPlayerWidget extends StatefulWidget {
  final bool autoPlay;

  BackgroundVideoPlayerWidget({Key key, this.autoPlay = true})
      : super(key: key);

  @override
  BackgroundVideoPlayerWidgetState createState() =>
      BackgroundVideoPlayerWidgetState();
}

class BackgroundVideoPlayerWidgetState
    extends State<BackgroundVideoPlayerWidget> with AfterLayoutMixin {
  VideoPlayerController _controller;

  // bool _runScheduleTimer = false;
  // Timer _periodTimer;
  // Timer _periodTimerTimeout;

  // Future<ClosedCaptionFile> _loadCaptions() async {
  //   final String fileContents = await DefaultAssetBundle.of(context)
  //       .loadString('assets/bumble_bee_captions.srt');
  //   return SubRipCaptionFile(fileContents);
  // }

  // void startPeriodTimeoutTimer(Timer innerTimer) {
  //   _periodTimerTimeout?.cancel();
  //   _periodTimerTimeout = new Timer(Duration(seconds: 30), () {
  //     if (_runScheduleTimer) {
  //       try {
  //         innerTimer?.cancel();
  //         _periodTimer?.cancel();
  //         print('stopped period timer');
  //       } catch (e) {
  //         print('cancel period timer has exception: $e');
  //       }
  //       _runScheduleTimer = false;
  //     }
  //   });
  // }

  // void startProgressTimer() {
  //   print('start progress timer');
  //   _periodTimer?.cancel();
  //   _periodTimer = Timer.periodic(Duration(milliseconds: 1000), (Timer timer) {
  //     print('video value playing: ${_controller.value.isPlaying}');
  //     if (_controller.value.isPlaying) {
  //       _periodTimerTimeout?.cancel();
  //       print('video value duration: ${_controller.value.duration}');
  //       print('video value position: ${_controller.value.position}');
  //       print('video value buffered: ${_controller.value.buffered}');
  //     } else {
  //       if (_periodTimerTimeout == null ||
  //           _periodTimerTimeout.isActive == false) {
  //         // set a timer to stop period check after 10s
  //         startPeriodTimeoutTimer(timer);
  //       }
  //     }
  //   });
  // }

  void playVideo() {
    try {
      _controller.play();
    } catch (e) {
      MyLogger.warn(
          msg: 'background video player has exception while play: $e');
    }
  }

  void pauseVideo() {
    try {
      _controller.pause();
    } catch (e) {
      MyLogger.warn(
          msg: 'background video player has exception while pause: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
      Res.bg_reg,
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    );
    // _controller.addListener(() {
    // print('triggered player control listener');
    // if (_controller.value.isPlaying && !_runScheduleTimer) {
    //   _runScheduleTimer = true;
    //   startProgressTimer();
    // }
    // setState(() {});
    // });
    _controller.setLooping(true);
    _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
            foregroundDecoration: BoxDecoration(
              color: Colors.black26,
            ),
            child: VideoPlayer(_controller)),

        /// video sub
        // ClosedCaption(text: _controller.value.caption.text),

        /// blur video player
        // BackdropFilter(
        //   filter: ui.ImageFilter.blur(
        //     sigmaX: 2.0,
        //     sigmaY: 2.0,
        //   ),
        //   child: Container(
        //     color: Colors.transparent,
        //   ),
        // ),

        /// play/pause control
        // _PlayPauseOverlay(controller: _controller),

        /// progress bar
        // VideoProgressIndicator(_controller, allowScrubbing: true),
      ],
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    if (widget.autoPlay) {
      playVideo();
    }
  }
}
//
// class _PlayPauseOverlay extends StatelessWidget {
//   const _PlayPauseOverlay({Key key, this.controller}) : super(key: key);
//
//   final VideoPlayerController controller;
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: <Widget>[
//         AnimatedSwitcher(
//           duration: Duration(milliseconds: 50),
//           reverseDuration: Duration(milliseconds: 200),
//           child: controller.value.isPlaying
//               ? SizedBox.shrink()
//               : Container(
//                   color: Colors.black26,
//                   child: Center(
//                     child: Icon(
//                       Icons.play_arrow,
//                       color: Colors.white,
//                       size: 100.0,
//                     ),
//                   ),
//                 ),
//         ),
//         GestureDetector(
//           onTap: () {
//             controller.value.isPlaying ? controller.pause() : controller.play();
//           },
//         ),
//       ],
//     );
//   }
// }
