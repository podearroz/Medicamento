class MedicationEntity {
  final String name;
  final String dosage;
  final String frequency;
  final String? notes;

  MedicationEntity({
    required this.name,
    required this.dosage,
    required this.frequency,
    this.notes,
  });

  @override
  String toString() {
    return 'MedicationEntity{name: $name, dosage: $dosage, frequency: $frequency, notes: $notes}';
  }
}
