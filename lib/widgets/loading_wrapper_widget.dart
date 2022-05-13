import 'package:flutter/material.dart';
import 'package:single_house/widgets/app_loader.dart';

class LoadingWrapper extends StatelessWidget {
  const LoadingWrapper({
    Key? key,
    required this.isLoading,
    required this.child,
  }) : super(key: key);
  final bool isLoading;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (isLoading) ...[
          AppLoader(),
          child,
        ] else ...[
          child,
        ]
      ],
    );
  }
}
