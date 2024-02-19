import 'package:flutter/material.dart';

//checkbox personalizado que permitirá que realicemos
//distintas funciones al activarlo o desactivarlo
class CheckboxExample extends StatefulWidget {
  final ValueChanged<bool?>? onChanged;

  const CheckboxExample({Key? key, this.onChanged}) : super(key: key);

  @override
  State<CheckboxExample> createState() => _CheckboxExampleState();
}

class _CheckboxExampleState extends State<CheckboxExample> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.white;
    }

    return Checkbox(
      checkColor: Colors.green,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
        // Llamar al callback onChanged si está definido
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }
      },
    );
  }
}
