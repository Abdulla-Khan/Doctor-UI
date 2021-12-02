import 'package:doctor_ui/auth/sign_in.dart';
import 'package:doctor_ui/auth/signup.dart';
import 'package:doctor_ui/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            'assets/icons/splash_bg.svg',
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                children: [
                  Spacer(),
                  SvgPicture.asset('assets/icons/gerda_logo.svg'),
                  Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => SignUp()));
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Color(0xFF6CD8D1),
                        ),
                        child: Text('Sign Up')),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: defaultPadding),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (_) => SignIn()));
                          },
                          style: TextButton.styleFrom(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                side: BorderSide(color: Color(0xFF6CD8D1))),
                            backgroundColor: Colors.transparent,
                          ),
                          child: Text('Sign In')),
                    ),
                  ),
                  SizedBox(
                    height: defaultPadding,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
