import 'package:flutter/material.dart';
import 'main_page.dart';
import '../../widgets.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds:3)).then((value) {
      AppHelper(context).navigate(const MainPage(),forget: true);
    });
    return Scaffold(
      body:Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    opacity: 0.9,
                    image: AssetImage('assets/images/ghaith_icon.jpg'),
                    fit: BoxFit.contain
                )
            ),
          ),
          // AppContainer(
          //   child: Column(
          //     mainAxisSize: MainAxisSize.min,
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Image.asset('assets/images/ghaith_icon.jpg'),
          //       //AppText('ghaith blood application')
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
