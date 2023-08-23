import 'package:flutter/material.dart';

const kIconSize = 24.0;

abstract class LayoutConstrains {
  LayoutConstrains._();

  static const xs = 2.0;
  static const s = 4.0;
  static const xm = 8.0;
  static const m = 12.0;
  static const l = 16.0;
  static const xl = 32.0;
  static const xxl = 64.0;
}

abstract class Space {
  Space._();

  static const vxs = SizedBox(height: LayoutConstrains.xs);
  static const vs = SizedBox(height: LayoutConstrains.s);
  static const vm = SizedBox(height: LayoutConstrains.m);
  static const vl = SizedBox(height: LayoutConstrains.l);
  static const vxl = SizedBox(height: LayoutConstrains.xl);
  static const vXXL = SizedBox(height: LayoutConstrains.xxl);

  static const hxs = SizedBox(width: LayoutConstrains.xs);
  static const hs = SizedBox(width: LayoutConstrains.s);
  static const hm = SizedBox(width: LayoutConstrains.m);
  static const hl = SizedBox(width: LayoutConstrains.l);
  static const hxl = SizedBox(width: LayoutConstrains.xl);
}

abstract class RadiusConstrains {
  RadiusConstrains._();

  static const button = 8.0;
  static const floatingButton = 20.0;
  static const container = 12.0;
  static const tabs = 12.0;
  static const texFiled = 12.0;
  static const chip = 12.0;
  static const checkBox = 4.0;
  static const bottomSheet = 16.0;
}

abstract class BorderRadiusConstrains {
  BorderRadiusConstrains._();

  static const button = BorderRadius.all(
    Radius.circular(RadiusConstrains.button),
  );
  static const tabs = BorderRadius.all(
    Radius.circular(RadiusConstrains.tabs),
  );

  static const floatingButton = BorderRadius.all(
    Radius.circular(RadiusConstrains.floatingButton),
  );
  static const container = BorderRadius.all(
    Radius.circular(RadiusConstrains.container),
  );

  static const texFiled = BorderRadius.all(
    Radius.circular(RadiusConstrains.texFiled),
  );

  static const chip = BorderRadius.all(
    Radius.circular(RadiusConstrains.chip),
  );

  static const checkBox = BorderRadius.all(
    Radius.circular(RadiusConstrains.checkBox),
  );

  static const bottomSheet = BorderRadius.only(
    topLeft: Radius.circular(RadiusConstrains.bottomSheet),
    topRight: Radius.circular(RadiusConstrains.bottomSheet),
  );
}

abstract class EdgeInsetsConstrains {
  EdgeInsetsConstrains._();

  static const listView = EdgeInsets.symmetric(
    horizontal: LayoutConstrains.xl,
    vertical: LayoutConstrains.xl,
  );

  static const textFiled = EdgeInsets.all(LayoutConstrains.m);
  static const table = EdgeInsets.all(LayoutConstrains.s);
  static const listTile = EdgeInsets.all(LayoutConstrains.m);

  static const card = EdgeInsets.all(LayoutConstrains.l);

  static const button = EdgeInsets.all(LayoutConstrains.m);

  static const smallIconPadding = EdgeInsets.all(LayoutConstrains.xs);

  static const iconPadding = EdgeInsets.all(LayoutConstrains.xm);

  static const largeIconPadding = EdgeInsets.all(LayoutConstrains.l);

  static const bottomFloatBuffer = EdgeInsets.only(
    bottom: LayoutConstrains.xxl,
  );
  static const horizontal = EdgeInsets.symmetric(
    horizontal: LayoutConstrains.l,
  );

  static const dHorizontal = EdgeInsets.symmetric(
    horizontal: LayoutConstrains.l * 2,
  );
  static const vertical = EdgeInsets.symmetric(
    vertical: LayoutConstrains.l,
  );

  static const verticalDataTableDivider = EdgeInsets.symmetric(
    vertical: LayoutConstrains.xm,
  );
}
