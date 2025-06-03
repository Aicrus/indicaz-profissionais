import '../database.dart';

class CompanyReviewStatsTable extends SupabaseTable<CompanyReviewStatsRow> {
  @override
  String get tableName => 'company_review_stats';

  @override
  CompanyReviewStatsRow createRow(Map<String, dynamic> data) =>
      CompanyReviewStatsRow(data);
}

class CompanyReviewStatsRow extends SupabaseDataRow {
  CompanyReviewStatsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CompanyReviewStatsTable();

  int? get companyId => getField<int>('company_id');
  set companyId(int? value) => setField<int>('company_id', value);

  String? get companyName => getField<String>('company_name');
  set companyName(String? value) => setField<String>('company_name', value);

  int? get totalReviews => getField<int>('total_reviews');
  set totalReviews(int? value) => setField<int>('total_reviews', value);

  double? get averageRating => getField<double>('average_rating');
  set averageRating(double? value) => setField<double>('average_rating', value);
}
