/// File created by
/// Abed <Abed-supy-io>
/// on 27 /Apr/2022

part of widgets;

class SKeyboardVisibilityBuilder extends StatefulWidget {
  final Widget? child;
  final Widget Function(
    BuildContext context,
    Widget? child,
    bool isKeyboardVisible,
  ) builder;

  const SKeyboardVisibilityBuilder({
    Key? key,
    this.child,
    required this.builder,
  }) : super(key: key);

  @override
  State<SKeyboardVisibilityBuilder> createState() => _SKeyboardVisibilityBuilderState();
}

class _SKeyboardVisibilityBuilderState extends State<SKeyboardVisibilityBuilder> with WidgetsBindingObserver {
  bool? _isKeyboardVisible = WidgetsBinding.instance.window.viewInsets.bottom > 0.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final bottomInset = WidgetsBinding.instance.window.viewInsets.bottom;
    final newValue = bottomInset > 0.0;
    if (newValue != _isKeyboardVisible) {
      setState(() => _isKeyboardVisible = newValue);
    }
  }

  @override
  Widget build(BuildContext context) => widget.builder(
        context,
        widget.child,
        _isKeyboardVisible!,
      );
}

class KeyboardVisibilityBuilder extends StatelessWidget {
  final Widget Function()? open;
  final Widget Function() closed;
  final bool animate;
  final Duration duration;
  final AnimatedSwitcherTransitionBuilder? transitionBuilder;

  const KeyboardVisibilityBuilder({
    Key? key,
    this.open,
    required this.closed,
    this.animate = true,
    this.duration = const Duration(milliseconds: 200),
    this.transitionBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return kv.KeyboardVisibilityBuilder(
      builder: (_, isKeyboardVisible) {
        if (!animate) {
          return _buildKeyedSubtree(isKeyboardVisible);
        }
        return AnimatedSwitcher(
          duration: duration,
          transitionBuilder: (context, animation) {
            return transitionBuilder?.call(context, animation) ??
                SizeTransition(
                  sizeFactor: animation,
                  child: context,
                );
          },
          child: _buildKeyedSubtree(isKeyboardVisible),
        );
      },
    );
  }

  KeyedSubtree _buildKeyedSubtree(bool isKeyboardVisible) {
    return KeyedSubtree(
      key: ValueKey(isKeyboardVisible),
      child: !isKeyboardVisible ? closed() : open?.call() ?? const SizedBox(),
    );
  }
}
