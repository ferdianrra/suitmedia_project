import 'package:equatable/equatable.dart';
import 'package:practices/data/models/user_model.dart';

class UserResponse extends Equatable {
  final List<UserModel> userList;

  const UserResponse({
    required this.userList
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
      userList: List<UserModel>.from((json["data"] as List)
          .map((x) => UserModel.fromJson(x))
      )
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(userList.map((x) => x.toJson()))
  };

  @override
  List<Object?> get props => [userList];

}