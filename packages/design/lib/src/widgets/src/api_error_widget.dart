part of widgets;

class APIErrorWidget extends StatelessWidget {
  const APIErrorWidget({
    Key? key,
    required this.exception,
    this.refreshFunction,
  }) : super(key: key);

  final dynamic exception;
  final FutureOr Function()? refreshFunction;

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _icon(),
            _text(context),
            if (refreshFunction != null)
              FilledButton.tonal(
                onPressed: refreshFunction,
                child:
                    Text(Intl.message('retry', locale: locale.languageCode)),
              )
          ],
        ),
      ),
    );
  }

  Widget _text(BuildContext context) {
    final locale = Localizations.localeOf(context);

    final exception = this.exception;
    late final String body;
    final title = Intl.message('oops', locale: locale.languageCode);
    final subTitle =
        Intl.message('error_unable_to_load', locale: locale.languageCode);

    if (exception is AppNetworkException) {
      switch (exception.reason) {
        case AppNetworkExceptionReason.canceled:
        case AppNetworkExceptionReason.responseError:
        case AppNetworkExceptionReason.serverError:
          body = Intl.message(
            'error_something_wrong',
            locale: locale.languageCode,
          );
          break;
        case AppNetworkExceptionReason.timedOut:
        case AppNetworkExceptionReason.noInternet:
          body = Intl.message(
            'error_internet_issue',
            locale: locale.languageCode,
          );

          break;
      }
    } else {
      body = Intl.message(
        'error_something_wrong',
        locale: locale.languageCode,
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 16,
        ),
        Text(
          textAlign: TextAlign.center,
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontSize: 24, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          body,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              height: 1.7),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          subTitle,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              height: 1.5),
        ),
        const SizedBox(
          height: 32,
        ),
      ],
    );
  }

  Widget _icon() {
    return Lottie.asset(
      'assets/json/no_internet.json',
      width: 250,
      height: 250,
    );
  }
}
