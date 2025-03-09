import 'package:flutter/cupertino.dart';
import 'package:practices/commons/state_enum.dart';
import 'package:practices/domain/usecases/get_user.dart';
import '../../domain/entities/user.dart';

class UserListNotifier extends ChangeNotifier {
  final  GetUser getUser;

  UserListNotifier({
    required this.getUser
  });

  int? pageItems = 1;
  int sizeItems = 10;
  bool hasPaginationError = false;

  var _user = <User>[];
  List<User> get user => _user;

  RequestState  _userState = RequestState.empty;
  RequestState get userState => _userState;

  String _message = '';
  String get message => _message;

  Future<void> fetchUser({bool isRefresh = false}) async {
    if(isRefresh) {
      pageItems = 1;
    }
    bool isFirstPage = pageItems == 1;
    if(isFirstPage) {
      _userState = RequestState.loading;
      notifyListeners();
    }

    final result = await getUser.execute(sizeItems, pageItems);

    result.fold(
        (failure) {
          _userState = (isFirstPage) ? RequestState.error : RequestState.loaded;
          _message  = failure.message;
          hasPaginationError = !isFirstPage;
          notifyListeners();
        },
        (userData) {
          _userState = RequestState.loaded;
          if(isRefresh) {
            _user = userData;
          } else {
            final existingIds = _user.map((u) => u.id).toSet();
            final newUsers = userData.where((u) => !existingIds.contains(u.id)).toList();
            _user.addAll(newUsers);
          }
          hasPaginationError = false;
          bool hasMoreData = userData.length >= sizeItems;
          if (hasMoreData) {
            pageItems = pageItems! + 1;
          } else {
            pageItems = null;
          }
          notifyListeners();
        }
    );
  }
}