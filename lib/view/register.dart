import 'package:chatbox/controller/signUp_auth_controller.dart';
import 'package:chatbox/view/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SignUpController controller = Get.put(SignUpController());
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.height * 0.02,
          vertical: MediaQuery.of(context).size.height * 0.02,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              const Text(
                "Register with phone number",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const Text(
                "Get chatting with friends and family today by registering on our chat app!",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter your Username";
                        }
                        return null;
                      },
                      controller: controller.usernameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            )),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.deepPurple,
                          ),
                        ),
                        prefixIcon: const Icon(
                          Icons.email,
                        ),
                        hintText: "Username",
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter your Email";
                        }
                        return null;
                      },
                      controller: controller.emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            )),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.deepPurple,
                          ),
                        ),
                        prefixIcon: const Icon(
                          Icons.email,
                        ),
                        hintText: "Email",
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter your Password";
                        }
                        return null;
                      },
                      controller: controller.passwordController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            )),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.deepPurple,
                          ),
                        ),
                        prefixIcon: const Icon(
                          Icons.email,
                        ),
                        hintText: "Password",
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Confirm Password";
                        }
                        return null;
                      },
                      controller: controller.confirmPasswordController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            )),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.deepPurple,
                          ),
                        ),
                        prefixIcon: const Icon(
                          Icons.email,
                        ),
                        hintText: "Confirm password",
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (controller.formKey.currentState!.validate()) {
                      controller.sendOtp(context);
                    }
                  },
                  child: const Text("Register"),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Center(
                child: Wrap(children: [
                  const Text("Have an account?"),
                  SizedBox(
                    width: MediaQuery.of(context).size.height * 0.005,
                  ),
                  GestureDetector(
                      onTap: () {
                        Get.off(() => const SignInScreen());
                      },
                      child: const Text(
                        "Sign In",
                        style: TextStyle(
                          color: Colors.deepPurple,
                        ),
                      ))
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
