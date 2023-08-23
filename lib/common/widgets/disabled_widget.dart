import 'package:design/design.dart';

class DisabledWidget extends StatelessWidget {
  const DisabledWidget({
    Key? key,
    this.disable = false,
    required this.child,
    this.onTap,
  }) : super(key: key);
  final bool disable;
  final Widget child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: disable ? onTap : null,
      child: AbsorbPointer(
        absorbing: disable,
        child: Opacity(
          opacity: disable ? 0.75 : 1,
          child: child,
        ),
      ),
    );
  }
}
