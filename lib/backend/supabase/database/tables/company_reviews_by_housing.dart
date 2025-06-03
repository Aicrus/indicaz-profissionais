import '../database.dart';

class CompanyReviewsByHousingTable
    extends SupabaseTable<CompanyReviewsByHousingRow> {
  @override
  String get tableName => 'company_reviews_by_housing';

  @override
  CompanyReviewsByHousingRow createRow(Map<String, dynamic> data) =>
      CompanyReviewsByHousingRow(data);
}

class CompanyReviewsByHousingRow extends SupabaseDataRow {
  CompanyReviewsByHousingRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CompanyReviewsByHousingTable();

  int? get housingId => getField<int>('housing_id');
  set housingId(int? value) => setField<int>('housing_id', value);

  int? get companyId => getField<int>('company_id');
  set companyId(int? value) => setField<int>('company_id', value);

  String? get companyName => getField<String>('company_name');
  set companyName(String? value) => setField<String>('company_name', value);

  int? get totalReviews => getField<int>('total_reviews');
  set totalReviews(int? value) => setField<int>('total_reviews', value);

  double? get averageRating => getField<double>('average_rating');
  set averageRating(double? value) => setField<double>('average_rating', value);
}
