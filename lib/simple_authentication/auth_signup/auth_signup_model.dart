import '/flutter_flow/flutter_flow_util.dart';
import '/simple_authentication/loginwithsocial/loginwithsocial_widget.dart';
import '/index.dart';
import 'auth_signup_widget.dart' show AuthSignupWidget;
import 'package:flutter/material.dart';

class AuthSignupModel extends FlutterFlowModel<AuthSignupWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for loginwithsocial component.
  late LoginwithsocialModel loginwithsocialModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for Fristname widget.
  FocusNode? fristnameFocusNode;
  TextEditingController? fristnameTextController;
  String? Function(BuildContext, String?)? fristnameTextControllerValidator;
  // State field(s) for Lastname widget.
  FocusNode? lastnameFocusNode;
  TextEditingController? lastnameTextController;
  String? Function(BuildContext, String?)? lastnameTextControllerValidator;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;

  @override
  void initState(BuildContext context) {
    loginwithsocialModel = createModel(context, () => LoginwithsocialModel());
    passwordVisibility = false;
  }

  @override
  void dispose() {
    loginwithsocialModel.dispose();
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    fristnameFocusNode?.dispose();
    fristnameTextController?.dispose();

    lastnameFocusNode?.dispose();
    lastnameTextController?.dispose();

    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();
  }
}
