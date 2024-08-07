import 'package:flutter/material.dart';
import 'package:sipaias_fun_mobile/cores/presentation/component/dialog/loading_screen.dart';

class TaskManager {
  static Future<List<T?>> performMultipleTasksWithLoadingIndicator<T>({
    required BuildContext context,
    required List<Future<T> Function()> tasks,
    required void Function(List<T?> results) onSuccess,
    void Function(Object error)? onError,
  }) async {
    _showLoading(context);
    List<T?> results = [];
    try {
      results = await Future.wait(tasks.map((task) => task()));
      onSuccess(results);
    } catch (error) {
      if (context.mounted) {
        _handleError(error, onError, context);
      }
    } finally {
      if (context.mounted) {
        _hideLoading(context);
      }
    }
    return results;
  }

  static Future<T?> performSingleTaskWithLoadingIndicator<T>({
    required BuildContext context,
    required Future<T> Function() task,
    required void Function(T? result) onSuccess,
    void Function(Object error)? onError,
  }) async {
    _showLoading(context);
    T? result;
    try {
      result = await task();
      onSuccess(result);
    } catch (error) {
      if (context.mounted) {
        _handleError(error, onError, context);
      }
    } finally {
      if (context.mounted) {
        _hideLoading(context);
      }
    }
    return result;
  }

  static void _showLoading(BuildContext context) {
    LoadingScreen.instance().show(context: context);
  }

  static void _hideLoading(BuildContext context) {
    if (context.mounted) {
      LoadingScreen.instance().hide();
    }
  }

  static void _handleError(Object error, void Function(Object error)? onError,
      BuildContext context) {
    if (onError != null) {
      onError(error);
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('An error occurred: $error')),
        );
      }
    }
  }
}
