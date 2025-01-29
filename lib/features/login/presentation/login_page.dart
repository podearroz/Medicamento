import 'package:flutter/material.dart';
import 'package:flutter_application_medicamento/core/dependency/application_container.dart';
import 'package:flutter_application_medicamento/core/essentials/helper/app_localization_helper.dart';
import 'package:flutter_application_medicamento/core/essentials/ui/app_theme.dart';
import 'package:flutter_application_medicamento/core/essentials/ui/dimens.dart';
import 'package:flutter_application_medicamento/core/essentials/ui/widget/appbar/primary_appbar.dart';
import 'package:flutter_application_medicamento/core/essentials/ui/widget/button/primary_button.dart';
import 'package:flutter_application_medicamento/core/essentials/ui/widget/text/medicamento_text_styles.dart';
import 'package:flutter_application_medicamento/core/essentials/validator/validator.dart';
import 'package:flutter_application_medicamento/core/essentials/validator/validator_impl.dart';
import 'package:flutter_application_medicamento/core/navigation/application_route.dart';
import 'package:flutter_application_medicamento/features/login/controller/login_controller.dart';
import 'package:flutter_svg/svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController loginController =
      ApplicationContainer.instance().resolve<LoginController>();
  final Validator validator = ValidatorImpl();
  final LocalizationHelper localizationHelper = LocalizationHelper();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Theme(
      data: theme,
      child: Scaffold(
        appBar: PrimaryAppBar(
            title: localizationHelper.getString("login"),
            theme: theme,
            leading: null),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: localizationHelper.getString("login_email"),
                    border: const OutlineInputBorder(),
                  ),
                  validator: (value) => validator.validateEmail(value),
                ),
                SizedBox(height: Dimens.spacing),
                TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: localizationHelper.getString("login_password"),
                      border: const OutlineInputBorder(),
                    ),
                    validator: (value) => validator.validatePassword(value)),
                SizedBox(height: Dimens.spacingLarge),
                PrimaryButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await loginController.loginWithEmailAndPassword(context,
                          _emailController.text, _passwordController.text);
                    }
                  },
                  text: localizationHelper.getString("login"),
                  textStyle: MedicamentoTextStyles.button(theme)!.copyWith(
                    color: MedicamentosTheme.palleteOf(theme).white,
                  ),
                ),
                SizedBox(
                  height: Dimens.spacing,
                ),
                ElevatedButton.icon(
                  icon: SvgPicture.asset('assets/ic_google.svg',
                      width: 24, height: 24),
                  label: Text(localizationHelper.getString("login_google")),
                  onPressed: () {
                    loginController.loginWithGoogle(context);
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                    side: const BorderSide(color: Colors.grey),
                  ),
                ),
                SizedBox(height: Dimens.spacing),
                Text(
                  'ou',
                  style: MedicamentoTextStyles.bodyMedium(theme)!
                      .copyWith(color: theme.disabledColor),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(ApplicationRoute.createUser);
                    },
                    child: Text(
                      localizationHelper.getString("login_register_button"),
                      style: MedicamentoTextStyles.bodyLargeBold(theme)!
                          .copyWith(
                              color:
                                  MedicamentosTheme.palleteOf(theme).secondary),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
