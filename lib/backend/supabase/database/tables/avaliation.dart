import '../database.dart';

class AvaliationTable extends SupabaseTable<AvaliationRow> {
  @override
  String get tableName => 'avaliation';

  @override
  AvaliationRow createRow(Map<String, dynamic> data) => AvaliationRow(data);
}

class AvaliationRow extends SupabaseDataRow {
  AvaliationRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AvaliationTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  int? get companyId => getField<int>('company_id');
  set companyId(int? value) => setField<int>('company_id', value);

  String? get comment => getField<String>('comment');
  set comment(String? value) => setField<String>('comment', value);

  double? get rating => getField<double>('rating');
  set rating(double? value) => setField<double>('rating', value);

  int? get housingId => getField<int>('housing_id');
  set housingId(int? value) => setField<int>('housing_id', value);

  bool get anon => getField<bool>('anon')!;
  set anon(bool value) => setField<bool>('anon', value);
}
