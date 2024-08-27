import 'dart:async';

import 'package:flutter/material.dart';

final class LoaderManager {
  LoaderManager(this._key);

  final GlobalKey<NavigatorState> _key;
  static List<LoaderRoute>? _routes;

  void show({Object? id, bool barrierDismissible = false}) {
    assert(_key.currentState != null,
        'Tried to show dialog but navigatorState was null. Key was :$_key');
    final navigatorState = _key.currentState!;
    _routes ??= <LoaderRoute>[];
    assert(
      id == null ||
          _routes!.where((element) => element.id == id).toList().isEmpty,
      'There is already a loader showing with id: $id',
    );

    final route = LoaderRoute(
      id: id,
      barrierDismissible: barrierDismissible,
      context: navigatorState.context,
      builder: (context) => loaderComponent(context),
    );

    _routes!.add(route);
    navigatorState.push(route);
  }

  Widget loaderComponent(BuildContext context) {
    final textController = StreamController<String>();
    textController.add("Example Loader");
    final size = MediaQuery.of(context).size;

    return Center(
      child: Container(
        constraints: BoxConstraints(
          maxWidth: size.width * .8,
          maxHeight: size.width * .8,
          minWidth: size.width * .5,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              const CircularProgressIndicator(),
              const SizedBox(height: 10),
              StreamBuilder(
                stream: textController.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      snapshot.requireData,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Colors.black),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void hide({Object? id}) {
    if (_routes == null) {
      debugPrint('There is no loader to hide');
      return;
    }
    assert(
      id == null ||
          _routes!.where((element) => element.id == id).toList().isNotEmpty,
      'Tried to close loader with id: $id which does not exist',
    );
    assert(_key.currentState != null,
        'Tried to hide dialog but navigatorState was null. Key was :$_key');
    final navigatorState = _key.currentState!;
    if (id == null) {
      navigatorState.removeRoute(_routes!.removeLast());
      if (_routes!.isEmpty) {
        _routes = null;
      }
    } else {
      final routeIndex = _routes!.indexWhere((element) => element.id == id);
      navigatorState.removeRoute(_routes!.removeAt(routeIndex));
      if (_routes!.isEmpty) {
        _routes = null;
      }
    }
  }
}

final class LoaderRoute extends DialogRoute<dynamic> {
  LoaderRoute({
    required super.context,
    required super.builder,
    this.id,
    super.barrierDismissible,
  });

  final Object? id;
}
