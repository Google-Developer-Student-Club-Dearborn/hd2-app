import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isLaunchingVisible = true;
  bool _isLaunchingDone = false;

  final VideoPlayerController _launchVideoController = VideoPlayerController.asset(
      'assets/launch.mp4',
  );

    @override
  void initState() {
    super.initState();
    _launchVideoController.initialize().then((_) {;
      _launchVideoController.play();
      _launchVideoController.addListener(_onVideoEvent);
    });
  }

  void _onVideoEvent() {
    if (_launchVideoController.value.position == _launchVideoController.value.duration) {
      setState(() => _isLaunchingVisible = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Visibility(
          visible: _isLaunchingVisible,
          child: Container(color: Colors.black)
        ),
        AnimatedOpacity(
          opacity: _isLaunchingVisible ? 1.0: 0,
          duration: const Duration(milliseconds: 300),
          onEnd: () {
            _launchVideoController.dispose();
            setState(() {
              _isLaunchingDone = true;
            });
          },
          child: !_isLaunchingDone ? VideoPlayer(_launchVideoController) : Container()
        ),
      ],
    );
  }
}