import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ar', 'zh_Hans', 'es'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? arText = '',
    String? zh_HansText = '',
    String? esText = '',
  }) =>
      [enText, arText, zh_HansText, esText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // auth_4_OnboardingOne
  {
    '9e1k96ue': {
      'en': 'Validate Phone',
      'ar': 'التحقق من صحة الهاتف',
      'es': 'Validar teléfono',
      'zh_Hans': '验证电话',
    },
    'ymq4t4qs': {
      'en':
          'Enter your phone number in order to get started with your profile creation.',
      'ar': 'أدخل رقم هاتفك للبدء في إنشاء ملفك الشخصي.',
      'es':
          'Ingresa tu número de teléfono para comenzar con la creación de tu perfil.',
      'zh_Hans': '输入您的电话号码即可开始创建您的个人资料。',
    },
    '2c7jcopv': {
      'en': 'Phone Number',
      'ar': 'رقم التليفون',
      'es': 'Número de teléfono',
      'zh_Hans': '电话号码',
    },
    'a1goa34t': {
      'en': 'We\'ll send a 6 digit code to you!',
      'ar': 'سوف نرسل لك رمز مكون من 6 أرقام!',
      'es': '¡Te enviaremos un código de 6 dígitos!',
      'zh_Hans': '我们将向您发送一个6位数的代码！',
    },
    'rdtcc53q': {
      'en': 'You will be done in no time, keep up the great work!',
      'ar': 'سيتم الانتهاء منها في وقت قصير، استمر في العمل الرائع!',
      'es': 'Terminarás en poco tiempo. ¡Sigue con el gran trabajo!',
      'zh_Hans': '您很快就能完成，继续努力！',
    },
    '1pygzfjr': {
      'en': 'What\'s your name?',
      'ar': 'ما اسمك؟',
      'es': '¿Cómo te llamas?',
      'zh_Hans': '你叫什么名字？',
    },
    'srhzpx5f': {
      'en':
          'Enter a name that people would recognize so your friends can find you.',
      'ar':
          'أدخل اسمًا يمكن للآخرين التعرف عليه حتى يتمكن أصدقاؤك من العثور عليك.',
      'es':
          'Ingrese un nombre que la gente pueda reconocer para que sus amigos puedan encontrarlo.',
      'zh_Hans': '输入一个人们能识别的名字，以便您的朋友可以找到您。',
    },
    'tb2xlooe': {
      'en': 'Your Name...',
      'ar': 'اسمك...',
      'es': 'Su nombre...',
      'zh_Hans': '您的名字...',
    },
    'prd94eew': {
      'en': 'Email ',
      'ar': 'بريد إلكتروني',
      'es': 'Correo electrónico',
      'zh_Hans': '电子邮件',
    },
    'x9d5p53v': {
      'en': 'Email Address:',
      'ar': 'عنوان البريد الإلكتروني:',
      'es': 'Dirección de correo electrónico:',
      'zh_Hans': '电子邮件：',
    },
    'qehz0see': {
      'en': 'Username',
      'ar': 'اسم المستخدم',
      'es': 'Nombre de usuario',
      'zh_Hans': '用户名',
    },
    '4fixud19': {
      'en': '@fluffyfreddy',
      'ar': '@فلوفي فريدي',
      'es': '@fluffyfreddy',
      'zh_Hans': '@fluffyfreddy',
    },
    'x8q4fw39': {
      'en': 'Congrats! Your account is created!',
      'ar': 'مبروك! تم إنشاء حسابك!',
      'es': '¡Felicidades! ¡Tu cuenta está creada!',
      'zh_Hans': '恭喜！您的帐户已创建！',
    },
    'judgyyuu': {
      'en': 'Just a few more steps and we\'ll have you onboarded!',
      'ar': 'فقط بضع خطوات أخرى وسنقوم بإضافتك إلينا!',
      'es': '¡Solo unos pocos pasos más y lo tendremos incorporado!',
      'zh_Hans': '只需几个步骤，我们即可让您加入！',
    },
    'absw2zoe': {
      'en': 'Please enter your name to continue',
      'ar': 'الرجاء إدخال اسمك للمواصلة',
      'es': 'Por favor ingrese su nombre para continuar',
      'zh_Hans': '请输入您的姓名以继续',
    },
    'hk2est2n': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor, elija una opción del menú desplegable.',
      'zh_Hans': '请从下拉列表中选择一个选项',
    },
    '1d2b9wb7': {
      'en': 'Upload your face',
      'ar': 'قم بتحميل وجهك',
      'es': 'Sube tu cara',
      'zh_Hans': '上传你的脸部',
    },
    'v4iesncm': {
      'en':
          'We need to know more about you, please help us with a clear selfie photo of your face',
      'ar':
          'نحن بحاجة إلى معرفة المزيد عنك، يرجى مساعدتنا في الحصول على صورة شخصية واضحة لوجهك',
      'es':
          'Necesitamos saber más sobre ti, por favor ayúdanos con una foto selfie nítida de tu rostro.',
      'zh_Hans': '我们需要更多地了解你，请帮我们提供一张清晰的自拍照',
    },
    'bkgnc05v': {
      'en': 'Upload Image',
      'ar': 'تحميل الصورة',
      'es': 'Subir imagen',
      'zh_Hans': '上传图片',
    },
    'fie1e4nb': {
      'en': 'How old are you?',
      'ar': 'كم عمرك؟',
      'es': '¿Cuántos años tiene?',
      'zh_Hans': '你今年多大？',
    },
    'dsykf95a': {
      'en': 'Let us know how old you are in order to continue.',
      'ar': 'أخبرنا كم عمرك حتى نتمكن من الاستمرار.',
      'es': 'Indícanos tu edad para poder continuar.',
      'zh_Hans': '为了继续，请告知我们您的年龄。',
    },
    'yfslzjq8': {
      'en': 'Date of Birth',
      'ar': 'تاريخ الميلاد',
      'es': 'Fecha de nacimiento',
      'zh_Hans': '出生日期',
    },
    'afzjxr3v': {
      'en': 'Your profile!',
      'ar': 'ملفك الشخصي!',
      'es': '¡Tu perfil!',
      'zh_Hans': '您的个人资料！',
    },
    'a79olr3o': {
      'en': 'Congrats, you made it! We can\'t wait for you to get started!',
      'ar': 'مبروك، لقد نجحت! نتطلع بشوق لبدء مشروعك!',
      'es': '¡Felicidades, lo lograste! ¡Estamos deseando que empieces!',
      'zh_Hans': '恭喜，你成功了！我们迫不及待地想让你开始行动！',
    },
    'r3ra28wu': {
      'en': 'Your name',
      'ar': 'اسمك',
      'es': 'Su nombre',
      'zh_Hans': '您的名字',
    },
    'n7utry6k': {
      'en': 'Username',
      'ar': 'اسم المستخدم',
      'es': 'Nombre de usuario',
      'zh_Hans': '用户名',
    },
    'vvmcxxf5': {
      'en': 'Your Bio',
      'ar': 'سيرتك الذاتية',
      'es': 'Tu biografía',
      'zh_Hans': '你的简历',
    },
    '96v4enkk': {
      'en': 'Hello World',
      'ar': 'مرحبا بالعالم',
      'es': 'Hola Mundo',
      'zh_Hans': '你好世界',
    },
    '9om765vl': {
      'en': 'Date of Birth',
      'ar': 'تاريخ الميلاد',
      'es': 'Fecha de nacimiento',
      'zh_Hans': '出生日期',
    },
    'iac09amn': {
      'en': 'Back',
      'ar': 'خلف',
      'es': 'Atrás',
      'zh_Hans': '后退',
    },
    '9c82zlzl': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'zh_Hans': '家',
    },
  },
  // auth_4_OnboardingPhoneVerify
  {
    'kwmzdxaq': {
      'en': 'Verify Code',
      'ar': 'رمز التحقق',
      'es': 'Código de verificación',
      'zh_Hans': '验证码',
    },
    '327ae6y2': {
      'en': 'Enter the 6 digit code we sent to the number below: ',
      'ar': 'أدخل الرمز المكون من 6 أرقام الذي أرسلناه إلى الرقم أدناه:',
      'es':
          'Introduzca el código de 6 dígitos que le enviamos al siguiente número:',
      'zh_Hans': '输入我们发送到以下号码的 6 位数代码：',
    },
    'jokq71lz': {
      'en': 'Verify Code',
      'ar': 'رمز التحقق',
      'es': 'Código de verificación',
      'zh_Hans': '验证码',
    },
    'y5mrfvtt': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'zh_Hans': '家',
    },
  },
  // auth_WelcomeScreen1
  {
    'uugsx3mn': {
      'en': 'TrustWise Bank',
      'ar': 'بنك تراست وايز',
      'es': 'Banco TrustWise',
      'zh_Hans': 'TrustWise 银行',
    },
    '1rgkfwus': {
      'en': 'TrustWise makes global banking simple and efficient',
      'ar': 'TrustWise يجعل الخدمات المصرفية العالمية بسيطة وفعالة',
      'es': 'TrustWise hace que la banca global sea sencilla y eficiente',
      'zh_Hans': 'TrustWise 使全球银行业务变得简单而高效',
    },
    'l34ztyp1': {
      'en': 'Multi -Currency',
      'ar': '',
      'es': '',
      'zh_Hans': '',
    },
    'fauck09p': {
      'en':
          'Access and manage multiple currencies seamlessly in one secure location. ',
      'ar': '',
      'es': '',
      'zh_Hans': '',
    },
    'kmg89v66': {
      'en': 'Your Keys, Your funds',
      'ar': '',
      'es': '',
      'zh_Hans': '',
    },
    'shnm19cm': {
      'en':
          'FirstClass Gassless Web3 Wallet . \n\nWe made crypto transfer simple',
      'ar': '',
      'es': '',
      'zh_Hans': '',
    },
    'p4dyty3s': {
      'en': 'Login',
      'ar': '',
      'es': '',
      'zh_Hans': '',
    },
    '1nz5ff19': {
      'en': 'Sign up ',
      'ar': '',
      'es': '',
      'zh_Hans': '',
    },
    'gu7rhcot': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'zh_Hans': '家',
    },
  },
  // auth_Login
  {
    'q41i9mr3': {
      'en': 'TrustWise',
      'ar': 'تراست وايز',
      'es': 'TrustWise',
      'zh_Hans': '信任智慧',
    },
    'd3nqmy9p': {
      'en': 'Sign in to Trustwise ',
      'ar': 'تسجيل الدخول إلى Trustwise',
      'es': 'Iniciar sesión en Trustwise',
      'zh_Hans': '登录 Trustwise',
    },
    'ant53u66': {
      'en': 'Send, spend and save smarter',
      'ar': 'أرسل وأنفق ووفر بطريقة أكثر ذكاءً',
      'es': 'Envía, gasta y ahorra de forma más inteligente',
      'zh_Hans': '更加明智地发送、消费和储蓄',
    },
    'eu3s0wa3': {
      'en': 'Or using your email',
      'ar': 'أو باستخدام بريدك الإلكتروني',
      'es': 'O usando tu correo electrónico',
      'zh_Hans': '或者使用您的电子邮件',
    },
    'zytophmv': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الإلكتروني',
      'es': 'Dirección de correo electrónico',
      'zh_Hans': '电子邮件',
    },
    'xygodb9w': {
      'en': 'Password',
      'ar': 'كلمة المرور',
      'es': 'Contraseña',
      'zh_Hans': '密码',
    },
    '7shzk71i': {
      'en': 'Remember me',
      'ar': 'تذكرنى',
      'es': 'Acuérdate de mí',
      'zh_Hans': '记住账号',
    },
    'dqlydo5k': {
      'en': 'Forgot Password?',
      'ar': 'هل نسيت كلمة السر؟',
      'es': '¿Has olvidado tu contraseña?',
      'zh_Hans': '忘记密码？',
    },
    'v0hew98l': {
      'en': 'Sign In',
      'ar': 'تسجيل الدخول',
      'es': 'Iniciar sesión',
      'zh_Hans': '登入',
    },
    'xer8nyyi': {
      'en': 'Already have an account?',
      'ar': 'هل لديك حساب بالفعل؟',
      'es': '¿Ya tienes una cuenta?',
      'zh_Hans': '已有账户？',
    },
    '5kt3od0m': {
      'en': ' Sign Up',
      'ar': 'اشتراك',
      'es': 'Inscribirse',
      'zh_Hans': '报名',
    },
    'h6et0ruz': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'zh_Hans': '家',
    },
  },
  // auth_ForgotPassword
  {
    'cvd8piry': {
      'en': 'Need help with your\naccount?',
      'ar': 'هل تحتاج إلى مساعدة بشأن حسابك؟',
      'es': '¿Necesitas ayuda con tu cuenta?',
      'zh_Hans': '需要有关您的帐户的帮助吗？',
    },
    't4vr9vwb': {
      'en':
          'Enter the email address associated with your account and we will send you a link to reset your password.',
      'ar':
          'أدخل عنوان البريد الإلكتروني المرتبط بحسابك وسنرسل لك رابطًا لإعادة تعيين كلمة المرور الخاصة بك.',
      'es':
          'Ingrese la dirección de correo electrónico asociada a su cuenta y le enviaremos un enlace para restablecer su contraseña.',
      'zh_Hans': '输入与您的帐户关联的电子邮件地址，我们将向您发送重置密码的链接。',
    },
    '58gbxd5d': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الإلكتروني',
      'es': 'Dirección de correo electrónico',
      'zh_Hans': '电子邮件',
    },
    '1q8mi8l2': {
      'en': 'Send Link',
      'ar': 'إرسال الرابط',
      'es': 'Enviar enlace',
      'zh_Hans': '发送链接',
    },
    '12qbrsbh': {
      'en': 'Forgot your email?',
      'ar': 'هل نسيت بريدك الإلكتروني؟',
      'es': '¿Olvidaste tu correo electrónico?',
      'zh_Hans': '忘记了你的电子邮箱？',
    },
    '64jk2x66': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'zh_Hans': '家',
    },
  },
  // auth_signup
  {
    'kdmzkygp': {
      'en': 'TrustWise',
      'ar': 'تراست وايز',
      'es': 'TrustWise',
      'zh_Hans': '信任智慧',
    },
    'svzijxta': {
      'en': 'Sign up for an account',
      'ar': 'قم بالتسجيل للحصول على حساب',
      'es': 'Regístrese para obtener una cuenta',
      'zh_Hans': '注册账户',
    },
    '2wrpsq1f': {
      'en': 'Send, spend and save smarter',
      'ar': 'أرسل وأنفق ووفر بطريقة أكثر ذكاءً',
      'es': 'Envía, gasta y ahorra de forma más inteligente',
      'zh_Hans': '更加明智地发送、消费和储蓄',
    },
    '6zinuape': {
      'en': 'Or using your email',
      'ar': 'أو باستخدام بريدك الإلكتروني',
      'es': 'O usando tu correo electrónico',
      'zh_Hans': '或者使用您的电子邮件',
    },
    'y8seld3g': {
      'en': 'TextField',
      'ar': 'حقل النص',
      'es': 'Campo de texto',
      'zh_Hans': '文本框',
    },
    'cbcsfby5': {
      'en': 'Frist name',
      'ar': 'الاسم الأول',
      'es': 'Primer nombre',
      'zh_Hans': '名字',
    },
    '5i2035xk': {
      'en': 'Last name',
      'ar': 'اسم العائلة',
      'es': 'Apellido',
      'zh_Hans': '姓',
    },
    's8dqf4cr': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الإلكتروني',
      'es': 'Dirección de correo electrónico',
      'zh_Hans': '电子邮件',
    },
    'o0ct5emn': {
      'en': 'Password',
      'ar': 'كلمة المرور',
      'es': 'Contraseña',
      'zh_Hans': '密码',
    },
    '6pvokz2p': {
      'en': 'By creating an account, you agreeing to our ',
      'ar': 'من خلال إنشاء حساب، فإنك توافق على شروطنا',
      'es':
          'Al crear una cuenta, usted acepta nuestros términos y condiciones.',
      'zh_Hans': '通过创建帐户，您同意我们的',
    },
    'lxtynw2d': {
      'en': 'Privacy Policy,',
      'ar': 'سياسة الخصوصية،',
      'es': 'Política de privacidad,',
      'zh_Hans': '隐私政策，',
    },
    '86zp7n4q': {
      'en': 'and',
      'ar': 'و',
      'es': 'y',
      'zh_Hans': '和',
    },
    'ocw6xymk': {
      'en': ' Electronics Communication Policy.',
      'ar': 'سياسة الاتصالات الالكترونية.',
      'es': 'Política de comunicación electrónica.',
      'zh_Hans': '电子通信政策。',
    },
    'pa6g1a9u': {
      'en': 'Sign Up',
      'ar': 'اشتراك',
      'es': 'Inscribirse',
      'zh_Hans': '报名',
    },
    'ny12q8ft': {
      'en': 'Already have an account?',
      'ar': 'هل لديك حساب بالفعل؟',
      'es': '¿Ya tienes una cuenta?',
      'zh_Hans': '已有账户？',
    },
    '1p9u70nf': {
      'en': ' Sign In',
      'ar': 'تسجيل الدخول',
      'es': 'Iniciar sesión',
      'zh_Hans': '登入',
    },
    'gn7eevxh': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'zh_Hans': '家',
    },
  },
  // BalanceBankcard
  {
    '6rbmg6qs': {
      'en': 'Balance',
      'ar': '',
      'es': '',
      'zh_Hans': '',
    },
    '1jmhabkj': {
      'en': '\$7,630',
      'ar': '',
      'es': '',
      'zh_Hans': '',
    },
    'f40ase9q': {
      'en': 'USD',
      'ar': '',
      'es': '',
      'zh_Hans': '',
    },
    'yb6ana3s': {
      'en': 'Savings',
      'ar': '',
      'es': '',
      'zh_Hans': '',
    },
  },
  // Iconos
  {
    'wz7c8cxr': {
      'en': 'Send ',
      'ar': '',
      'es': '',
      'zh_Hans': '',
    },
    'poej74kg': {
      'en': 'Receive',
      'ar': '',
      'es': '',
      'zh_Hans': '',
    },
    'f5q5wifh': {
      'en': 'Transactions',
      'ar': '',
      'es': '',
      'zh_Hans': '',
    },
    '6wwv6v4w': {
      'en': 'Wallet',
      'ar': '',
      'es': '',
      'zh_Hans': '',
    },
  },
  // PushNotify
  {
    '49lmgghf': {
      'en': 'Notification Title',
      'ar': '',
      'es': '',
      'zh_Hans': '',
    },
    'w9vwm1le': {
      'en': 'Some body copy that is present in this small notification.',
      'ar': '',
      'es': '',
      'zh_Hans': '',
    },
  },
  // Menuuser
  {
    'ao2b8mzz': {
      'en': 'Profile',
      'ar': '',
      'es': '',
      'zh_Hans': '',
    },
    't50sl2hw': {
      'en': 'Randy Peterson',
      'ar': '',
      'es': '',
      'zh_Hans': '',
    },
    'kues2nbz': {
      'en': 'randy.p@domainname.com',
      'ar': '',
      'es': '',
      'zh_Hans': '',
    },
    'q1tjnl97': {
      'en': 'My Accounts',
      'ar': '',
      'es': '',
      'zh_Hans': '',
    },
    'nypjimz0': {
      'en': 'Settings',
      'ar': '',
      'es': '',
      'zh_Hans': '',
    },
    'jv3jq17k': {
      'en': 'Billing Details',
      'ar': '',
      'es': '',
      'zh_Hans': '',
    },
    'i8arx0u7': {
      'en': 'Billing Details',
      'ar': '',
      'es': '',
      'zh_Hans': '',
    },
    '63i3cswe': {
      'en': 'Billing Details',
      'ar': '',
      'es': '',
      'zh_Hans': '',
    },
    'x6cjctj3': {
      'en': 'Billing Details',
      'ar': '',
      'es': '',
      'zh_Hans': '',
    },
    'm7rco4qf': {
      'en': 'Billing Details',
      'ar': '',
      'es': '',
      'zh_Hans': '',
    },
    'x69s3s8i': {
      'en': 'Billing Details',
      'ar': '',
      'es': '',
      'zh_Hans': '',
    },
    'p4zyrl5f': {
      'en': 'Log out',
      'ar': '',
      'es': '',
      'zh_Hans': '',
    },
  },
  // downbar
  {
    'iy8uq564': {
      'en': 'Home',
      'ar': '',
      'es': '',
      'zh_Hans': '',
    },
    '2xl4so34': {
      'en': 'Accounts',
      'ar': '',
      'es': '',
      'zh_Hans': '',
    },
    'tbb565ls': {
      'en': 'Send',
      'ar': '',
      'es': '',
      'zh_Hans': '',
    },
    'ic4a2y60': {
      'en': 'Receive',
      'ar': '',
      'es': '',
      'zh_Hans': '',
    },
    'x3ryodto': {
      'en': 'Config',
      'ar': '',
      'es': '',
      'zh_Hans': '',
    },
  },
  // Miscellaneous
  {
    'uezboun9': {
      'en': '',
      'ar': '',
      'es': '',
      'zh_Hans': '',
    },
    'a3e6b11d': {
      'en': '',
      'ar': '',
      'es': '',
      'zh_Hans': '',
    },
    '8dnxdjox': {
      'en': '',
      'ar': '',
      'es': '',
      'zh_Hans': '',
    },
    'e9yrwfwi': {
      'en': '',
      'ar': '',
      'es': '',
      'zh_Hans': '',
    },
    'qufccsu3': {
      'en': '',
      'ar': '',
      'es': '',
      'zh_Hans': '',
    },
    'vy7u1ghj': {
      'en': '',
      'ar': '',
      'es': '',
      'zh_Hans': '',
    },
    'ne3en0tl': {
      'en': '',
      'ar': '',
      'es': '',
      'zh_Hans': '',
    },
    'u77272hu': {
      'en': '',
      'ar': '',
      'es': '',
      'zh_Hans': '',
    },
    'eodubwmc': {
      'en': '',
      'ar': '',
      'es': '',
      'zh_Hans': '',
    },
    'hvvyjc58': {
      'en': '',
      'ar': '',
      'es': '',
      'zh_Hans': '',
    },
    'a2hwccpf': {
      'en': '',
      'ar': '',
      'es': '',
      'zh_Hans': '',
    },
    'bvj9vfde': {
      'en': '',
      'ar': '',
      'es': '',
      'zh_Hans': '',
    },
    'eel1rx4p': {
      'en': '',
      'ar': '',
      'es': '',
      'zh_Hans': '',
    },
    'j47d8vj5': {
      'en': '',
      'ar': '',
      'es': '',
      'zh_Hans': '',
    },
    'd18tfs78': {
      'en': '',
      'ar': '',
      'es': '',
      'zh_Hans': '',
    },
    'bwligdbw': {
      'en': '',
      'ar': '',
      'es': '',
      'zh_Hans': '',
    },
    'l92g584k': {
      'en': '',
      'ar': '',
      'es': '',
      'zh_Hans': '',
    },
    'sh3550hi': {
      'en': '',
      'ar': '',
      'es': '',
      'zh_Hans': '',
    },
    'xcbp0fap': {
      'en': '',
      'ar': '',
      'es': '',
      'zh_Hans': '',
    },
    'dqvod3di': {
      'en': '',
      'ar': '',
      'es': '',
      'zh_Hans': '',
    },
    'yxcuuvm1': {
      'en': '',
      'ar': '',
      'es': '',
      'zh_Hans': '',
    },
    '1v841ntm': {
      'en': '',
      'ar': '',
      'es': '',
      'zh_Hans': '',
    },
    'a0o8tjvp': {
      'en': '',
      'ar': '',
      'es': '',
      'zh_Hans': '',
    },
    'dhrpkh3i': {
      'en': '',
      'ar': '',
      'es': '',
      'zh_Hans': '',
    },
    'ptigrrbs': {
      'en': '',
      'ar': '',
      'es': '',
      'zh_Hans': '',
    },
    'pfdu5khf': {
      'en': '',
      'ar': '',
      'es': '',
      'zh_Hans': '',
    },
    'n8lcrikd': {
      'en': '',
      'ar': '',
      'es': '',
      'zh_Hans': '',
    },
    'hjmiz4z6': {
      'en': '',
      'ar': '',
      'es': '',
      'zh_Hans': '',
    },
    'hwu03kzv': {
      'en': '',
      'ar': '',
      'es': '',
      'zh_Hans': '',
    },
  },
].reduce((a, b) => a..addAll(b));
