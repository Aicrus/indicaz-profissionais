import '../database.dart';

class HousingCompaniesViewTable extends SupabaseTable<HousingCompaniesViewRow> {
  @override
  String get tableName => 'housing_companies_view';

  @override
  HousingCompaniesViewRow createRow(Map<String, dynamic> data) =>
      HousingCompaniesViewRow(data);
}

class HousingCompaniesViewRow extends SupabaseDataRow {
  HousingCompaniesViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => HousingCompaniesViewTable();

  int? get housingId => getField<int>('housing_id');
  set housingId(int? value) => setField<int>('housing_id', value);

  int? get companyId => getField<int>('company_id');
  set companyId(int? value) => setField<int>('company_id', value);

  String? get companyName => getField<String>('company_name');
  set companyName(String? value) => setField<String>('company_name', value);

  String? get phone => getField<String>('phone');
  set phone(String? value) => setField<String>('phone', value);

  int? get mainActivity => getField<int>('main_activity');
  set mainActivity(int? value) => setField<int>('main_activity', value);

  String? get photo => getField<String>('photo');
  set photo(String? value) => setField<String>('photo', value);
}
