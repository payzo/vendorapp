import 'package:flutter/material.dart';

///
/// Wrap around any widget that makes an async call to show a modal progress
/// indicator while the async call is in progress.
///
/// The progress indicator can be turned on or off using [inAsyncCall]
///
/// The progress indicator defaults to a [CircularProgressIndicator] but can be
/// any kind of widget
///
/// The progress indicator can be positioned using [offset] otherwise it is
/// centered
///
/// The modal barrier can be dismissed using [dismissible]
///
/// The color of the modal barrier can be set using [color]
///
/// The opacity of the modal barrier can be set using [opacity]
///
class ModalProgress extends StatelessWidget {
  final bool inAsyncCall;
  final double opacity;
  final Color color;
  final Widget progressIndicator;
  final Offset? offset;
  final bool dismissible;
  final Widget child;

  const ModalProgress({
    Key? key,
    required this.inAsyncCall,
    this.opacity = 0.8,
    this.color = Colors.black12,
    this.progressIndicator = const CircularProgressIndicator(
      color: Colors.amber,
    ),
    this.offset,
    this.dismissible = false,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!inAsyncCall) return child;

    Widget layOutProgressIndicator;
    if (offset == null) {
      layOutProgressIndicator = Center(child: progressIndicator);
    } else {
      layOutProgressIndicator = Positioned(
        left: offset?.dx,
        top: offset?.dy,
        child: progressIndicator,
      );
    }

    return Stack(
      children: [
        child,
        Positioned.fill(
          child: Opacity(
            opacity: opacity,
            child: ModalBarrier(dismissible: dismissible, color: color),
          ),
        ),
        layOutProgressIndicator,
      ],
    );
  }
}
