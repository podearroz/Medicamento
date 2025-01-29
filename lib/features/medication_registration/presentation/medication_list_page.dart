import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_medicamento/core/essentials/ui/widget/appbar/primary_appbar.dart';
import 'package:flutter_application_medicamento/features/medication_registration/domain/medication_entity.dart';

class MedicationListPage extends StatefulWidget {
  @override
  State<MedicationListPage> createState() => _MedicationListPageState();
}

class _MedicationListPageState extends State<MedicationListPage> {
  late List<MedicationEntity> medications;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    medications =
        ModalRoute.of(context)?.settings.arguments as List<MedicationEntity>? ??
            [];
    log('Medicamentos: $medications');
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: PrimaryAppBar(
        title: 'Lista Medicações',
        theme: theme,
      ),
      body: ListView.builder(
        itemCount: medications.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              title: RichText(
                text: TextSpan(
                  style: theme.textTheme.bodyMedium,
                  children: [
                    TextSpan(
                      text: 'Medicamentos: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: '${medications[index].name} ',
                    ),
                    TextSpan(
                      text: 'Dosagem: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: '${medications[index].dosage}',
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
