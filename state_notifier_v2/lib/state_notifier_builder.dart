// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class StateNotifierBuilder<T> extends StatefulWidget {
  final ValueListenable<T> listenable;
  final Widget Function(BuildContext context, T state) builder;
  final bool Function(T oldState, T newState)? buildWhen;
  final void Function(BuildContext context, T state)? listen;

  const StateNotifierBuilder({
    super.key,
    required this.listenable,
    required this.builder,
    this.listen,
    this.buildWhen,
  });

  @override
  State<StateNotifierBuilder<T>> createState() =>
      _StateNotifierBuilderState<T>();
}

class _StateNotifierBuilderState<T> extends State<StateNotifierBuilder<T>> {
  late T state;

  @override
  void initState() {
    state = widget.listenable.value;
    widget.listenable.addListener(callback);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant StateNotifierBuilder<T> oldWidget) {
    widget.listenable.addListener(callback);
    super.didUpdateWidget(oldWidget);
  }

  void callback() {
    if (widget.buildWhen != null) {
      bool shouldRebuild = widget.buildWhen!(state, widget.listenable.value);
      if (shouldRebuild != false) {
        updateStateAndRebuild();
      }
    } else {
      updateStateAndRebuild();
    }

    if (widget.listen != null) {
      widget.listen!(context, state);
    }
  }

  void updateStateAndRebuild() {
    state = widget.listenable.value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(
      context,
      state,
    );
  }

  @override
  void dispose() {
    widget.listenable.removeListener(callback);
    super.dispose();
  }
}
