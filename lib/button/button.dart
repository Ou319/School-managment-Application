import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ofppt_project/colors/colors.dart';


class ButtonCall extends StatelessWidget {
  const ButtonCall({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    Container(
      width: double.infinity,
      height: 65,
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: MyColors.BlueColor
      ),
      child: 
      Center(
        child: Text("Get Started",
        style: GoogleFonts.italiana(
        
        ),),
      ),
    );
  }
}