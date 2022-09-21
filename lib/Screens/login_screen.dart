import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screens/Dialogs/privacy_dialog.dart';
import 'package:flutter_screens/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isHidden = true;
  final _formKey = GlobalKey<FormState>();
  TextEditingController userNameController =
      TextEditingController();
  TextEditingController passwordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
        Container(
          width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Solid Color.png'), fit: BoxFit.cover
              )
            ),
        ),
        SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                 const Padding(padding: EdgeInsets.symmetric(vertical: 50)),
                   const Text(
                  'Welcome',
                  style: TextStyle(
                      color: LightPrimaryColor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding:  const EdgeInsets.all(25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: 
                              TextFormField(
                                keyboardType: TextInputType.name,
                                onChanged: (value) {},
                                  controller: userNameController,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.account_circle),
                                    hintText: 'Full Name',
                                    labelText: 'Name',
                                    labelStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: LightPrimaryColor),
                                    hintStyle:
                                        TextStyle(color: Colors.black54)),
                                  validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Kindly enter your name';
                                  } else {
                                    return null;
                                  }
                                },
                                
                                ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: TextFormField(
                                obscureText: _isHidden,
                                onChanged: (value) {},
                                controller: passwordController,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.lock_rounded),
                                  hintText: 'Enter Password',
                                  labelText: 'Password',
                                  labelStyle: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: LightPrimaryColor),
                                  hintStyle: const TextStyle(color: Colors.black54),
                                  suffix: InkWell(
                                      onTap: _togglePasswordView,
                                      child: Icon(
                                        _isHidden
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                      )),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Password is required';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                            const Padding(padding: const EdgeInsets.only(bottom: 50)),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize:
                                      const Size(double.infinity, 50),
                                  primary: LightPrimaryColor,
                                ),
                                onPressed: () async {
                                  
                                },
                                child: const Text('Continue',
                                    style: TextStyle(
                                      color: Colors.white,
                                    )),
                              ),
                              const Padding(padding: EdgeInsets.only(bottom: 20)),
                            const Divider(
                              endIndent: 0.9,
                              height: 0.5,
                              thickness: 0.5,
                              color: Colors.grey,
                            ),
                            const Padding(padding: EdgeInsets.only(bottom: 35)),
                            const SizedBox(
                              width: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    text:
                                        'By signing in, you agree to our\n \n',
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                    children: [
                                      TextSpan(
                                          text: 'Terms and conditions\n',
                                          style: const TextStyle(
                                              decoration:
                                                  TextDecoration.underline,
                                              color: LightPrimaryColor,
                                              fontSize: 15),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return PolicyDialog(
                                                        mdFileName:
                                                            'terms_and_conditions.md');
                                                  });
                                            }),
                                      const TextSpan(text: 'and\n'),
                                      TextSpan(
                                          text: 'Privacy Policy!',
                                          style: const TextStyle(
                                              decoration:
                                                  TextDecoration.underline,
                                              color: LightPrimaryColor,
                                              fontSize: 15),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return PolicyDialog(
                                                        mdFileName:
                                                            'privacy_policy.md');
                                                });
                                            })
                                          ],
                                        )),
                                      )
                                    ],
                                  ))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                  ) 
              );
  }
  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}