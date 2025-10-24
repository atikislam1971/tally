import 'package:tally/exports.dart';
class OtpField extends StatelessWidget {
  const OtpField({super.key,
    required this.controller,
    this.onChanged
  });
  final TextEditingController controller;
  final Function(String)? onChanged;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 50,
      child: TextFormField(
        onChanged: onChanged,
        controller: controller,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w800
        ),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        decoration: InputDecoration(
          counterText: '',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(
              color: Colors.black.withOpacity(.15),
            )
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(
                color: Colors.black.withOpacity(.15),
              )
          ),
        ),
      ),
    );
  }
}
