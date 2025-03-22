import '/components/button_login_widget.dart';
import '/components/sign_up_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'page1_widget.dart' show Page1Widget;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Page1Model extends FlutterFlowModel<Page1Widget> {
  ///  State fields for stateful widgets in this component.

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
