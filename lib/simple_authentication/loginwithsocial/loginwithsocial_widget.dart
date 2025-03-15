import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'loginwithsocial_model.dart';
export 'loginwithsocial_model.dart';

class LoginwithsocialWidget extends StatefulWidget {
  const LoginwithsocialWidget({super.key});

  @override
  State<LoginwithsocialWidget> createState() => _LoginwithsocialWidgetState();
}

class _LoginwithsocialWidgetState extends State<LoginwithsocialWidget> {
  late LoginwithsocialModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginwithsocialModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: SvgPicture.network(
                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/firebase-xk7cei/assets/323si4anegnp/google.svg',
                        height: 55.0,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: SvgPicture.network(
                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/firebase-xk7cei/assets/hxwg6l0baber/appl.svg',
                          width: 167.1,
                          height: 55.0,
                          fit: BoxFit.fill,
                          alignment: Alignment(0.0, 0.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
