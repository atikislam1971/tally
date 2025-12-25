import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tally/app/widgets/custom_button.dart';
import 'package:tally/app/widgets/custom_text_field.dart';
import 'package:tally/app/widgets/customer_list_tile.dart';

import '../controllers/transaction_controller.dart';

class TransactionView extends GetView<TransactionController> {
  const TransactionView({super.key});
  @override
  Widget build(BuildContext context) {
    final person=Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: CustomerListTile(
            person: person,
          isTrxScreen: true,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('পাবোঃ ৳৩৭০.০০'), 
                    Text('১ দিন আগে')
                  ],
                ),
                SizedBox(height: 10,),
                Divider(color: Colors.black.withOpacity(.1),),
                SizedBox(height: 15,),
                Row(
                  children: [
                    Expanded(child: CustomTextField(
                        labelText: 'দিলাম/বেচা',
                        hintText: 'দিলাম/বেচা',
                      leadingIcon: Icons.attach_money,
                      onChanged: (value){
                          controller.dilam.value=value;
                      },
                    )),
                    SizedBox(width: 15,),
                    Expanded(child: CustomTextField(
                      labelText: 'পেলাম',
                      hintText: 'পেলাম',
                      leadingIcon: Icons.attach_money,
                      onChanged: (value){
                        controller.pelam.value=value;
                      },
                    )),
                  ],
                ),
                const SizedBox(height: 15,),
                CustomTextField(
                    labelText: 'বিবরণ',
                    hintText: 'বিবরণ',
                  leadingIcon: Icons.edit_note_sharp,
                  onChanged: (value){
                      controller.biboron.value=value;
                  },
                ),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(() => _buildRoundButton(
                      icon: Icons.date_range,
                      label: '${controller.selectedDate.value.day}'
                          '-${controller.selectedDate.value.month}'
                          '-${controller.selectedDate.value.year}',
                      onTap: ()async{
                        final pickDate=await showDatePicker(
                            context: context,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(21000),
                          initialDate: controller.selectedDate.value,
                        );
                        if(pickDate !=null){
                          controller.selectedDate.value=pickDate;
                        }
                      }),
                    ),
                    _buildRoundButton(
                      icon: Icons.add_a_photo_outlined,
                      label: 'ছবি'
                    )
                  ],
                )
              ],
            ),
            Obx(() => CustomButton(
              label: 'নিশ্চিত',
              isLoading:controller.isLoading.value,
              buttonType: controller.dilam.isNotEmpty ||
                  controller.pelam.isNotEmpty
                  ? ButtonType.ENABLED : ButtonType.DISABLED,
              onTap: () => controller.submitTrx(person['phone']),
            )
            )
          ],
        ),
      )
    );
  }

  Widget _buildRoundButton({
    required IconData icon,
    required String label,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            Icon(icon, size: 18, color: Colors.grey.shade700),
            SizedBox(width: 5),
            Text(label, style: TextStyle(color: Colors.black, fontSize: 14)),
            if (trailing != null) ...[
              SizedBox(width: 5),
              trailing,
            ]
          ],
        ),
      ),

    );
  }
}
