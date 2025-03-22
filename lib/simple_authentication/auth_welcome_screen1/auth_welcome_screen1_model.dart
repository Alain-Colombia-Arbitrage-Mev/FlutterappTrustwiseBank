import '/components/button_login_widget.dart';
import '/components/sign_up_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'auth_welcome_screen1_widget.dart' show AuthWelcomeScreen1Widget;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  // Model for ButtonLogin component.
  late ButtonLoginModel buttonLoginModel;
  // Model for SignUp component.
  late SignUpModel signUpModel;

  @override
  void initState(BuildContext context) {
    buttonLoginModel = createModel(context, () => ButtonLoginModel());
    signUpModel = createModel(context, () => SignUpModel());
  }

  @override
  void dispose() {
    buttonLoginModel.dispose();
    signUpModel.dispose();
  }
}
