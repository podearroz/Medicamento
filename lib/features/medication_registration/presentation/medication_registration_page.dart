import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_medicamento/core/essentials/ui/app_theme.dart';
import 'package:flutter_application_medicamento/core/essentials/ui/dimens.dart';
import 'package:flutter_application_medicamento/core/essentials/ui/widget/appbar/primary_appbar.dart';
import 'package:flutter_application_medicamento/core/essentials/ui/widget/button/primary_button.dart';
import 'package:flutter_application_medicamento/core/navigation/application_route.dart';
import 'package:flutter_application_medicamento/features/medication_registration/domain/medication_entity.dart';

class MedicationRegistrationPage extends StatefulWidget {
  const MedicationRegistrationPage({Key? key}) : super(key: key);

  @override
  State<MedicationRegistrationPage> createState() =>
      _MedicationRegistrationPageState();
}

class _MedicationRegistrationPageState
    extends State<MedicationRegistrationPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dosageController = TextEditingController();
  final TextEditingController _frequencyController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<MedicationEntity> medications = [];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: PrimaryAppBar(
        title: 'Register Medication',
        theme: theme,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Medication Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the medication name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _dosageController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Dosage (e.g., 500mg)',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the dosage';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _frequencyController,
                decoration: const InputDecoration(
                  labelText: 'Frequency (e.g., Twice a day)',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the frequency';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _notesController,
                decoration: const InputDecoration(
                  labelText: 'Additional Notes',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 24),
              PrimaryButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Medication registered successfully!')),
                    );
                    setState(() {
                      medications.add(MedicationEntity(
                          name: _nameController.text,
                          dosage: _dosageController.text,
                          frequency: _frequencyController.text,
                          notes: _notesController.text));
                      log('Medicamentos: $medications');
                    });
                  }
                },
                child: Text(
                  'Register Medication',
                  style: TextStyle(
                      color: MedicamentosTheme.palleteOf(theme).white),
                ),
              ),
              SizedBox(
                height: Dimens.spacing,
              ),
              PrimaryButton(
                buttonColor: MedicamentosTheme.palleteOf(theme).secondary,
                onPressed: () {
                  Navigator.of(context).pushNamed(
                      ApplicationRoute.medicationList,
                      arguments: medications);
                },
                child: Text(
                  'List of Medications',
                  style: TextStyle(
                      color: MedicamentosTheme.palleteOf(theme).white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
