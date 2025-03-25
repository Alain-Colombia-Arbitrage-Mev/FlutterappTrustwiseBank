import '/components/welcome_screen1_widget.dart';
import '/components/welcome_screen2_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'auth_welcome_screen1_widget.dart' show AuthWelcomeScreen1Widget;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
  // Model for WelcomeScreen1 component.
  late WelcomeScreen1Model welcomeScreen1Model;
  // Model for WelcomeScreen2 component.
  late WelcomeScreen2Model welcomeScreen2Model;

  @override
  void initState(BuildContext context) {
    welcomeScreen1Model = createModel(context, () => WelcomeScreen1Model());
    welcomeScreen2Model = createModel(context, () => WelcomeScreen2Model());
  }

  @override
  void dispose() {
    welcomeScreen1Model.dispose();
    welcomeScreen2Model.dispose();
  }
}
