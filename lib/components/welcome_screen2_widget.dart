import '/components/button_login_widget.dart';
import '/components/sign_up_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'welcome_screen2_model.dart';
export 'welcome_screen2_model.dart';

class WelcomeScreen2Widget extends StatefulWidget {
  const WelcomeScreen2Widget({super.key});

  @override
  State<WelcomeScreen2Widget> createState() => _WelcomeScreen2WidgetState();
}

class _WelcomeScreen2WidgetState extends State<WelcomeScreen2Widget> {
  late WelcomeScreen2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WelcomeScreen2Model());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 1.249,
      height: MediaQuery.sizeOf(context).height * 1.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: Image.asset(
            Theme.of(context).brightness == Brightness.dark
                ? 'assets/images/background_1.png'
                : 'assets/images/background_1.png',
          ).image,
        ),
      ),
      child: Align(
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: SvgPicture.asset(
                  'assets/images/image1.svg',
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 220.0,
                  fit: BoxFit.contain,
                ),
              ),
              Text(
                FFLocalizations.of(context).getText(
                  'olunb5t4' /* Welcome to TrustWise */,
                ),
                style: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Inter Tight',
                      color: Colors.white,
                      fontSize: 25.0,
                      letterSpacing: 0.0,
                    ),
              ),
              Text(
                FFLocalizations.of(context).getText(
                  'thxs6n9u' /* Bank without borders—open your... */,
                ),
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Inter Tight',
                      color: Colors.white,
                      fontSize: 20.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.normal,
                    ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    wrapWithModel(
                      model: _model.buttonLoginModel,
                      updateCallback: () => safeSetState(() {}),
                      child: ButtonLoginWidget(),
                    ),
                    wrapWithModel(
                      model: _model.signUpModel,
                      updateCallback: () => safeSetState(() {}),
                      child: SignUpWidget(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
