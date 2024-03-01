import 'package:chatbox/model/consts/image_strings.dart';
import 'package:chatbox/view/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Stack(
        children: [
          Image(
            image: AssetImage(
              ImageStrings().onboardingImage,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.height * 0.02,
              vertical: MediaQuery.of(context).size.height * 0.02,
            ),
            child: Column(
              children: [
                Image(
                  alignment: Alignment.center,
                  image: AssetImage(ImageStrings().onboardingImage1),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                const Text(
                  "Connect friends easily & quickly",
                  style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                const Text(
                  "Our chat app is the perfect way to stay connected with friends and family",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.02),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.off(() => const SignInScreen());
                      },
                      child: const Text("Continue"),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
