import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'welcome_screen1_model.dart';
export 'welcome_screen1_model.dart';

class WelcomeScreen1Widget extends StatefulWidget {
  const WelcomeScreen1Widget({super.key});

  @override
  State<WelcomeScreen1Widget> createState() => _WelcomeScreen1WidgetState();
}

class _WelcomeScreen1WidgetState extends State<WelcomeScreen1Widget> {
  late WelcomeScreen1Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WelcomeScreen1Model());
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
        child: Container(
          width: 150.0,
          height: 150.0,
          decoration: BoxDecoration(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: SvgPicture.asset(
                    'assets/images/iconosvg.svg',
                    width: MediaQuery.sizeOf(context).width * 0.5,
                    height: 150.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
