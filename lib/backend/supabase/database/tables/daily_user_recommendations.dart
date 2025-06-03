import '../database.dart';

class DailyUserRecommendationsTable
    extends SupabaseTable<DailyUserRecommendationsRow> {
  @override
  String get tableName => 'daily_user_recommendations';

  @override
  DailyUserRecommendationsRow createRow(Map<String, dynamic> data) =>
      DailyUserRecommendationsRow(data);
}

class DailyUserRecommendationsRow extends SupabaseDataRow {
  DailyUserRecommendationsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DailyUserRecommendationsTable();

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  DateTime? get recommendationDate => getField<DateTime>('recommendation_date');
  set recommendationDate(DateTime? value) =>
      setField<DateTime>('recommendation_date', value);

  int? get totalRecommendations => getField<int>('total_recommendations');
  set totalRecommendations(int? value) =>
      setField<int>('total_recommendations', value);
}
