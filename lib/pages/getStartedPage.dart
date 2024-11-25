import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ofppt_project/colors/colors.dart';

import 'package:ofppt_project/pages/pages_App/navbarbtn/navbtn.dart';

class Getstartedpage extends StatelessWidget {
  const Getstartedpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // this container is for the img
            Container(
              child: Image.asset(
                "lib/images/open-book.png",
                // "lib/images/OFPPT-vector.ma.svg-vector.ma.png"
                width: 140,
              ),
            ),

            // this contaiber is for the text
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              child: Center(
                child: Text(
                  "Get Ready with Us we are bug comnity helo you",
                  style: GoogleFonts.italiana(
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            // this container is for btn
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Navbtn(), // الصفحة الهدف
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                height: 65,
                margin: EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: MyColors.BlueColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Get Started",
                    style: GoogleFonts.italiana(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
