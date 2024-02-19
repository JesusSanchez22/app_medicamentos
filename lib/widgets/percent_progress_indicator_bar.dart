import 'package:flutter/material.dart';

//widget personalizado de una barra que progresa según
//le indiquemos, tenía función en una versión anterior
//de la app, y tendrá función en una versión futura
class PercentProgressIndicator extends StatefulWidget {
  final double percent;
  final Color backgroundColor;
  final Color progressColor;
  final double height;
  final double width;
  final double borderRadius;

  const PercentProgressIndicator({
    super.key,
    required this.percent,
    this.backgroundColor = Colors.grey,
    this.progressColor = Colors.green,
    this.height = 20,
    this.width = 300,
    this.borderRadius = 12,
  });

  @override
  State<PercentProgressIndicator> createState() =>
      _PercentProgressIndicatorState();
}

class _PercentProgressIndicatorState extends State<PercentProgressIndicator> {
  double _width = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _width = widget.percent * widget.width;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 300,
          height: 20,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              color: widget.backgroundColor),
        ),
        AnimatedContainer(
            duration: const Duration(milliseconds: 800),
            width: _width,
            height: widget.height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                color: widget.progressColor)),
      ],
    );
  }
}
