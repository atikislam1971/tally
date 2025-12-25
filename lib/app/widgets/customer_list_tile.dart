import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tally/app/core/helper/media_query_helper.dart';
import 'package:tally/app/routes/app_pages.dart';

class CustomerListTile extends StatelessWidget {
  const CustomerListTile({
    super.key,
    this.isTrxScreen=false,
    required this.person
  });
  
  final bool isTrxScreen;
  final Map person;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: isTrxScreen ? null: () {
        Get.toNamed(
            Routes.TRANSACTION,
          arguments: person
        );
      },
contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        child: Center(
          child: Text(
            person['name']
                .toString()
                .split('')
                .where((word) => word.isNotEmpty)
                .map((word) => word[0])
                .join(),
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      title: Text(person['name'], style: TextStyle(
        fontWeight: FontWeight.w600,
      ),),
      subtitle: Text(isTrxScreen ?' ${person['phone']}': '${person['duration']}'),
      trailing: isTrxScreen ? null : SizedBox(
        width: MediaQueryUtils.width *.2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('${person['amount']}',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                fontSize: 15,
                  color: person['color'] == 'green'? Colors.green : Colors.red)
              ),
            const SizedBox(width: 5,),
            Icon(Icons.arrow_forward_ios, size: 15,)
          ],
        ),
      ),
    );
  }
}
