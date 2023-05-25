import 'package:firebase_flutter_db/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Textfield extends StatelessWidget {
  const Textfield(
      {super.key,
      required this.controller,
      this.hinttext,
      required this.maxlines,
      required this.inputType,
      this.onChange,
      required this.lableText,
      this.prefix,
      this.height,
      this.readonly,
      this.suffix,
      this.onEditingComplete,
      this.isPassword,
      this.validator,
      this.textCapitalization = TextCapitalization.none,
      this.inputFormatters,
      this.onTap,
      required this.width});

  final String? hinttext;
  final double width;
  final Widget? prefix;
  final String? lableText;
  final int maxlines;
  final TextCapitalization textCapitalization;
  final TextEditingController controller;
  final TextInputType inputType;
  final void Function(String)? onChange;
  final double? height;
  final String? Function(String?)? validator;
  final Widget? suffix;
  final bool? readonly;
  final void Function()? onEditingComplete;
  final void Function()? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final bool? isPassword;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: textCapitalization,
      onChanged: onChange,
      maxLines: maxlines,
      keyboardType: inputType,
      controller: controller,
      obscureText: isPassword ?? false,
      inputFormatters: [],
      readOnly: readonly ?? false,
      onTap: onTap,
      onEditingComplete: onEditingComplete,
      //    onSaved: (input) => _con.user.fullName = input,
      validator: validator ??
          (input) => input!.isNotEmpty ? null : "$lableText is Required",
      style:const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        prefixIcon: prefix,
        suffix: suffix,
        labelText: lableText,
        border: InputBorder.none,
        hintText: hinttext,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
              width: deviceHeight(context) * 0.002, color:const Color(0xffC1C2B8)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
              width: deviceHeight(context) * 0.002, color:const Color(0xffC1C2B8)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
              width: deviceHeight(context) * 0.002, color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
              width: deviceHeight(context) * 0.002, color: Colors.red),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        labelStyle: const TextStyle(color: Color(0xff8994A3)),
      ),
    );
  }
}
