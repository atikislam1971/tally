import '../../exports.dart';

enum ButtonType{
  DISABLED,
  ENABLED,
  SOFT,
  BORDER,
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key,
    required this.label,
    this.onTap,
     this.buttonType =ButtonType.ENABLED,
     this.isLoading=false
  });
  final String label;
  final Function()? onTap;
  final ButtonType buttonType;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    bool isDisable=buttonType==ButtonType.DISABLED;
    return InkWell(
      onTap: isDisable ? null: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(isDisable ? 0.25 : 1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: isLoading
              ? SizedBox(
            height: 24,
            width: 24,
            child: CircularProgressIndicator(
              color: isDisable && isLoading ? AppColors.primary:Colors.white,
            ),
          ):Text(label, style: TextStyle(color: Colors.white.withOpacity(isDisable ? .8: 1),
              fontSize: 17, fontWeight:
              FontWeight.w800)
          )
        )
      ),
    );
  }
}
