import '../database.dart';

class HousingTable extends SupabaseTable<HousingRow> {
  @override
  String get tableName => 'housing';

  @override
  HousingRow createRow(Map<String, dynamic> data) => HousingRow(data);
}

class HousingRow extends SupabaseDataRow {
  HousingRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => HousingTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get fullAddress => getField<String>('fullAddress');
  set fullAddress(String? value) => setField<String>('fullAddress', value);

  String? get houseName => getField<String>('houseName');
  set houseName(String? value) => setField<String>('houseName', value);

  String? get typeHouse => getField<String>('typeHouse');
  set typeHouse(String? value) => setField<String>('typeHouse', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get userCreated => getField<String>('user_created');
  set userCreated(String? value) => setField<String>('user_created', value);

  String? get latLng => getField<String>('lat_lng');
  set latLng(String? value) => setField<String>('lat_lng', value);

  String? get zipCode => getField<String>('zip_code');
  set zipCode(String? value) => setField<String>('zip_code', value);

  String? get country => getField<String>('country');
  set country(String? value) => setField<String>('country', value);

  String? get city => getField<String>('city');
  set city(String? value) => setField<String>('city', value);

  String? get state => getField<String>('state');
  set state(String? value) => setField<String>('state', value);

  String? get photo => getField<String>('photo');
  set photo(String? value) => setField<String>('photo', value);
}
