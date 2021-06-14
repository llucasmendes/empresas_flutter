import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:empresas_flutter/configs/ui/Cores.dart';
import 'package:empresas_flutter/configs/ui/Fontes.dart';

class CustomField extends StatelessWidget {
  final fillColor;
  final borderColor;
  final hintText;
  final Color? hintColor;
  final TextStyle? textStyle;
  final double? alturaCampo;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatter;
  final Function(String)? onValidator;
  final Function(String)? onChange;
  final Function(String)? onFieldSubmitted;
  final FocusNode? currentFocus;
  final String? initialValue;
  final FocusNode? nextFocus;
  final bool? enable;
  final bool? isLoading;
  final int? maxLines;
  final int? max;
  final bool? obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool exibirBordaErro;
  final Function(bool)? onFocus;
  final width;
  final height;

  const CustomField({
    Key? key,
    this.fillColor,
    this.borderColor,
    this.hintText,
    this.textStyle,
    this.alturaCampo,
    this.controller,
    this.keyboardType,
    this.inputFormatter,
    this.onValidator,
    this.onChange,
    this.currentFocus,
    this.initialValue,
    this.nextFocus,
    this.enable,
    this.isLoading,
    this.maxLines,
    this.max,
    this.width,
    this.height = 16.0,
    this.onFieldSubmitted,
    this.obscureText,
    this.suffixIcon,
    this.prefixIcon,
    this.hintColor,
    this.exibirBordaErro = false,
    this.onFocus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Cores.transparente,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4.0),
        child: Container(
          width: width,
          child: FocusScope(
            child: Focus(
              onFocusChange: onFocus,
              child: TextFormField(
                obscureText: obscureText ?? false,
                maxLines: obscureText == true ? 1 : maxLines,
                maxLength: max,
                enabled: enable,
                initialValue: initialValue,
                onChanged: onChange,
                controller: controller,
                validator: onValidator as dynamic,
                keyboardType: keyboardType,
                inputFormatters: inputFormatter,
                cursorColor: hintColor ?? Colors.black,
                focusNode: currentFocus,
                onFieldSubmitted: (text) {
                  if (nextFocus != null) {
                    _fieldFocusChange(context, currentFocus!, nextFocus!);
                  }

                  if (onFieldSubmitted != null) {
                    onFieldSubmitted!(text);
                  }
                },
                style: textStyle ??
                    TextStyle(
                      color: Cores.preto,
                      fontWeight: Fontes.medium,
                    ),
                decoration: InputDecoration(
                  suffixIcon: suffixIcon,
                  prefixIcon: prefixIcon,
                  isDense: true,
                  contentPadding: EdgeInsets.all(height),
                  filled: true,
                  fillColor: fillColor,
                  hintText: hintText,
                  hintStyle: TextStyle(
                    color: hintColor ?? Cores.cinza[200],
                    fontWeight: Fontes.normal,
                  ),
                  focusedBorder: InputBorder.none,
                  enabledBorder: exibirBordaErro
                      ? OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                          borderSide: BorderSide(
                            color: borderColor,
                          ),
                        )
                      : InputBorder.none,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
