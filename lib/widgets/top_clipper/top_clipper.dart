import 'package:flutter/material.dart';
import 'package:empresas_flutter/configs/ui/Cores.dart';
import 'package:empresas_flutter/configs/ui/DimensoesTela.dart';
import 'package:empresas_flutter/configs/ui/Fontes.dart';
import 'package:empresas_flutter/configs/ui/Icones.dart';

class TopClipper extends StatefulWidget {
  final bool exibirTexto;
  final double alturaWidget;
  final String texto;

  const TopClipper({
    Key? key,
    this.exibirTexto = true,
    this.alturaWidget = 250,
    this.texto = '',
  }) : super(key: key);

  @override
  _TopClipperState createState() => _TopClipperState();
}

class _TopClipperState extends State<TopClipper>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _criarAnimationController();
    _animationController.forward();
  }

  void _criarAnimationController() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
    );

    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyCustomClipper(),
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (BuildContext context, Widget child) {
          return Container(
            height: widget.alturaWidget.h - _animation.value * 100,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(IconesAplicacao.background),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 40.h,
                  width: 40.w,
                  child: Image.asset(IconesAplicacao.logo),
                ),
                if (widget.exibirTexto)
                  AnimatedBuilder(
                      animation: _animationController,
                      builder: (_, __) {
                        return Opacity(
                          opacity: 1 - _animation.value,
                          child: Text(
                            widget.texto,
                            style: TextStyle(
                              fontFamily: Fontes.montserrat,
                              fontWeight: Fontes.normal,
                              fontSize: 20.ssp,
                              color: Cores.branco,
                            ),
                          ),
                        );
                      }),
                SizedBox(
                  height: 25.h,
                )
              ],
            ),
          );
        } as dynamic,
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var controlPoint = Offset(size.width / 2, size.height);
    var endPoint = Offset(size.width, size.height - 100.h);

    Path path = Path()
      ..lineTo(0, size.height - 100.h)
      ..quadraticBezierTo(
        controlPoint.dx,
        controlPoint.dy,
        endPoint.dx,
        endPoint.dy,
      )
      ..lineTo(size.width, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
