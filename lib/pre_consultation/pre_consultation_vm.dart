import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'model/pre_consultation.dart';

class PreConsultationViewModel extends BaseViewModel {
  String? appointmentId;
  final controller = TextEditingController();
  PreConsultationList? preConsultationList;
  List<ExternalMedications> externalMedications = [];

  onAddExternalMedication(value) {
    externalMedications.add(value);
    notifyListeners();
  }

  getUserProfile() async {
    notifyListeners();
  }

  onSavePreConsultation(BuildContext context) async {
    Navigator.pop(context);
  }
}
