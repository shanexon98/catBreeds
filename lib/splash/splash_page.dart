import 'package:catbreeds/cat_breeds_page.dart';
import 'package:catbreeds/splash/widgets/animation.dart';
import 'package:catbreeds/widgets/text_default_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  late Animation<double> opacity;
  late AnimationController controller;
  final RxBool image = true.obs;
  final RxBool textFinal = true.obs;

  var allingTextTitle = TextAlign.center;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    opacity = Tween<double>(begin: 1.0, end: 0.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });

    controller.forward().then((_) async {
      await navigationPage();
    });
  }

  navigationPage() async {
    Get.to(CatBreedsPage());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 1500), () {
      image.value = false;
    });
    Future.delayed(const Duration(milliseconds: 1800), () {
      textFinal.value = false;
    });
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.black87,
        body: Container(
          height: height,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 249, 237, 248),
          ),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Expanded(
                  flex: 5,
                  child: AnimationWidget(),
                ),
                Expanded(
                  flex: 1,
                  child: Obx(() {
                    return AnimatedCrossFade(
                        firstChild: Container(),
                        secondChild: const Align(
                            alignment: Alignment.center,
                            child: TextDefault(
                              text: 'Miaw miaw...',
                              sizeText: 16,
                              fontWeight: FontWeight.bold,
                              colorText: Color.fromARGB(255, 51, 1, 60),
                            )),
                        crossFadeState: textFinal.value
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                        duration: const Duration(milliseconds: 300));
                  }),
                )
              ],
            ),
          ),
        ));
  }
}
