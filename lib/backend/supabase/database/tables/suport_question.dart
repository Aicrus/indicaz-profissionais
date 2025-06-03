import '../database.dart';

class SuportQuestionTable extends SupabaseTable<SuportQuestionRow> {
  @override
  String get tableName => 'suportQuestion';

  @override
  SuportQuestionRow createRow(Map<String, dynamic> data) =>
      SuportQuestionRow(data);
}

class SuportQuestionRow extends SupabaseDataRow {
  SuportQuestionRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SuportQuestionTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get contentText => getField<String>('content_text');
  set contentText(String? value) => setField<String>('content_text', value);
}
