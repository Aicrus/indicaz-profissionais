import '../database.dart';

class HousingUsersTable extends SupabaseTable<HousingUsersRow> {
  @override
  String get tableName => 'housing_users';

  @override
  HousingUsersRow createRow(Map<String, dynamic> data) => HousingUsersRow(data);
}

class HousingUsersRow extends SupabaseDataRow {
  HousingUsersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => HousingUsersTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int get housingId => getField<int>('housing_id')!;
  set housingId(int value) => setField<int>('housing_id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  bool? get status => getField<bool>('status');
  set status(bool? value) => setField<bool>('status', value);

  DateTime? get outDate => getField<DateTime>('out_date');
  set outDate(DateTime? value) => setField<DateTime>('out_date', value);

  String? get complement => getField<String>('complement');
  set complement(String? value) => setField<String>('complement', value);
}
