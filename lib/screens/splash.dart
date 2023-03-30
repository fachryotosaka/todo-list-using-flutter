import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_list/screens/Drawerhiden/hidendrawer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.network(
            "https://assets2.lottiefiles.com/packages/lf20_xnbikipz.json",
            controller: _controller, onLoaded: (compos) {
          _controller
            ..duration = compos.duration
            ..forward().then((value) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HidenDrawer()));
            });
        }),
      ],
    ));
  }
}
