

import 'package:flutter/services.dart';
import 'package:tally/app/widgets/custom_button.dart';
import 'package:tally/app/widgets/custom_text_field.dart';
import 'package:tally/app/widgets/snackbar.dart';

import '../controllers/auth_controller.dart';
import 'package:tally/exports.dart';
class AuthView extends GetView<AuthController> {
  const AuthView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // height: MediaQueryUtils.responsiveHeight(0.4),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.primary.withOpacity(0.2),
                  Colors.white,
                ],
                end: Alignment.bottomCenter,
                begin: Alignment.topCenter,
                stops: [
                  0.0,
                  0.5,
                ]
              )
            ),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          AppColors.WHITE,
                          AppColors.WHITE.withOpacity(0.2),

                        ],
                        end: Alignment.bottomCenter,
                        begin: Alignment.topCenter,
                          )
                    ),
                    child: SvgPicture.asset(Assets.svg.onboardQrcode, height: 150,width: 150,),
                  ),
                  SizedBox(height: 20,),
                  Text(' সুপার কিউআর কোড-এ পেমেন্ট নিন বিকাশ, রকেট, সহ \n সকল ব্যাংক অ্যাপ থেকে।',
                  textAlign: TextAlign.center,
                  style: TextStyle( fontWeight: FontWeight.w600),)
                ],
              ),
            ),
          ),
          Expanded(child: Padding(
              padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Registration/Login', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),),
                    const SizedBox(height: 20,),
                    CustomTextField(
                      controller: controller.numberController,
                        labelText: 'Mobile Number',
                        hintText: 'xxxxxxxxxxxx',
                      prefixText: '+880',
                      leadingIcon: Icons.call,
                      keyboardType: TextInputType.number,
                      onChanged: (value){
                        if(value.startsWith('0') || value.startsWith('8') || !value.startsWith('1')){
                          snackbar('The number should be start with 1!');
                          return;
                        }
                        controller.number.value = value;
                        controller.numberWithCountryCode.value='+880$value';
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(10),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    RichText(text: TextSpan(
                      children: [
                        TextSpan(
                          text:'রেজিস্ট্রেশন করতে আপনার ',
                          style: TextStyle(
                            fontSize: 13,
                            color: AppColors.BLACK.withOpacity(.5),
                            fontWeight: FontWeight.w500
                          )
                        ),
                        TextSpan(
                          text: ' NID দিয়ে নিবন্ধিত মোবাইল নাম্বার ',
                          style: TextStyle(
                            fontSize: 13,
                            color: AppColors.BLACK,
                            fontWeight: FontWeight.w800
                          )
                        ),TextSpan(
                          text: 'ব্যাবহার করুন',
                          style: TextStyle(
                            fontSize: 13,
                            color: AppColors.BLACK.withOpacity(.5),
                            fontWeight: FontWeight.w500
                          )
                        )
                      ]
                    ))
                  ],
                ),
                Column(
                  children: [
                    Obx(() =>
                        CustomButton(label: 'পরবর্তী',
                          buttonType: controller.number.isEmpty ||
                              controller.number.value.length < 10
                              ? ButtonType.DISABLED : ButtonType.ENABLED,
                        onTap: controller.logiinOrRegister,
                          isLoading: controller.isOtpSending.value,
                        ),
                    ),

                    const SizedBox(height: 10,),
                    RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'পরবর্তীতে যাওয়ার নির্দেশনার মাধ্যমে আপনি টালিখাতার ',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.BLACK.withOpacity(.5),
                            fontWeight: FontWeight.w500
                          )
                        ),
                        TextSpan(
                          text: ' শর্তাবলীতে ',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.primary,
                            fontWeight: FontWeight.w800,
                            decoration: TextDecoration.underline
                          )
                        ),
                        TextSpan(
                          text: ' সম্মতি প্রদান করছেন।',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.BLACK.withOpacity(.5),
                            fontWeight: FontWeight.w500
                          )
                        )

                      ]
                    ))
                  ],
                )
              ]
            ),
          )
          )

        ],
      )
      )
    );
  }
}
