// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Doctor _$DoctorFromJson(Map<String, dynamic> json) => Doctor(
      name: json['name'] as String,
      email: json['email'] as String,
      medicalId: json['medicalId'] as String,
    )..appointments = (json['appointments'] as List<dynamic>?)
        ?.map((e) => Appointment.fromJson(e as Map<String, dynamic>))
        .toList();

Map<String, dynamic> _$DoctorToJson(Doctor instance) => <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'medicalId': instance.medicalId,
      'appointments': instance.appointments?.map((e) => e.toJson()).toList(),
    };
