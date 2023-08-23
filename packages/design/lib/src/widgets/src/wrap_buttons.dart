/// File Updated by
/// Abed <Abed-supy-io>
/// on 6 /Nov/2022
part of widgets;

enum WrapButtonsType {
  fill,
  outline,
}

class WrapButtonsData {
  final ValueKey? key;
  final String title;
  final WrapButtonsType type;
  final VoidCallback? onPressed;
  final Color? color;
  final Color? borderColor;
  final Color? titleColor;

  final bool isEnable;

  WrapButtonsData({
    required this.title,
    required this.type,
    this.onPressed,
    this.color,
    this.key,
    this.titleColor,
    this.borderColor,
    this.isEnable = true,
  });
}

class WrapButtons extends StatelessWidget {
  final List<WrapButtonsData> buttons;

  const WrapButtons({
    Key? key,
    required this.buttons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: _handleItems(),
    );
  }

  List<Widget> _handleItems() {
    List<Widget> items = [];
    List<Widget> rows = [];
    for (int i = buttons.length - 1; i >= 0; i--) {
      rows.add(
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),
            child: _handleButtonType(buttons[i]),
          ),
        ),
      );
      if (i % 2 == 0) {
        items.add(Row(children: rows));
        rows = [];
      }
    }
    return items.reversed.toList();
  }

  Widget _handleButtonType(WrapButtonsData data) {
    switch (data.type) {
      case WrapButtonsType.fill:
        return FilledButton(
          key: data.key,
          onPressed: data.onPressed,
          child: Text(data.title),
        );
      case WrapButtonsType.outline:
        return OutlinedButton(
          key: data.key,
          onPressed: data.onPressed,
          child: Text(data.title),
        );
    }
  }
}
