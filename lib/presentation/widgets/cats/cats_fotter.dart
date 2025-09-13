import 'package:flutter/material.dart';

class FooterCards extends StatelessWidget {

  final String origin;
  final int intelligence;

  const FooterCards({
    super.key,
    required this.origin,
    required this.intelligence
  });

  @override
  Widget build(BuildContext context) {

    final titleStyle = Theme.of(context).textTheme.titleSmall;
    return Container(
      padding: EdgeInsets.only(top: 10),
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Text('Origen: $origin', style: titleStyle),

          const Spacer(),
          Text('Inteligencia: $intelligence de 10', style: titleStyle),
        ],
      ),
    );
  }
}