import 'package:flutter/material.dart';

class CustomDropdownFormField extends StatelessWidget {
  final String labelText;
  final String? hintText;
  final bool isValid;
  final Function(BuildContext)? onTap;
  final bool absorbPointer;
  final bool isDropdown;
  final String? Function(String?)? validator;
  final TextEditingController txtController;
  final void Function(String) onChanged;

  const CustomDropdownFormField({
    super.key,
    required this.labelText,
    this.hintText,
    required this.isValid,
    this.onTap,
    this.absorbPointer = true,
    this.isDropdown = false,
    required this.validator,
    required this.txtController,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isDropdown ? () => onTap?.call(context) : null,
      child: AbsorbPointer(
        absorbing: absorbPointer,
        child: Container(
          height: 62,
          decoration: BoxDecoration(
            border: Border.all(
              color: isValid || validator == null ? Colors.grey : Colors.red,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsetsDirectional.only(start: 16),
          child: TextFormField(
            cursorHeight: 15,
            readOnly: isDropdown,
            controller: txtController,
            decoration: InputDecoration(
              labelText: labelText,
              hintText: hintText,
              labelStyle: const TextStyle(),
              hintStyle: const TextStyle(),
              border: InputBorder.none,
              suffixIcon:
                  isDropdown ? const Icon(Icons.arrow_drop_down_sharp) : null,
              errorStyle: const TextStyle(height: 0),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 10,
              ),
            ),
            validator: validator,
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}
