import '../database.dart';

class UserFavoriteCompaniesTable
    extends SupabaseTable<UserFavoriteCompaniesRow> {
  @override
  String get tableName => 'user_favorite_companies';

  @override
  UserFavoriteCompaniesRow createRow(Map<String, dynamic> data) =>
      UserFavoriteCompaniesRow(data);
}

class UserFavoriteCompaniesRow extends SupabaseDataRow {
  UserFavoriteCompaniesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserFavoriteCompaniesTable();

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

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
