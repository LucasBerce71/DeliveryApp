import 'package:flutter/material.dart';

class PizzaDeliveryInput extends TextFormField {
    PizzaDeliveryInput({
      @required String label,
      TextEditingController controller,
      TextInputType keyboardType,
      FormFieldValidator validator,
      Icon sufixIcon,
      Function sufixIconOnPressed,
      obscureText = false
    }) : super(
      keyboardType: keyboardType,
      validator: validator,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: sufixIcon != null ? IconButton(
          icon: sufixIcon,
          onPressed: sufixIconOnPressed,
        ) : null,
      )
    );
}