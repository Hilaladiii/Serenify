import 'package:flutter/material.dart';
import 'package:serenify/styles/my_colors.dart';
import 'package:serenify/styles/my_text.dart';

enum Type { text, email, password, search }

class MyTextField extends StatefulWidget {
  const MyTextField({
    super.key,
    required this.label,
    required this.controller,
    required this.hint,
    required this.fieldType,
    required this.isObsecure,
  });

  final String label;
  final TextEditingController controller;
  final String hint;
  final bool isObsecure;
  final Type fieldType;

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  late bool _isObsecureState;

  @override
  void initState() {
    super.initState();
    _isObsecureState = widget.isObsecure;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.fieldType == Type.search
            ? Container()
            : Text(
                widget.label,
                style: MyTextStyle.h7reg(color: Colors.white),
              ),
        const SizedBox(
          height: 8,
        ),
        TextField(
          style: MyTextStyle.h7reg(color: Colors.white),
          controller: widget.controller,
          decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: MyTextStyle.h7reg(color: MyColors.gray200),
            filled: true,
            fillColor: Colors.white.withOpacity(0.25),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide.none,
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            suffixIcon: widget.fieldType == Type.password
                ? _isObsecureState
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            _isObsecureState = false;
                          });
                        },
                        child: const Icon(
                          Icons.visibility_off_outlined,
                          color: Colors.white,
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          setState(() {
                            _isObsecureState = true;
                          });
                        },
                        child: const Icon(
                          Icons.visibility_outlined,
                          color: Colors.white,
                        ),
                      )
                : null,
          ),
          obscureText: _isObsecureState,
        )
      ],
    );
  }
}
