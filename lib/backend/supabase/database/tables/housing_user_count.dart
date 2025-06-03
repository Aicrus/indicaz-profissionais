import '../database.dart';

class HousingUserCountTable extends SupabaseTable<HousingUserCountRow> {
  @override
  String get tableName => 'housing_user_count';

  @override
  HousingUserCountRow createRow(Map<String, dynamic> data) =>
      HousingUserCountRow(data);
}

class HousingUserCountRow extends SupabaseDataRow {
  HousingUserCountRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => HousingUserCountTable();

  int? get housingId => getField<int>('housing_id');
  set housingId(int? value) => setField<int>('housing_id', value);

  int? get moradores => getField<int>('moradores');
  set moradores(int? value) => setField<int>('moradores', value);
}
