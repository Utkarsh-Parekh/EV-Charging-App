import 'package:ev_charging_app/core/color_constants.dart';
import 'package:ev_charging_app/core/constants.dart';
import 'package:ev_charging_app/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserOnboarding extends StatelessWidget {
  const UserOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff020819),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Image.asset('lib/assets/app_icon.png'),
                    const SizedBox(
                      width: 10,
                    ),
                    Image.asset('lib/assets/app_name.png')
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  'Sign in',
                  style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w700,
                      fontSize: 28,
                      color: const Color(0xffF9FAFB)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  AppConstants.onBoardingSubtitle,
                  style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: const Color(0xff667085)),
                ),

                const SizedBox(
                  height: 50,
                ),

              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 250,
            alignment: Alignment.center,
            child: Image.asset(
              'lib/assets/onboarding.png',
              fit: BoxFit.cover,
            ),
          ),
          Consumer<AuthProvider>(
            builder: (BuildContext context, authprovider, Widget? child) {
              return Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        authprovider.signInWithGoogle(context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(16),
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xff171A20)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('lib/assets/google_icon.png'),
                            const SizedBox(
                              width: 10,
                            ),
                            Text('Continue with Google',style: GoogleFonts.manrope(fontWeight: FontWeight.w700,fontSize: 16,color: AppColorConstants.grey50),),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          const SizedBox(
            height: 10,
          ),

          Row(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xff171A20)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('lib/assets/apple_icon.png'),
                      const SizedBox(
                        width: 10,
                      ),
                      Text('Continue with Apple',style: GoogleFonts.manrope(fontWeight: FontWeight.w700,fontSize: 16,color: const Color(0xffF9F1FB)),),
                    ],
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(
            height: 50,
          ),

          Container(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child:RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: GoogleFonts.manrope(fontSize: 12,fontWeight: FontWeight.w400,letterSpacing: 0.3,color: const Color(0xff667085)),
                  children: [
                    const TextSpan(text: 'By starting my application, I agree to El-Monde’s '),
                    TextSpan(
                      text: 'Terms of Service',
                      style: GoogleFonts.manrope(fontSize: 12,fontWeight: FontWeight.w700,letterSpacing: 0.3),
                    ),
                    TextSpan(text: ' and ',style: GoogleFonts.manrope(fontSize: 12,fontWeight: FontWeight.w400,letterSpacing: 0.3,color: const Color(0xff667085))),
                    TextSpan(
                      text: 'Privacy Policy',
                      style:  GoogleFonts.manrope(fontSize: 12,fontWeight: FontWeight.w700,letterSpacing: 0.3),
                    ),
                    const TextSpan(text: '.'),
                  ],
                ),
              )
          )
        ],
      ),
    );
  }
}
