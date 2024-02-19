import 'package:flutter/material.dart';

//botón switch personalizado que permite funciones
//al activar o desactivar el switch
class BotonSwitchOff extends StatefulWidget {
  const BotonSwitchOff({
    Key? key,
    required this.defaultLight,
    required this.onChanged,
  }) : super(key: key);

  final bool defaultLight;
  final ValueChanged<bool> onChanged;

  @override
  State<BotonSwitchOff> createState() => _BotonSwitchOffState();
}

class _BotonSwitchOffState extends State<BotonSwitchOff> {
  late bool light;

  @override
  void initState() {
    super.initState();
    light = widget.defaultLight;
  }

  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(
          Icons.check,
          color: Colors.white,
        );
      }
      return const Icon(Icons.close);
    },
  );

  @override
  Widget build(BuildContext context) {
    return Switch(
      thumbIcon: thumbIcon,
      activeColor: Colors.green,
      value: light,
      onChanged: (bool value) {
        setState(() {
          light = value;
          widget.onChanged(value);
        });
      },
    );
  }
}
