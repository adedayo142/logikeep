import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnTapFade extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  const OnTapFade({super.key, required this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ValueBuilder<bool?>(
      initialValue: false,
      builder: (snapshot, updateFn) {
        return GestureDetector(
          onTapDown: (tapDetails) {
            updateFn(true);
          },
          onTapUp: (tapDetails) async {
            await Future.delayed(const Duration(milliseconds: 100));
            updateFn(false);
          },
          onPanStart: (tapDetails) {
            updateFn(true);
          },
          onPanEnd: (tapDetails) async {
            await Future.delayed(const Duration(milliseconds: 100));
            updateFn(false);
          },
          onPanCancel: () async {
            await Future.delayed(const Duration(milliseconds: 100));
            updateFn(false);
          },
          onTap: onTap,
          child: Opacity(
            opacity: snapshot! ? .5 : 1,
            child: child,
          ),
        );
      },
    );
  }
}
