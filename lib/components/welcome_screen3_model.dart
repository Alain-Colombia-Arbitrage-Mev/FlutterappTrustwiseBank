import '/components/button_login_widget.dart';
import '/components/sign_up_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'welcome_screen3_widget.dart' show WelcomeScreen3Widget;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WelcomeScreen3Model extends FlutterFlowModel<WelcomeScreen3Widget> {
  ///  State fields for stateful widgets in this component.

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
