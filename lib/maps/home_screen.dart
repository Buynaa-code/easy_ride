import 'package:easy_ride/Screens/taxiList/taxi_list.dart';
import 'package:easy_ride/components/button.dart';
import 'package:easy_ride/components/textFormField.dart';
import 'package:easy_ride/const/colors.dart';
import 'package:easy_ride/const/text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => MapSampleState();
}

class MapSampleState extends State<HomeScreen> {
  late GoogleMapController mapController;
  final TextEditingController _controller = TextEditingController();

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
            ),
            Positioned(
              top: 20,
              left: 20,
              right: 20,
              child: Column(
                children: [
                  CustomTextFormField(
                    hintText: 'Жолооч таны байршил руу ирэх болно',
                    controller: _controller,
                    textStyle: const TextStyle(color: Colors.black),
                    hintStyle: const TextStyle(color: greyColor6),
                    fillColor: Colors.white,
                    borderColor: greyColor3,
                    borderRadius: 24.0,
                    borderWidth: 2.0,
                    boxShadow: [
                      BoxShadow(
                        color: greyColor6.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),

                  const SizedBox(
                      height: 10), // Add some spacing between buttons
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Column(
                children: [
                  CustomButton(
                    text: 'Надад ойр унаа',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const TaxiList()),
                      );
                    },
                    backgroundColor: informationColor8,
                    borderColor: informationColor8.withOpacity(0.3),
                    textStyle: ktsBodyLargeBold.copyWith(color: whiteColor),
                    boxShadow: [
                      BoxShadow(
                        color: informationColor4.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
