part of widgets;

class PageStateBuilder<T> extends StatelessWidget {
  const PageStateBuilder({
    Key? key,
    required this.state,
    this.init,
    required this.success,
    this.loading,
    this.failure,
    this.refreshFunction,
  }) : super(key: key);

  factory PageStateBuilder.successOrEmpty({
    Key? key,
    required Widget Function(T data) success,
    required PageState<T> state,
  }) =>
      PageStateBuilder(
        state: state,
        key: key,
        success: success,
        failure: _emptyFailure,
        loading: _emptyLoading,
      );

  final PageState<T> state;
  final Widget Function()? init;
  final Widget Function()? loading;
  final Widget Function(T data) success;
  final Widget Function(AppException message)? failure;
  final FutureOr Function()? refreshFunction;

  static Widget _emptyFailure(_) => const SizedBox.shrink();

  static Widget _emptyLoading() => const SizedBox.shrink();

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      switchOutCurve: Curves.easeOutCirc,
      switchInCurve: Curves.easeInCirc,
      child: KeyedSubtree(
        key: ValueKey(state),
        child: state.when<Widget>(
          empty: _empty,
          init: init ?? _init,
          loading: loading ?? _loading,
          success: (data) => success(data),
          failure: (e) =>
              failure?.call(e) ??
              _failure(
                context,
                e,
                refreshFunction,
              ),
        ),
      ),
    );
  }

  static Widget _loading() => const Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: CircularProgressIndicator.adaptive(),
        ),
      );

  static Widget _init() => const SizedBox();

  static Widget _empty() => const SizedBox();

  static Widget _failure(
    BuildContext context,
    AppException<dynamic> e,
    FutureOr Function()? refreshFunction,
  ) {
    final queryData = MediaQuery.of(context);
    final errorWidget = _buildDefaultFailureWidget(queryData, e, refreshFunction);
    return errorWidget;
  }

  static Widget _buildDefaultFailureWidget(
    MediaQueryData queryData,
    AppException<dynamic> e,
    FutureOr<void> Function()? refreshFunction,
  ) {
    return LayoutBuilder(
      builder: (context, constraints) => RefreshIndicator(
        onRefresh: () async => refreshFunction?.call(),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: SizedBox(
            height: constraints.maxHeight + queryData.padding.top,
            width: queryData.size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                APIErrorWidget(
                  exception: e,
                  refreshFunction: refreshFunction,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PageStateBuilder2<T1, T2> extends StatelessWidget {
  const PageStateBuilder2({
    Key? key,
    required this.state1,
    required this.state2,
    this.init,
    required this.success,
    this.loading,
    this.failure,
    this.refreshFunction,
  }) : super(key: key);

  final PageState<T1> state1;
  final PageState<T2> state2;
  final Widget Function()? init;
  final Widget Function(T1 data1, T2 data2) success;
  final Widget Function()? loading;
  final Widget Function(AppException message)? failure;
  final FutureOr Function(PageState<T1> s1, PageState<T2> s2)? refreshFunction;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration.zero,
      switchOutCurve: Curves.easeOutCirc,
      switchInCurve: Curves.easeInCirc,
      child: KeyedSubtree(
        key: ValueKey(state1),
        child: Builder(
          builder: (context) {
            if (state1.isInit && state2.isInit) {
              return init?.call() ?? PageStateBuilder._init();
            }

            if (state1.isLoading || state2.isLoading) {
              return loading?.call() ?? PageStateBuilder._loading();
            }

            if (state1.isFailure || state2.isFailure) {
              return PageStateBuilder._failure(
                context,
                state1.exceptionOrNull ?? state2.exception,
                () => refreshFunction?.call(
                  state1,
                  state2,
                ),
              );
            }

            if (state1.isEmpty || state2.isEmpty) {
              return PageStateBuilder._empty();
            }

            return success(
              state1.data,
              state2.data,
            );
          },
        ),
      ),
    );
  }
}
