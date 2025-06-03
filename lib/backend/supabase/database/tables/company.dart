import '../database.dart';

class CompanyTable extends SupabaseTable<CompanyRow> {
  @override
  String get tableName => 'company';

  @override
  CompanyRow createRow(Map<String, dynamic> data) => CompanyRow(data);
}

class CompanyRow extends SupabaseDataRow {
  CompanyRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CompanyTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get phone => getField<String>('phone')!;
  set phone(String value) => setField<String>('phone', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  int? get mainActivity => getField<int>('main_activity');
  set mainActivity(int? value) => setField<int>('main_activity', value);

  String? get userCreated => getField<String>('user_created');
  set userCreated(String? value) => setField<String>('user_created', value);

  int? get housingCreated => getField<int>('housing_created');
  set housingCreated(int? value) => setField<int>('housing_created', value);

  bool? get activated => getField<bool>('activated');
  set activated(bool? value) => setField<bool>('activated', value);

  String? get photo => getField<String>('photo');
  set photo(String? value) => setField<String>('photo', value);

  List<int> get outherActivity => getListField<int>('outher_activity');
  set outherActivity(List<int>? value) =>
      setListField<int>('outher_activity', value);

  int? get userProfissional => getField<int>('user_profissional');
  set userProfissional(int? value) => setField<int>('user_profissional', value);

  String? get address => getField<String>('address');
  set address(String? value) => setField<String>('address', value);

  String? get imageCover => getField<String>('image_cover');
  set imageCover(String? value) => setField<String>('image_cover', value);

  String? get presentation => getField<String>('presentation');
  set presentation(String? value) => setField<String>('presentation', value);
}
