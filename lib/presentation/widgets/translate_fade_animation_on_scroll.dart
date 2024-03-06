import 'package:flutter/material.dart';

class TranslateFadeAnimationOnScroll extends StatefulWidget {
  final Widget child;
  final ScrollController? scrollController;
  final Duration duration;
  final Curve curve;

  const TranslateFadeAnimationOnScroll(
      {Key? key,
      required this.child,
      this.duration = const Duration(milliseconds: 500),
      this.curve = Curves.easeInOut,
      this.scrollController})
      : super(key: key);

  @override
  State<TranslateFadeAnimationOnScroll> createState() =>
      _TranslateFadeAnimationState();
}

class _TranslateFadeAnimationState extends State<TranslateFadeAnimationOnScroll>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _translateAnimation;
  bool _isWidgetInView = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _translateAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    ));

    if (widget.scrollController == null) {
      _controller.forward();
    } else {
      widget.scrollController?.addListener(_onScroll);
    }
  }

  void _onScroll() {
    setState(() {
      _isWidgetInView = _isTargetWidgetInView();
    });
    if (_isWidgetInView) _controller.forward();
  }

  bool _isTargetWidgetInView() {
    final RenderObject? renderObject =
        _targetWidgetKey.currentContext?.findRenderObject();
    if (renderObject != null && renderObject is RenderBox) {
      final targetWidgetOffset = renderObject.localToGlobal(Offset.zero);
      final viewportHeight = MediaQuery.of(context).size.height;
      final widgetTopPosition = targetWidgetOffset.dy;
      final widgetBottomPosition = widgetTopPosition + renderObject.size.height;

      return widgetTopPosition < viewportHeight && widgetBottomPosition > 0;
    }
    return false;
  }

  final GlobalKey _targetWidgetKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      key: _targetWidgetKey,
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: _fadeAnimation.value,
          child: Transform.translate(
            offset: _translateAnimation.value,
            child: widget.child,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    widget.scrollController?.dispose();
    super.dispose();
  }
}
