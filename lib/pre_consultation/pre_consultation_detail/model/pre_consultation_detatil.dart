class PreConsultationMedicineList{
  String? status;
  List<PreConsultationMedicine>? data;
  PreConsultationMedicineList(this.data, this.status);
  static PreConsultationMedicineList fromMap(Map<String, dynamic> resp) {
    List<PreConsultationMedicine>? data;
    if (resp['data'] != null) {
      data = List<PreConsultationMedicine>.from(
          resp['data'].map((item) => PreConsultationMedicine.fromMap(item)));
    }
    return PreConsultationMedicineList(
      resp['data'] == null ? null : data,
      resp['status'] as String?
    );
  }

}

class PreConsultationMedicine {
  String? medicineName;
  String? medicineStrength;
  String? medicineId;

  PreConsultationMedicine(
    this.medicineName,
    this.medicineStrength,
    this.medicineId,
  );

  static PreConsultationMedicine fromMap(Map<String, dynamic> resp) {
    return PreConsultationMedicine(
      resp['medicine_name'] as String?,
      resp['strength'] as String?,
      resp['medicine_id'] as String?,
    );
  }
}

class Frequency{
  String? frequency;
  Frequency (this.frequency);
  static Frequency fromMap (Map<String ,dynamic> resp ){
    return Frequency(
      resp ['frequency'] as String?,
    );
  }
}
