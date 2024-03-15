
import 'package:fluttertoast/fluttertoast.dart';

class ToastUtil {

  ToastUtil._();

  static void show(String msg) {
    Fluttertoast.showToast(msg: msg, toastLength: Toast.LENGTH_LONG);
  }

  static void cancel() => Fluttertoast.cancel();
}
