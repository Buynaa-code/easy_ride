import 'package:easy_ride/const/colors.dart';
import 'package:easy_ride/const/text_field.dart';
import 'package:easy_ride/maps/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Use a Future to navigate after a delay
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [informationColor8, informationColor4],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/logo.svg',
                semanticsLabel: 'Logo',
              ),
              const SizedBox(height: 20),
              Text(
                'Хялбар Унаа',
                style: ktsBodyMassiveBold.copyWith(color: whiteColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
