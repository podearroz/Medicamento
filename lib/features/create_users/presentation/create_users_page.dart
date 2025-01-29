import 'package:flutter/material.dart';
import 'package:flutter_application_medicamento/core/dependency/application_container.dart';
import 'package:flutter_application_medicamento/core/essentials/ui/widget/appbar/primary_appbar.dart';
import 'package:flutter_application_medicamento/core/essentials/validator/validator.dart';
import 'package:flutter_application_medicamento/core/essentials/validator/validator_impl.dart';
import 'package:flutter_application_medicamento/features/create_users/controller/create_user_controller.dart';
import 'package:flutter_application_medicamento/features/create_users/domain/entity/user_entity.dart';

class CreateUserPage extends StatefulWidget {
  Validator validator = ValidatorImpl();
  CreateUserPage({Key? key}) : super(key: key);

  @override
  State<CreateUserPage> createState() => _CreateUserPageState();
}

class _CreateUserPageState extends State<CreateUserPage> {
  CreateUserController createUserController =
      ApplicationContainer.instance().resolve<CreateUserController>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: PrimaryAppBar(title: "Criar usuário", theme: theme),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => widget.validator.validateRequired(value),
              ),
              const SizedBox(height: 16),
              TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) => widget.validator.validateEmail(value)),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => widget.validator.validatePassword(value),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Handle user creation logic here
                    createUserController.createUser(UserEntity(
                        name: _usernameController.text,
                        email: _emailController.text,
                        password: _passwordController.text));
                  }
                },
                child: const Text('Create User'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
