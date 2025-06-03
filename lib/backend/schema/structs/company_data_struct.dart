// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CompanyDataStruct extends BaseStruct {
  CompanyDataStruct({
    int? companyId,
    String? name,
    String? phone,
    String? photo,
    double? distanceKm,
    int? mainActivity,
  })  : _companyId = companyId,
        _name = name,
        _phone = phone,
        _photo = photo,
        _distanceKm = distanceKm,
        _mainActivity = mainActivity;

  // "company_id" field.
  int? _companyId;
  int get companyId => _companyId ?? 0;
  set companyId(int? val) => _companyId = val;

  void incrementCompanyId(int amount) => companyId = companyId + amount;

  bool hasCompanyId() => _companyId != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  set phone(String? val) => _phone = val;

  bool hasPhone() => _phone != null;

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  set photo(String? val) => _photo = val;

  bool hasPhoto() => _photo != null;

  // "distance_km" field.
  double? _distanceKm;
  double get distanceKm => _distanceKm ?? 0.0;
  set distanceKm(double? val) => _distanceKm = val;

  void incrementDistanceKm(double amount) => distanceKm = distanceKm + amount;

  bool hasDistanceKm() => _distanceKm != null;

  // "main_activity" field.
  int? _mainActivity;
  int get mainActivity => _mainActivity ?? 0;
  set mainActivity(int? val) => _mainActivity = val;

  void incrementMainActivity(int amount) =>
      mainActivity = mainActivity + amount;

  bool hasMainActivity() => _mainActivity != null;

  static CompanyDataStruct fromMap(Map<String, dynamic> data) =>
      CompanyDataStruct(
        companyId: castToType<int>(data['company_id']),
        name: data['name'] as String?,
        phone: data['phone'] as String?,
        photo: data['photo'] as String?,
        distanceKm: castToType<double>(data['distance_km']),
        mainActivity: castToType<int>(data['main_activity']),
      );

  static CompanyDataStruct? maybeFromMap(dynamic data) => data is Map
      ? CompanyDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'company_id': _companyId,
        'name': _name,
        'phone': _phone,
        'photo': _photo,
        'distance_km': _distanceKm,
        'main_activity': _mainActivity,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'company_id': serializeParam(
          _companyId,
          ParamType.int,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'phone': serializeParam(
          _phone,
          ParamType.String,
        ),
        'photo': serializeParam(
          _photo,
          ParamType.String,
        ),
        'distance_km': serializeParam(
          _distanceKm,
          ParamType.double,
        ),
        'main_activity': serializeParam(
          _mainActivity,
          ParamType.int,
        ),
      }.withoutNulls;

  static CompanyDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      CompanyDataStruct(
        companyId: deserializeParam(
          data['company_id'],
          ParamType.int,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        phone: deserializeParam(
          data['phone'],
          ParamType.String,
          false,
        ),
        photo: deserializeParam(
          data['photo'],
          ParamType.String,
          false,
        ),
        distanceKm: deserializeParam(
          data['distance_km'],
          ParamType.double,
          false,
        ),
        mainActivity: deserializeParam(
          data['main_activity'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'CompanyDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CompanyDataStruct &&
        companyId == other.companyId &&
        name == other.name &&
        phone == other.phone &&
        photo == other.photo &&
        distanceKm == other.distanceKm &&
        mainActivity == other.mainActivity;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([companyId, name, phone, photo, distanceKm, mainActivity]);
}

CompanyDataStruct createCompanyDataStruct({
  int? companyId,
  String? name,
  String? phone,
  String? photo,
  double? distanceKm,
  int? mainActivity,
}) =>
    CompanyDataStruct(
      companyId: companyId,
      name: name,
      phone: phone,
      photo: photo,
      distanceKm: distanceKm,
      mainActivity: mainActivity,
    );
