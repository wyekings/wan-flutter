import 'package:flutter/material.dart';

class LoadingDialog {
  LoadingDialog._();

  static Future<void> show(BuildContext context,
      {String? msg, bool canPop = true}) {
    return showDialog<void>(
      context: context,
      builder: (context) => _loadingDialog(context, msg: msg, canPop: canPop),
      barrierDismissible: false,
    );
  }

  static void hide(BuildContext context) {
    Navigator.of(context).pop();
  }

  static Widget _loadingDialog(BuildContext context,
          {String? msg, bool canPop = true}) =>
      PopScope(
          canPop: canPop,
          child: UnconstrainedBox(
            constrainedAxis: Axis.vertical,
            child: SizedBox(
              width: 240.0,
              height: 180.0,
              child: AlertDialog(
                backgroundColor: Colors.black87,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.0,
                        valueColor: AlwaysStoppedAnimation(Colors.white70),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        msg ?? '加载中...',
                        style: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.white70,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ));
}
