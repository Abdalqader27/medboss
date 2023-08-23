import 'package:design/design.dart';
import 'package:lottie/lottie.dart';

import '../../resources/resources.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({Key? key, this.color}) : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ColorFiltered(
            colorFilter: ColorFilter.mode(
              color?? theme.colorScheme.onPrimaryContainer,
              BlendMode.srcIn,
            ),
            child: Lottie.asset(
              width: 200,
              height: 200,
              JsonRes.smileLoadingBlack,
            ),
          ),
        ],
      ),
    );
  }
}
