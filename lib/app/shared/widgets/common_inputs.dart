import 'package:flutter/material.dart';

class CommonInputs {
  static Widget theTextFormField() {
    return TextFormField();
  }

  static Widget theContainer<T extends Widget>({
    required T child,
    BorderRadiusGeometry? borderRadius,
    BoxShape? shape,
  }) {
    return Container(
      child: child,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: borderRadius ?? BorderRadius.circular(10),
        shape: shape ?? BoxShape.rectangle,
      ),
    );
  }
}

class HomeTested extends StatelessWidget {
  const HomeTested({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonInputs.theContainer(
          child: CommonInputs.theTextFormField(),
        ),
        CommonInputs.theTextFormField(),
      ],
    );
  }
}
