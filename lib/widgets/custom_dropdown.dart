import 'package:flutter/material.dart';

import '../resource/app_colors.dart';
import '../resource/app_text_styles.dart';

class CustomDropDown<T> extends StatelessWidget {
  const CustomDropDown({
    required this.items,
    required this.hint,
    this.onChanged,
    this.validator,
    this.value,
    super.key,
  });

  final List<DropdownMenuItem<T>> items;
  final ValueSetter<T?>? onChanged;
  final String? Function(T?)? validator;
  final T? value;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      isExpanded: true,
      iconEnabledColor: AppColors.text,
      iconDisabledColor: AppColors.primary,
      style: AppTextStyles.dropdownStyle,
      dropdownColor: AppColors.dropdownColor,
      value: value,
      items: items,
      onChanged: onChanged,
      validator: validator,
      hint: Text(hint, style: AppTextStyles.dropdownHintStyle),
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade200.withOpacity(0.5),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 14,
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: AppColors.dropdownBorder,
          ),
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: AppColors.dropdownBorder,
          ),
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: AppColors.dropdownBorder,
          ),
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: AppColors.dropdownBorder,
          ),
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: AppColors.dropdownBorder,
          ),
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),
    );
  }
}
