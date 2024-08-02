import 'package:easy_ride/const/colors.dart';
import 'package:easy_ride/const/spacing.dart';
import 'package:easy_ride/const/text_field.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TaxiList extends StatefulWidget {
  const TaxiList({super.key});

  @override
  State<TaxiList> createState() => _TaxiListState();
}

class _TaxiListState extends State<TaxiList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: dangerColor3,
      //   elevation: 0,
      //   title: Row(
      //     children: [
      //       const Text('Надтай ойр унааны жагсаалт'),
      //       SvgPicture.asset(
      //         'assets/images/appbar_car.svg',
      //         height: 24.0,
      //       ),
      //       w8(),
      //     ],
      //   ),
      // ),
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              width: screenWidth(context),
              height: screenHeight(context),
              child: SizedBox(
                width: screenWidth(context),
                height: screenHeight(context) * 0.6,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    double width = constraints.maxWidth;
                    double height = constraints.maxHeight;

                    return ListView.builder(
                      padding: EdgeInsets.all(width * 0.05),
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            CarCard(width: width, height: height),
                            SizedBox(height: height * 0.02),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CarCard extends StatelessWidget {
  Future<void> _makePhoneCall() async {
    const phoneNumber = '99452233'; // Replace with the desired phone number
    final Uri phoneUri = Uri.parse(phoneNumber);

    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }

  final double width;
  final double height;

  const CarCard({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(width * 0.05),
      margin: EdgeInsets.only(bottom: height * 0.01),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
        border: Border.all(color: Colors.grey.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCarDetailsRow(),
          SizedBox(height: height * 0.02),
          _buildLocationRow(),
          SizedBox(height: height * 0.02),
          _buildCallButton(width, height, informationColor7),
        ],
      ),
    );
  }

  Row _buildCarDetailsRow() {
    return Row(
      children: [
        Image.asset(
          'assets/images/model3.png',
          height: height * 0.1,
        ),
        SizedBox(width: width * 0.03),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '9935-2233',
              style: TextStyle(
                fontSize: width * 0.05,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: height * 0.005),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.02,
                    vertical: height * 0.01,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text('8770  MGL  УНС'),
                ),
              ],
            ),
            SizedBox(height: height * 0.005),
            const Text(
              'Toyota, Цагаан өнгө, Prius 20',
              style: TextStyle(color: greyColor5),
            ),
          ],
        ),
      ],
    );
  }

  Container _buildLocationRow() {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: greyColor3, // Adjust the color as needed
            width: 1.0, // Width of the border
          ),
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.only(top: 8),
        child: Row(
          children: [
            Icon(Icons.location_on, color: greyColor6),
            Text('Таны байгаа байршилаас',
                style: TextStyle(color: Colors.grey)),
            Spacer(),
            Text('800m', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  ElevatedButton _buildCallButton(
      double width, double height, Color informationColor7) {
    return ElevatedButton.icon(
      onPressed: _makePhoneCall,
      icon: const Icon(Icons.call),
      label: Text(
        'Утасаар ярих',
        style: ktsBodyMediumBold,
      ),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width, height * 0.06),
        foregroundColor: whiteColor, // Text color
        backgroundColor: informationColor6,
        // Background color with 10% opacity
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
      ),
    );
  }
}
