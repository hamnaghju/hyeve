import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hyeve/constant/constant.dart';

class Ai extends StatefulWidget {
  const Ai({super.key});

  @override
  State<Ai> createState() => _AiState();
}

class _AiState extends State<Ai> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height:MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Roommate',textAlign: TextAlign.start,style: GoogleFonts.manrope(
                  textStyle: TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 30, color: Colors.white,
                  )
              ),),
              SizedBox(height: 20,),
              Text('Relax, let AI match you with a perfect roommate.'
                ,textAlign: TextAlign.start,style: GoogleFonts.manrope(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w500, fontSize: 14, color: Colors.grey,
                  )
              ),),
              SizedBox(height: 30,),
              Container( height: 520,
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 540,
                decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/img_6.png")), borderRadius: BorderRadius.circular(27),
                    ),),
                    Padding(padding: EdgeInsets.only(bottom: 5, top: 450, left: 20, right: 20), child:
                    CreateBtn(Colors.white, Colors.black, "Coming soon ...", (){}))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
