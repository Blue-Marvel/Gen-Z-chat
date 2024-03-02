import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppInputField extends StatefulWidget {
  final String hintText;
  final TextEditingController editingController;
  final bool isEmail;

  const AppInputField(
      {super.key,
      required this.hintText,
      required this.editingController,
      this.isEmail = false});

  @override
  State<AppInputField> createState() => _AppInputFieldState();
}

class _AppInputFieldState extends State<AppInputField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 8,
          child: TextFormField(
            validator: (value) {
              if (value != null && value.isEmpty) {
                if (widget.isEmail && value.contains("@")) {
                  return "Enter a valid email";
                }
                return "This field is required";
              }
              return null;
            },
            controller: widget.editingController,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(20.w),
              hintStyle: Theme.of(context).textTheme.bodyMedium,
              hintText: widget.hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
              // focusedBorder:
            ),
          ),
        )
      ],
    );
  }
}
