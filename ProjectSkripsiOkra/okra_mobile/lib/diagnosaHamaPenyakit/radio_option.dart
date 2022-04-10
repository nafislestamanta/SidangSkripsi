import 'package:flutter/material.dart';
import 'package:okra_mobile/custom.dart';

class MyRadioOption<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final String label;
  final String text;
  final ValueChanged<T?> onChanged;

  const MyRadioOption({
    required this.value,
    required this.groupValue,
    required this.label,
    required this.text,
    required this.onChanged,
  });

  Widget _buildLabel() {
    final bool isSelected = value == groupValue;

    return Container(
      width: 25,
      height: 25,
      decoration: ShapeDecoration(
        shape: const CircleBorder(
          side: BorderSide(
            color: Colors.black,
          ),
        ),
        color: isSelected ? green2 : Colors.transparent,
      ),
      child: Center(
        child: Text(
          value.toString(),
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget _buildText() {
    return Text(
      text,
      style: const TextStyle(color: Colors.black, fontSize: 10),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: InkWell(
        onTap: () => onChanged(value),
        splashColor: Colors.cyan.withOpacity(0.5),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            children: [
              _buildLabel(),
            ],
          ),
        ),
      ),
    );
  }
}
