import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: const Color(0xFFF95700),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {},
              ),
              const SizedBox(width: 8.0),
              const Expanded(
                child: Text(
                  'Надтай ойр унааны жагсаалт',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SvgPicture.asset(
                'appbar_car.svg',
                height: 50.0, // Adjust the height as needed
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
