import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:empresas_flutter/configs/ui/Cores.dart';
import 'package:empresas_flutter/widgets/custom_loading/custom_loading.dart';

class LoadingBlurScreen extends StatelessWidget {
  const LoadingBlurScreen({
    required this.child,
    this.enabled = false,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        child,
        AnimatedOpacity(
          opacity: enabled ? 1 : .0,
          duration: const Duration(milliseconds: 280),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
            child: IgnorePointer(
              ignoring: !enabled,
              child: Container(
                decoration: BoxDecoration(
                  color: Cores.preto.withOpacity(.5),
                ),
                child: Center(
                  child: CustomLoading(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
