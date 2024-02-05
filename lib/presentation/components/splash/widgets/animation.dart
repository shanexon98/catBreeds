import 'package:catbreeds/utils/assets_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AnimationWidget extends StatefulWidget {
  const AnimationWidget({
    Key? key,
  }) : super(key: key);

  @override
  _AnimationWidgetState createState() => _AnimationWidgetState();
}

class _AnimationWidgetState extends State<AnimationWidget> {
  RxBool isTapped = false.obs;

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 500), () {
      isTapped.value = !isTapped.value;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AnimatedContainer(
          // margin: EdgeInsets.only(bottom: isTapped.value ? 400 : 550),
          alignment: isTapped.value ? Alignment.center : Alignment.topCenter,
          duration: const Duration(seconds: 1),
          curve: isTapped.value ? Curves.bounceOut : Curves.ease,
          height: double.infinity,
          width: 220,
          decoration: const BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child:  const Image(
            image: NetworkImage(
              // Assets.logoApp
            "https://iili.io/J0iBYep.png"
            ),
            height: 600,
            width: 600,
          ));
    });
  }
}
