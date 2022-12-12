import 'package:flutter/material.dart';

class TitleHeader extends StatelessWidget {
  final String textTop;
  final String? textBottom;
  const TitleHeader({Key? key, required this.textTop, this.textBottom})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textTop,
          style: TextStyle(
            color: Color.fromRGBO(170, 195, 138, 1),
            fontWeight: FontWeight.w600,
            fontSize: 25,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
            padding: const EdgeInsets.all(0.0),
            child: textBottom != null
                ? Text(
                    textBottom!,
                    style: TextStyle(
                      color: Color.fromRGBO(38, 38, 38, 1),
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  )
                : null),
      ],
    );
  }
}
