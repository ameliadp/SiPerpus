import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'utils.dart';

class LoadingOverlayAlt extends StatelessWidget {
  LoadingOverlayAlt({Key? key, required this.child})
      : _isLoadingNotifier = ValueNotifier(false),
        super(key: key);

  final ValueNotifier<bool> _isLoadingNotifier;
  final Widget child;

  static LoadingOverlayAlt of(BuildContext context) {
    return context.findAncestorWidgetOfExactType<LoadingOverlayAlt>()!;
  }

  void show() {
    _isLoadingNotifier.value = true;
  }

  void hide() {
    _isLoadingNotifier.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _isLoadingNotifier,
      child: child,
      builder: (context, isLoading, child) {
        return Stack(
          children: [
            child!,
            if (isLoading)
              ModalBarrier(
                  dismissible: false, color: Colors.black.withOpacity(0.5)),
            if (isLoading)
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: colorPrimary,
                  ),
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      DefaultCircularProgressIndicator(),
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        'Mohon Tunggu...',
                        style: TextStyle(
                          fontSize: 14,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

void showLoading() {
  return LoadingOverlayAlt.of(Get.context!).show();
}

void dismissLoading() {
  return LoadingOverlayAlt.of(Get.context!).hide();
}
