import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tally/app/core/theme/color.dart';
import 'package:tally/app/widgets/custom_app_bar.dart';
import 'package:tally/app/widgets/custom_button.dart';
import 'package:tally/app/widgets/custom_text_field.dart';

import '../controllers/add_controller.dart';

class AddView extends GetView<AddController> {
  const AddView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text('নতুন কাস্টমার/সাপ্লায়ার', style: TextStyle(fontSize: 17),),
      ),
      body: Padding(
          padding: EdgeInsets.all(15),
        child: Obx(() => Column(
          children: [
            Expanded(child: ListView(
              children: [
                ///Profile Picture & User
                Row(
                  children: [
                    InkWell(
                      onTap: (){},
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          const CircleAvatar(
                            radius: 24,
                            backgroundImage: NetworkImage('https://cdn.vectorstock.com/i/500p/29/53/gray-silhouette-avatar-for-male-profile-picture-vector-56412953.jpg'),
                          ),
                          Container(
                            height: 22,
                            width: 22,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFe1e1e1),
                            ),
                              child: const Center(
                                child: Icon(Icons.camera_alt_outlined, size: 15,),
                              ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Expanded(
                        child: radioButton('customer', 'কাস্টমার')
                    ),
                    Expanded(
                        child: radioButton('suplier', 'সাপ্লায়ার')
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                
                /// Add From Phonbook Buttton
                SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: const Color(0xFFf2f2f2)
                    ),
                      onPressed: (){}, child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.perm_contact_calendar_outlined,
                        color: Colors.black,
                        size: 18,
                      ),
                      const SizedBox(width: 5,),
                      Text('ফোনবুক থেকে যোগ করি', style: TextStyle(fontSize: 16, color: Colors.black),),
                    ],
                  )
                  )
                ),
                const SizedBox(height: 20,),
                /// User Info
                
                Column(
                  children: [
                    CustomTextField(
                      labelText: 'Name',
                        hintText: 'Write your name', 
                      leadingIcon: Icons.person_outline,
                      onChanged: (value) =>controller.name.value=value,
                    ), 
                    const SizedBox(height: 10,),
                    CustomTextField(
                      labelText: 'Mobile Number',
                      hintText: 'Enter Your Mobile Number',
                      leadingIcon: Icons.phone_outlined,
                      onChanged: (value) =>controller.phone.value=value,
                      keyboardType: TextInputType.phone,
                    ),
                  ],
                ),
              ],
            )
            ),
            CustomButton(
                label: 'নিশ্চিত',
              buttonType:
              controller.name.isNotEmpty && controller.phone.isNotEmpty ?ButtonType.ENABLED : ButtonType.DISABLED,
              isLoading: controller.isLoading.value,
              onTap: () => controller.addCustomerOrSupplier(),
            )
          ],
        )),
      )
    );
  }

  Widget radioButton(String value, String label) {
    bool isSelected=controller.selectedValue.value ==value;
    return InkWell(
      onTap: () => controller.selectedValue.value=value,
          child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected? AppColors.primary: Colors.black.withOpacity(.15),
          ),
          borderRadius: BorderRadius.circular(15),
        ),
            child: Row(
              children: [
                Radio(
                  activeColor: AppColors.primary,
                    value: value,
                  groupValue: controller.selectedValue.value,
                  onChanged: (neValue){
                    controller.selectedValue.value=neValue!;
                  },
                ),
                Text(
                  label,
                  style: TextStyle(fontSize: 16, color: isSelected? AppColors.primary: Colors.black),
                )
              ],
            ),
    ),
    );
  }
}
