import 'package:flutter/material.dart';
import 'package:stream_builders/luk_x_basestate.dart';

class LukXWidget extends StatelessWidget {
  final LukXState state;
  final Widget Function(LukXState) builder;
  const LukXWidget({
    super.key,
    required this.state,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return const StreamBuilder(stream: builder.call(), builder: (context, snapshot) => ,);
  }
}
