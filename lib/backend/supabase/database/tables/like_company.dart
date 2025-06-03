import '../database.dart';

class LikeCompanyTable extends SupabaseTable<LikeCompanyRow> {
  @override
  String get tableName => 'like_company';

  @override
  LikeCompanyRow createRow(Map<String, dynamic> data) => LikeCompanyRow(data);
}

class LikeCompanyRow extends SupabaseDataRow {
  LikeCompanyRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LikeCompanyTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  int get companyId => getField<int>('company_id')!;
  set companyId(int value) => setField<int>('company_id', value);
}
