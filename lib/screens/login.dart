import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../Theme/theme.dart';
import '../Utils/colors.dart';
import '../widgets/text_form_field.dart';


class TermsCondition2 extends StatefulWidget {
  const TermsCondition2({Key? key}) : super(key: key);

  @override
  State<TermsCondition2> createState() => _TermsCondition2State();
}

class _TermsCondition2State extends State<TermsCondition2> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children : [
              const Padding(
                padding: EdgeInsets.only(top: 30),
                child: Center(
                  child: SizedBox(
                    height: 78,
                    width: 148,
                    child: Image(
                      image: AssetImage('assets/images/enfologo.png'),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text(
                  'please authenticate',
                  style: inoTheme.mainHeading,
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              Container(
                child:
                Text(
                  'username:',
                  style:  TextStyle (
                    fontSize:  20,
                    fontWeight:  FontWeight.w100,
                    height:  1.5,
                    letterSpacing:  -2.25,
                    color:  Color(0xff002f46),
                  ),
                ),
              ),

              const SizedBox(
                height: 30,
              ),
              FormTextField(),
              const SizedBox(
                height: 30,
              ),
              Container(
                child:
                Text(
                  'password:',
                  style:  TextStyle (
                    fontSize:  20,
                    fontWeight:  FontWeight.w100,
                    height:  1.5,
                    letterSpacing:  -2.25,
                    color:  Color(0xff002f46),
                  ),
                ),
              ),

              const SizedBox(
                height: 20,
              ),
              FormTextField(),
            ],
          ),
        ),
      ),
    );
  }
}
