import '../database.dart';

class UserCompanyHousingLimitTable
    extends SupabaseTable<UserCompanyHousingLimitRow> {
  @override
  String get tableName => 'user_company_housing_limit';

  @override
  UserCompanyHousingLimitRow createRow(Map<String, dynamic> data) =>
      UserCompanyHousingLimitRow(data);
}

class UserCompanyHousingLimitRow extends SupabaseDataRow {
  UserCompanyHousingLimitRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserCompanyHousingLimitTable();

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  int? get companyId => getField<int>('company_id');
  set companyId(int? value) => setField<int>('company_id', value);

  int? get totalHousings => getField<int>('total_housings');
  set totalHousings(int? value) => setField<int>('total_housings', value);
}
