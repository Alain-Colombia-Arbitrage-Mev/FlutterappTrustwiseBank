import '/flutter_flow/flutter_flow_util.dart';
import 'auth_welcome_screen1_widget.dart' show AuthWelcomeScreen1Widget;
import 'package:flutter/material.dart';

class AuthWelcomeScreen1Model
    extends FlutterFlowModel<AuthWelcomeScreen1Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
