import 'package:dame_app/ui/sizing_information.dart';
import 'package:dame_app/utils/ui_utils.dart';
import 'package:flutter/material.dart';

class BaseWidget extends StatelessWidget {
  final Widget Function(
      BuildContext context, SizingInformation sizingInformation) builder;
  const BaseWidget({Key key, this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    return LayoutBuilder(builder: (context, boxContraints) {
      var sizingInformation = SizingInformation(
        orientation: mediaQuery.orientation,
        deviceScreenType: getDeviceType(mediaQuery),
        screenSize: mediaQuery.size,
        localWidgetSize: Size(boxContraints.maxWidth, boxContraints.maxHeight),
      );
      return builder(context, sizingInformation);
    });
  }
}
