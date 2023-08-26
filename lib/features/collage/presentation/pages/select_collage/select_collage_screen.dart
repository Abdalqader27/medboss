import 'package:core/core.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';
import 'package:design/design.dart';
import 'package:lottie/lottie.dart';
import 'package:medboss/core/ads/widgets/banner.dart';
import 'package:medboss/core/ads/widgets/rewarded.dart';
import 'package:medboss/features/collage/presentation/pages/select_collage/select_collage_provider.dart';
import 'package:medboss/features/collage/presentation/pages/select_collage/select_collage_stream.dart';
import 'package:provider/provider.dart';

import '../../../../../core/injections/service_locator.dart';
import '../../../../../core/storage/storage_service.dart';
import '../../../../../generated/assets.dart';
import '../../../../../resources/resources.dart';
import '../../../../file/presentation/pages/provider/boot_files_provider.dart';
import '../../../domain/entities/collage.dart';

class SelectCollageScreen extends StatelessWidget {
  const SelectCollageScreen({Key? key}) : super(key: key);
  static const path = '/$subPath';
  static const subPath = 'select-collage-screen';
  static const name = 'select_collage_screen';

  static const ValueKey pageKey = ValueKey(name);

  static Page pageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage<void>(
      key: state.pageKey,
      child: const SelectCollageScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SelectCollageProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('اختر الكلية'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          provider.fetchCollages(FetchPolicy.cacheAndNetwork);
        },
        child: PageStateBuilder(
          state: provider.pageState,
          success: (data) {
            return AnimationLimiter(
              child: ListView.separated(
                padding: EdgeInsetsConstrains.listView,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final collage = data[index];
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 375),
                    child: SlideAnimation(
                      verticalOffset: 50.0,
                      child: FadeInAnimation(
                        child: _CollageItem(collage: collage),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Space.vxs;
                },
              ),
            );

          },
        ),
      ),
    );
  }
}

class _CollageItem extends StatelessWidget {
  const _CollageItem({
    Key? key,
    required this.collage,
  }) : super(key: key);

  final Collage collage;

  @override
  Widget build(BuildContext context) {
    const iconSurfaceSize = 35.0;
    const duration = Duration(milliseconds: 200);
    final theme = Theme.of(context);
    final collageSelection = sl<SelectCollageStream>();
    return StreamBuilder<String?>(
        stream: collageSelection.collageStream,
        builder: (context, snapshot) {
          final selectedCollage = snapshot.data;
          return Opacity(
            opacity: 0.8,
            child: Bounce(
              duration: duration,
              onPressed: () {
                collageSelection.setCollageStream = collage.collageId;
              context.pop();
                },

              child: Card(
                child: SizedBox(
                  height: 80,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: ListTile(
                          title: Text(
                            collage.name,
                          ),
                          leading: Container(
                            width: iconSurfaceSize,
                            height: iconSurfaceSize,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppColors.lightGrey.withAlpha(150),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: selectedCollage == collage.collageId
                                ? Icon(Icons.check, color: theme.primaryColor)
                                : const SizedBox.shrink(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }


}
