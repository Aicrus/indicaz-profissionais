import '../database.dart';

class FavoriteCompanyHousingTable
    extends SupabaseTable<FavoriteCompanyHousingRow> {
  @override
  String get tableName => 'favorite_company_housing';

  @override
  FavoriteCompanyHousingRow createRow(Map<String, dynamic> data) =>
      FavoriteCompanyHousingRow(data);
}

class FavoriteCompanyHousingRow extends SupabaseDataRow {
  FavoriteCompanyHousingRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FavoriteCompanyHousingTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get companyHousingId => getField<int>('company_housing_id');
  set companyHousingId(int? value) =>
      setField<int>('company_housing_id', value);

  String? get userUid => getField<String>('user_uid');
  set userUid(String? value) => setField<String>('user_uid', value);
}
