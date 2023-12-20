import 'package:flutter/material.dart';

import '../Theme/theme.dart';
import '../Utils/colors.dart';
import '../widgets/Custom_button.dart';
import '../widgets/text_form_field.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 50),
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
                  width: 30,
                  height: 10,
                ),
                const Text('username:',
                    style: TextStyle(
                      color: Color(0xff002F46),
                      fontSize: 20,
                    )),
                const FormTextField(),
                const SizedBox(
                  height: 5,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'password:',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xff002F46),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const FormTextField(),
                const SizedBox(height: 30),
                FilledRedButton(
                  onPressed: () {},
                  text: 'login',
                ),
              ],
            ),
          ),
        ));
  }
}
