import '../database.dart';

class ActivityTable extends SupabaseTable<ActivityRow> {
  @override
  String get tableName => 'activity';

  @override
  ActivityRow createRow(Map<String, dynamic> data) => ActivityRow(data);
}

class ActivityRow extends SupabaseDataRow {
  ActivityRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ActivityTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  bool? get status => getField<bool>('status');
  set status(bool? value) => setField<bool>('status', value);

  String? get category => getField<String>('category');
  set category(String? value) => setField<String>('category', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
