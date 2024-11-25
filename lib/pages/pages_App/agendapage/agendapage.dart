import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ofppt_project/colors/colors.dart';
import 'package:ofppt_project/pages/pages_App/agendapage/pagesmodel/devpagesdowland/devlopment.dart';
import 'package:ofppt_project/pages/pages_App/agendapage/pagesmodel/infstracture/infstracture.dart';

class Agendapage extends StatefulWidget {
  const Agendapage({super.key});

  @override
  State<Agendapage> createState() => _AgendapageState();
}

class _AgendapageState extends State<Agendapage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Container(
              child: Image.asset("lib/images/OFPPT-vector.ma.svg-vector.ma.png"),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                      // here we call page of devlepment module
                          Devlopment()), 
                );
              },
              child: Container(
                margin: EdgeInsets.only(left:20,right:20,top: 15),
                width: double.infinity,
                height: 78,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: MyColors.BlueColor,
                ),
                child: Center(
                  child: Text(
                    "Devlopment Digital",
                    style:
                        GoogleFonts.italiana(fontSize: 22, color: Colors.white),
                  ),
                ),
              ),
            ),
            GestureDetector(
               onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                      // here we call page of Infstracture module
                          Infstracture()), 
                );
              },
              child: Container(
                  margin: EdgeInsets.only(left:20,right:20,top: 15),
                  width: double.infinity,
                  height: 78,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade100,
                  ),
                  child: Center(
                    child: Text(
                      "infstracture Digital",
                      style: GoogleFonts.italiana(
                          fontSize: 22, color: const Color.fromARGB(255, 0, 0, 0)),
                    ),
                  )),
            ),
          ],
        ),
      )),
    );
  }
}
