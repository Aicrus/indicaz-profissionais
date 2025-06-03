import '../database.dart';

class UserProfissionaisTable extends SupabaseTable<UserProfissionaisRow> {
  @override
  String get tableName => 'user_profissionais';

  @override
  UserProfissionaisRow createRow(Map<String, dynamic> data) =>
      UserProfissionaisRow(data);
}

class UserProfissionaisRow extends SupabaseDataRow {
  UserProfissionaisRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserProfissionaisTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  String? get sobrenome => getField<String>('sobrenome');
  set sobrenome(String? value) => setField<String>('sobrenome', value);

  String? get phone => getField<String>('phone');
  set phone(String? value) => setField<String>('phone', value);

  String? get foto => getField<String>('foto');
  set foto(String? value) => setField<String>('foto', value);

  String? get provider => getField<String>('provider');
  set provider(String? value) => setField<String>('provider', value);

  bool? get isOnbarding => getField<bool>('is_onbarding');
  set isOnbarding(bool? value) => setField<bool>('is_onbarding', value);

  int? get company => getField<int>('company');
  set company(int? value) => setField<int>('company', value);

  String? get planoAssinatura => getField<String>('plano_assinatura');
  set planoAssinatura(String? value) =>
      setField<String>('plano_assinatura', value);
}
