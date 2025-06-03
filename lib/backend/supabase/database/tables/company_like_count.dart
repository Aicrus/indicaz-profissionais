import '../database.dart';

class CompanyLikeCountTable extends SupabaseTable<CompanyLikeCountRow> {
  @override
  String get tableName => 'company_like_count';

  @override
  CompanyLikeCountRow createRow(Map<String, dynamic> data) =>
      CompanyLikeCountRow(data);
}

class CompanyLikeCountRow extends SupabaseDataRow {
  CompanyLikeCountRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CompanyLikeCountTable();

  int? get companyId => getField<int>('company_id');
  set companyId(int? value) => setField<int>('company_id', value);

  int? get likeCount => getField<int>('like_count');
  set likeCount(int? value) => setField<int>('like_count', value);
}
