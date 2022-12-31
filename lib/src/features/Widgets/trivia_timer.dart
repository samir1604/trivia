import 'dart:async';
import 'package:flutter/material.dart';

/// Trivia timer
class TriviaTimer extends StatefulWidget {
  /// Constructor
  const TriviaTimer({
    super.key,
    double? width,
    double? height,
    required this.initialSeconds,
    this.backgroundColor = Colors.transparent,
    this.onFinished,
  })  : _width = width,
        _height = height ?? _defaultHeight;


  static const double _defaultHeight = 25;

  /// Timer background color
  final Color backgroundColor;

  /// Timer width
  final double? _width;

  /// Timer height
  final double _height;

  /// Initial time
  final int initialSeconds;

  /// Fire event after finished counter
  final VoidCallback? onFinished;

  @override
  State<TriviaTimer> createState() => TriviaTimerState();
}

/// Management trivia timer state
class TriviaTimerState extends State<TriviaTimer> {
  static const _defaultRadius = 50.0;
  static const _colorProgress = [Color(0xfffd4d69), Color(0xffb66ef8)];

  static int _secondsDown = 0;
  static int _secondsUp = 0;
  late Timer? _timer;

  @override
  void initState() {
    Future.delayed(Duration.zero, initTimer);
    super.initState();
  }

  /// Cancel timer
  void cancelTimer() {
    if(_timer != null) {
      _timer?.cancel();
    }
  }

  /// Init Timer
  void initTimer() {
    _secondsDown = widget.initialSeconds;
    _secondsUp = 0;
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        if (_secondsDown <= 1) {
          _timer?.cancel();
          if (widget.onFinished != null) {
            widget.onFinished?.call();
          }
        }
        _secondsDown--;
        _secondsUp++;
      });
    });
  }

  @override
  void dispose() {
    if (_timer != null) {
      _secondsDown = 0;
      _secondsUp =0;
      _timer?.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final currentWidth = (widget._width != null &&
                widget._width != double.infinity &&
                widget._width != double.maxFinite &&
                widget._width != double.negativeInfinity &&
                widget._width != double.nan)
            ? widget._width!
            : constraints.maxWidth;
        final computedWidth =
            currentWidth * (1 - (_secondsUp / widget.initialSeconds));
        return ClipRRect(
          borderRadius: BorderRadius.circular(_defaultRadius),
          child: Stack(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 950),
                width: computedWidth,
                height: widget._height,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(_defaultRadius),
                  gradient: const LinearGradient(
                    colors: _colorProgress,
                  ),
                ),
              ),
              Container(
                width: currentWidth,
                height: widget._height,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: widget.backgroundColor,
                  ),
                  borderRadius: BorderRadius.circular(_defaultRadius),
                  color: Colors.transparent,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 5, left: 5),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox.shrink(),
                      Text(
                        _secondsDown.toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.access_time, size: widget._height * .6),
                    ],
                  ),
                ),
              ),
              Container(
                width: currentWidth,
                height: widget._height,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    color: Colors.grey,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(_defaultRadius),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
