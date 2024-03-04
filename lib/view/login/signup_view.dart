import 'package:flutter/material.dart';
import 'package:tracker/view/login/singin_view.dart';
import '../../common_widget/rounded_textField.dart';
import '../../common_widget/primary_button.dart';
import '../../common/color_extensions.dart';
import '../../common_widget/secondary_button.dart';

class Singup extends StatefulWidget {
  const Singup({super.key});

  @override
  State<Singup> createState() => _SingupState();
}

class _SingupState extends State<Singup> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.gray80,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/img/app_logo.png",
              width: media.width * 0.5,
              fit: BoxFit.contain,
            ),
            const Spacer(),
            RoundedTextField(
              title: "E-mail Address",
              keyboardType: TextInputType.emailAddress,
              controller: txtEmail,
            ),
            const SizedBox(
              height: 15,
            ),
            RoundedTextField(
              title: "Password",
              obscureText: true,
              controller: txtPassword,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 5,
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                      color: TColor.gray70,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 5,
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                      color: TColor.gray70,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 5,
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                      color: TColor.gray70,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 5,
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                      color: TColor.gray70,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "use complex password to better protection",
                  style: TextStyle(
                    color: TColor.gray50,
                    fontSize: 11,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            PrimaryButton(title: "Get Started, It's Free", onPressed: () {}),
            const Spacer(),
            Text(
              "Do You Have An Account?",
              style: TextStyle(
                color: TColor.white,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            SecondaryButton(title: "SignIn", onPressed: () {
               Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const Signin()));
            }),
            const SizedBox(
              height: 15,
            ),
            Text(
              "By registering you agree with our terms of use",
              style: TextStyle(
                color: TColor.white,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      )),
    );
  }
}
