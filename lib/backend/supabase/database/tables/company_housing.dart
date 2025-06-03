import '../database.dart';

class CompanyHousingTable extends SupabaseTable<CompanyHousingRow> {
  @override
  String get tableName => 'company_housing';

  @override
  CompanyHousingRow createRow(Map<String, dynamic> data) =>
      CompanyHousingRow(data);
}

class CompanyHousingRow extends SupabaseDataRow {
  CompanyHousingRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CompanyHousingTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get housingId => getField<int>('housing_id');
  set housingId(int? value) => setField<int>('housing_id', value);

  int? get companyId => getField<int>('company_id');
  set companyId(int? value) => setField<int>('company_id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);
}
