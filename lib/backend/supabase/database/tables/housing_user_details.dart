import '../database.dart';

class HousingUserDetailsTable extends SupabaseTable<HousingUserDetailsRow> {
  @override
  String get tableName => 'housing_user_details';

  @override
  HousingUserDetailsRow createRow(Map<String, dynamic> data) =>
      HousingUserDetailsRow(data);
}

class HousingUserDetailsRow extends SupabaseDataRow {
  HousingUserDetailsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => HousingUserDetailsTable();

  int? get relationId => getField<int>('relation_id');
  set relationId(int? value) => setField<int>('relation_id', value);

  int? get housingId => getField<int>('housing_id');
  set housingId(int? value) => setField<int>('housing_id', value);

  String? get housingName => getField<String>('housing_name');
  set housingName(String? value) => setField<String>('housing_name', value);

  String? get housingAddress => getField<String>('housing_address');
  set housingAddress(String? value) =>
      setField<String>('housing_address', value);

  String? get typehouse => getField<String>('typehouse');
  set typehouse(String? value) => setField<String>('typehouse', value);

  String? get housingLatlng => getField<String>('housing_latlng');
  set housingLatlng(String? value) => setField<String>('housing_latlng', value);

  String? get userName => getField<String>('user_name');
  set userName(String? value) => setField<String>('user_name', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get userEmail => getField<String>('user_email');
  set userEmail(String? value) => setField<String>('user_email', value);

  bool? get status => getField<bool>('status');
  set status(bool? value) => setField<bool>('status', value);

  DateTime? get outDate => getField<DateTime>('out_date');
  set outDate(DateTime? value) => setField<DateTime>('out_date', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get complement => getField<String>('complement');
  set complement(String? value) => setField<String>('complement', value);
}
