import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  final List items;
  final Function onChanged, validator;
  final dynamic value;
  final String hint;

  const CustomDropDown(
      {Key key,
      this.items,
      this.onChanged,
      this.validator,
      this.value,
      this.hint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      borderRadius: BorderRadius.circular(16),
      iconEnabledColor: Colors.black,
      iconDisabledColor: Colors.grey,
      dropdownColor: const Color(0xffF5F5F5),
      style: const TextStyle(
        color: Colors.black,
        fontFamily: "Regular",
      ),
      isExpanded: true,
      isDense: true,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        border: OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.grey.shade200.withOpacity(0.5), width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.grey.shade200.withOpacity(0.5), width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.grey.shade200.withOpacity(0.5), width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.grey.shade200.withOpacity(0.5), width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.grey.shade200.withOpacity(0.5), width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
        filled: true,
        fillColor: Colors.grey.shade200.withOpacity(0.5),
      ),
      validator: validator,
      hint: Text(
        hint,
        style: TextStyle(
          color: Colors.black.withOpacity(0.5),
          fontFamily: "Regular",
          fontSize: 16,
        ),
      ),
      value: value,
      items: items,
      onChanged: onChanged,
    );
  }
}
