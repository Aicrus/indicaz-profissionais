import '../database.dart';

class QuestionHelpTable extends SupabaseTable<QuestionHelpRow> {
  @override
  String get tableName => 'question_help';

  @override
  QuestionHelpRow createRow(Map<String, dynamic> data) => QuestionHelpRow(data);
}

class QuestionHelpRow extends SupabaseDataRow {
  QuestionHelpRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => QuestionHelpTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get userID => getField<String>('userID');
  set userID(String? value) => setField<String>('userID', value);

  String? get textAvaliation => getField<String>('text_avaliation');
  set textAvaliation(String? value) =>
      setField<String>('text_avaliation', value);
}
