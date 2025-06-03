import '../database.dart';

class ProhibitedWordsTable extends SupabaseTable<ProhibitedWordsRow> {
  @override
  String get tableName => 'prohibited_words';

  @override
  ProhibitedWordsRow createRow(Map<String, dynamic> data) =>
      ProhibitedWordsRow(data);
}

class ProhibitedWordsRow extends SupabaseDataRow {
  ProhibitedWordsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ProhibitedWordsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  bool get gptCreated => getField<bool>('gpt_created')!;
  set gptCreated(bool value) => setField<bool>('gpt_created', value);
}
