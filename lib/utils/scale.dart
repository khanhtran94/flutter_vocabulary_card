class Scale {
  Scale._(this.context)
      : width = MediaQuery.sizeOf(context).width,
        height = MediaQuery.sizeOf(context).height {
    wFactor = width / 390.0;
    hFactor = height / 844.0;
    textFactor = math.min(wFactor, hFactor);
  }

  final BuildContext context;
  final double width;
  final double height;
  late final double wFactor;
  late final double hFactor;
  late final double textFactor;

  double w(double value) => value * wFactor;
  double h(double value) => value * hFactor;
  double sp(double value) => value * textFactor;
  double r(double value) => value * math.min(wFactor, hFactor);
}

extension ScaleX on BuildContext {
  Scale get scale => Scale._(this);
}

