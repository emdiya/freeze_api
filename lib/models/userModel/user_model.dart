import 'package:freeze_api/models/address_model/address_model.dart';
import 'package:freeze_api/models/company_model/company_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  factory UserModel({
    @JsonKey(name: "id") final int? id,
    @JsonKey(name: "name") final String? name,
    @JsonKey(name: "username") final String? username,
    @JsonKey(name: "email") final String? email,
    @JsonKey(name: "address") final Address? address,
    @JsonKey(name: "phone") final String? phone,
    @JsonKey(name: "website") final String? website,
    @JsonKey(name: "company") final Company? company,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
