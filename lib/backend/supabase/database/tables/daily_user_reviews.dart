import '../database.dart';

class DailyUserReviewsTable extends SupabaseTable<DailyUserReviewsRow> {
  @override
  String get tableName => 'daily_user_reviews';

  @override
  DailyUserReviewsRow createRow(Map<String, dynamic> data) =>
      DailyUserReviewsRow(data);
}

class DailyUserReviewsRow extends SupabaseDataRow {
  DailyUserReviewsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DailyUserReviewsTable();

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  DateTime? get reviewDate => getField<DateTime>('review_date');
  set reviewDate(DateTime? value) => setField<DateTime>('review_date', value);

  int? get totalReviews => getField<int>('total_reviews');
  set totalReviews(int? value) => setField<int>('total_reviews', value);
}
