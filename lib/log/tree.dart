import 'package:flutter/cupertino.dart';
import 'package:fluttery_timber/fluttery_timber.dart';
import 'package:logger/logger.dart';

class DebugLoggerTree extends TimberTree {
  final logger = Logger(
    printer: PrettyPrinter(
      stackTraceBeginIndex: 2,
      methodCount: 3,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: false,
      printTime: false,
    ),
  );

  @override
  void onMessage(TimberLevel level, String message,
      {String? tag, error, StackTrace? stackTrace}) {
    logger.log(_convertToLoggerLevel(level), message, error: error, stackTrace: stackTrace);
  }

  Level _convertToLoggerLevel(TimberLevel level) {
    switch (level) {
      case TimberLevel.info:
        return Level.info;
      case TimberLevel.debug:
        return Level.debug;
      case TimberLevel.warning:
        return Level.warning;
      case TimberLevel.error:
        return Level.error;
      default:
        return Level.off;
    }
  }
}

class ReleaseTree extends TimberTree {
  @override
  void onMessage(TimberLevel level, String message,
      {String? tag, error, StackTrace? stackTrace}) {
    // report
  }
}
