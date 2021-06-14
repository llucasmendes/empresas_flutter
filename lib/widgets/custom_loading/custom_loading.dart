import 'package:flutter/material.dart';
import 'package:empresas_flutter/configs/ui/DimensoesTela.dart';
import 'package:empresas_flutter/configs/ui/Icones.dart';

class CustomLoading extends StatefulWidget {
  @override
  _CustomLoadingState createState() => _CustomLoadingState();
}

class _CustomLoadingState extends State<CustomLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animationForward;
  late Animation<double> _animationReverse;

  @override
  void initState() {
    super.initState();
    _criarAnimationController();
  }

  void _criarAnimationController() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..repeat();

    _animationForward = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_animationController);

    _animationReverse = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          RotationTransition(
            turns: _animationForward,
            child: Container(
              height: 47.h,
              width: 47.w,
              child: Image.asset(IconesAplicacao.ellipseInterna),
            ),
          ),
          RotationTransition(
            turns: _animationReverse,
            child: Container(
                height: 72.h,
                width: 72.w,
                child: Image.asset(IconesAplicacao.ellipseExterna)),
          )
        ],
      ),
    );
  }
}
