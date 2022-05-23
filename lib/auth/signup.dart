import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_ui/auth/sign_in.dart';
import 'package:doctor_ui/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SvgPicture.asset(
            "assets/icons/Sign_Up_bg.svg",
            fit: BoxFit.cover,
          ),
          Center(
            child: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Create account',
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Text('Already have an account?'),
                        TextButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) => SignIn()));
                            },
                            child: Text(
                              'Sign In!',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: defaultPadding * 2,
                    ),
                    SignUpForm(
                      formkey: formkey,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SignUpForm extends StatelessWidget {
  SignUpForm({
    Key? key,
    required this.formkey,
  }) : super(key: key);
  final GlobalKey formkey;
  late String _user, _email, _phone, _password;
  TextEditingController user = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextFeild(text: 'Username'),
              TextFormField(
                controller: user,
                decoration: InputDecoration(hintText: 'abdullahkhan'),
                validator: RequiredValidator(errorText: "UserName is required"),
                onSaved: (username) => _user = username!,
              ),
              const SizedBox(
                height: defaultPadding,
              ),
              const TextFeild(text: 'Email'),
              TextFormField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(hintText: 'text@gmail.com'),
                validator: EmailValidator(errorText: 'Use Valid Email'),
                onSaved: (email) => _email = email!,
              ),
              const SizedBox(
                height: defaultPadding,
              ),
              const TextFeild(text: 'Phone'),
              TextFormField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(hintText: '+92 XXX XXXXXXX'),
                validator:
                    RequiredValidator(errorText: "Phone number is required"),
                onSaved: (phone) => _phone = phone!,
              ),
              const SizedBox(
                height: defaultPadding,
              ),
              const TextFeild(text: 'Password'),
              TextFormField(
                controller: pass,
                obscureText: true,
                decoration: InputDecoration(hintText: '******'),
                validator: passwordValidator,
                onSaved: (passs) => _password = passs!,
                onChanged: (pass) => _password = pass,
              ),
              const SizedBox(
                height: defaultPadding,
              ),
              const TextFeild(text: 'Confirm Password'),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(hintText: '******'),
                validator: (pass) =>
                    MatchValidator(errorText: 'Password do not match')
                        .validateMatch(pass!, _password),
              ),
              SizedBox(
                height: defaultPadding * 2,
              ),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        createUSer(email.text, pass.text, context, user.text);
                      },
                      child: Text('Sign Up')))
            ],
          )),
    );
  }
}

class TextFeild extends StatelessWidget {
  const TextFeild({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding / 3),
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black54),
      ),
    );
  }
}

void createUSer(email, pass, context, name) async {
  try {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: pass,
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}
