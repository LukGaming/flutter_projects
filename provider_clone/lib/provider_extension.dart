import 'package:flutter/material.dart';
import 'package:provider_clone/provider.dart';

extension ProviderExtension<T extends InheritedWidget> on BuildContext {
  ValueNotifier readValue<E extends ValueNotifier>() {
    Provider? contextProvider = dependOnInheritedWidgetOfExactType<Provider>();
    if (contextProvider == null) {
      throw "No providers given";
    } else {
      if (contextProvider.providers.isEmpty) {
        throw "No providers of the type $E given";
      }
    }
    print(contextProvider.providers.length);
    for (int i = 0; i < contextProvider.providers.length; i++) {
      final currentProvider = contextProvider.providers[i].listenable;
      if (currentProvider is E) {
        currentProvider.addListener(_callback);
        return currentProvider;
      }
    }

    throw "No providers of the type $E give 2";
  }

  void _callback() {
    (this as Element).markNeedsBuild();
  }
}
