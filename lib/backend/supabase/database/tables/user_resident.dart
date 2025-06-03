import '../database.dart';

class UserResidentTable extends SupabaseTable<UserResidentRow> {
  @override
  String get tableName => 'user_resident';

  @override
  UserResidentRow createRow(Map<String, dynamic> data) => UserResidentRow(data);
}

class UserResidentRow extends SupabaseDataRow {
  UserResidentRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserResidentTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get tellphone => getField<String>('tellphone');
  set tellphone(String? value) => setField<String>('tellphone', value);

  String? get photo => getField<String>('photo');
  set photo(String? value) => setField<String>('photo', value);

  bool? get isOnbarding => getField<bool>('is_onbarding');
  set isOnbarding(bool? value) => setField<bool>('is_onbarding', value);

  String? get provider => getField<String>('provider');
  set provider(String? value) => setField<String>('provider', value);
}
