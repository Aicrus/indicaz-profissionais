import '../database.dart';

class HelpTable extends SupabaseTable<HelpRow> {
  @override
  String get tableName => 'help';

  @override
  HelpRow createRow(Map<String, dynamic> data) => HelpRow(data);
}

class HelpRow extends SupabaseDataRow {
  HelpRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => HelpTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get question => getField<String>('question');
  set question(String? value) => setField<String>('question', value);

  String? get response => getField<String>('response');
  set response(String? value) => setField<String>('response', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);

  String? get questionVector => getField<String>('question_vector');
  set questionVector(String? value) =>
      setField<String>('question_vector', value);
}
