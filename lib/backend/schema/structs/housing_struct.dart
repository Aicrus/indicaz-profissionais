// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HousingStruct extends BaseStruct {
  HousingStruct({
    int? id,
    String? name,
    String? latlng,
    String? imageIcon,
    String? imageIconWhite,
    String? address,
    String? complement,
    String? type,
    String? photo,
  })  : _id = id,
        _name = name,
        _latlng = latlng,
        _imageIcon = imageIcon,
        _imageIconWhite = imageIconWhite,
        _address = address,
        _complement = complement,
        _type = type,
        _photo = photo;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "latlng" field.
  String? _latlng;
  String get latlng => _latlng ?? '';
  set latlng(String? val) => _latlng = val;

  bool hasLatlng() => _latlng != null;

  // "imageIcon" field.
  String? _imageIcon;
  String get imageIcon => _imageIcon ?? '';
  set imageIcon(String? val) => _imageIcon = val;

  bool hasImageIcon() => _imageIcon != null;

  // "imageIconWhite" field.
  String? _imageIconWhite;
  String get imageIconWhite => _imageIconWhite ?? '';
  set imageIconWhite(String? val) => _imageIconWhite = val;

  bool hasImageIconWhite() => _imageIconWhite != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  set address(String? val) => _address = val;

  bool hasAddress() => _address != null;

  // "complement" field.
  String? _complement;
  String get complement => _complement ?? '';
  set complement(String? val) => _complement = val;

  bool hasComplement() => _complement != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  set photo(String? val) => _photo = val;

  bool hasPhoto() => _photo != null;

  static HousingStruct fromMap(Map<String, dynamic> data) => HousingStruct(
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
        latlng: data['latlng'] as String?,
        imageIcon: data['imageIcon'] as String?,
        imageIconWhite: data['imageIconWhite'] as String?,
        address: data['address'] as String?,
        complement: data['complement'] as String?,
        type: data['type'] as String?,
        photo: data['photo'] as String?,
      );

  static HousingStruct? maybeFromMap(dynamic data) =>
      data is Map ? HousingStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'latlng': _latlng,
        'imageIcon': _imageIcon,
        'imageIconWhite': _imageIconWhite,
        'address': _address,
        'complement': _complement,
        'type': _type,
        'photo': _photo,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'latlng': serializeParam(
          _latlng,
          ParamType.String,
        ),
        'imageIcon': serializeParam(
          _imageIcon,
          ParamType.String,
        ),
        'imageIconWhite': serializeParam(
          _imageIconWhite,
          ParamType.String,
        ),
        'address': serializeParam(
          _address,
          ParamType.String,
        ),
        'complement': serializeParam(
          _complement,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'photo': serializeParam(
          _photo,
          ParamType.String,
        ),
      }.withoutNulls;

  static HousingStruct fromSerializableMap(Map<String, dynamic> data) =>
      HousingStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        latlng: deserializeParam(
          data['latlng'],
          ParamType.String,
          false,
        ),
        imageIcon: deserializeParam(
          data['imageIcon'],
          ParamType.String,
          false,
        ),
        imageIconWhite: deserializeParam(
          data['imageIconWhite'],
          ParamType.String,
          false,
        ),
        address: deserializeParam(
          data['address'],
          ParamType.String,
          false,
        ),
        complement: deserializeParam(
          data['complement'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        photo: deserializeParam(
          data['photo'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'HousingStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is HousingStruct &&
        id == other.id &&
        name == other.name &&
        latlng == other.latlng &&
        imageIcon == other.imageIcon &&
        imageIconWhite == other.imageIconWhite &&
        address == other.address &&
        complement == other.complement &&
        type == other.type &&
        photo == other.photo;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        name,
        latlng,
        imageIcon,
        imageIconWhite,
        address,
        complement,
        type,
        photo
      ]);
}

HousingStruct createHousingStruct({
  int? id,
  String? name,
  String? latlng,
  String? imageIcon,
  String? imageIconWhite,
  String? address,
  String? complement,
  String? type,
  String? photo,
}) =>
    HousingStruct(
      id: id,
      name: name,
      latlng: latlng,
      imageIcon: imageIcon,
      imageIconWhite: imageIconWhite,
      address: address,
      complement: complement,
      type: type,
      photo: photo,
    );
