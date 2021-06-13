import 'package:mydream/constants/colours.dart';

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class CustomTextfield extends StatelessWidget {
  final String hint, label;
  final Widget suffix;
  final IconData priffix;
  final TextEditingController controller;
  final bool isobscure, borderd;
  final int validator;
  final Function customvalidator;

  CustomTextfield(
      {Key key,
      this.hint,
      this.label,
      this.priffix = null,
      this.suffix = null,
      this.controller,
      this.isobscure = false,
      this.validator = null,
      this.customvalidator = null,
      this.borderd = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<MultiValidator> validators = [
      MultiValidator([
        RequiredValidator(errorText: "this field is required"),
      ]),
      MultiValidator([
        RequiredValidator(errorText: "this field is required"),
        EmailValidator(errorText: "this mail is not valid")
      ]),
      MultiValidator([
        RequiredValidator(errorText: "this field is required"),
        MinLengthValidator(8,
            errorText: 'password should be at least 8 charachter'),
        PatternValidator(r'(?=.*?[#?!@$%^&*-])',
            errorText:
                "Password should contain atleast one spiecal charachter"),
      ]),
      MultiValidator([
        RequiredValidator(errorText: "this field is required"),
        MinLengthValidator(11,
            errorText: 'password should be at least 11 charachter'),
      ]),
    ];
    return TextFormField(
        keyboardType: validator == 3
            ? TextInputType.phone
            : validator == 1
                ? TextInputType.emailAddress
                : validator == 2
                    ? TextInputType.visiblePassword
                    : TextInputType.name,
        controller: controller,
        obscureText: isobscure,
        textAlign: TextAlign.center,
        cursorColor: k_primarycolor,
        style: TextStyle(color: Colors.white),
        decoration: new InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: k_primarycolor),
            //  when the TextFormField in unfocused
          ),
          focusedBorder: borderd == true
              ? OutlineInputBorder(
                  borderSide: new BorderSide(color: k_primarycolor))
              : null,

          hintText: hint,
          hintStyle: TextStyle(color: textcolor),
          labelText: label,
          labelStyle: TextStyle(
            color: textcolor,
          ),
          // prefixIcon: Icon(
          //   priffix,
          //   color: acc,
          // ),
          // prefixText: ' ',
          // suffix: suffix,
          // suffixStyle: TextStyle(
          //   color: accentcolor,
          //   fontFamily:
          // )
        ),
        validator: validators[validator]);
  }
}
