import 'package:ancora_artes/src/config/custom_colors.dart';
import 'package:flutter/material.dart';

class QuantityWidget extends StatelessWidget {
  final int value;
  final String suffixText;
  final Function(int quantity) result;
  final bool isRemovable;

  const QuantityWidget({
    super.key,
    required this.value,
    required this.suffixText,
    required this.result,
    this.isRemovable = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: CustomColors.customBlueMedium,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: CustomColors.customBlueLight,
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Botão de menos
          _QuantityButton(
            icon: !isRemovable || value > 1 ? Icons.remove : Icons.delete_forever_outlined,
            color: !isRemovable || value > 1 ? Colors.blueAccent : Colors.red,
            onPressed: () {
              if (value == 1 && !isRemovable) return;

              int resultCount = value - 1;
              result(resultCount);
            },
          ),

          // Quantidade
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              '$value$suffixText',
              style: const TextStyle(
                color: Colors.white60,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Botão de mais
          _QuantityButton(
            icon: Icons.add,
            color: Colors.green,
            onPressed: () {
              int resultCount = value + 1;
              result(resultCount);
            },
          ),
        ],
      ),
    );
  }
}

class _QuantityButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final VoidCallback onPressed;

  const _QuantityButton({
    Key? key,
    required this.color,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(25),
        onTap: onPressed,
        child: Ink(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
          ),
        ),
      ),
    );
  }
}
