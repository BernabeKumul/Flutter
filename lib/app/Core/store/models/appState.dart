import 'package:app_demo/app/Core/store/models/AlbumState.dart';
import 'package:app_demo/app/Core/store/models/UserState.dart';
import 'package:meta/meta.dart';

@immutable
class AppState{
  final UserState userState;
  final AlbumState albumState;

  AppState({
    @required this.userState,
    @required this.albumState
  });

  factory AppState.initial(){
    return AppState(userState: UserState.initial(), albumState: AlbumState.initial());
  }

  AppState copyWith({UserState userState, AlbumState albumState}){
    return AppState(
      userState: userState ?? this.userState,
      albumState: albumState ?? this.albumState);
  }

  @override
  int get hasCode => userState.hashCode;

  @override
  bool operator ==(Object other) => 
     identical(this, other) ||
        other is AppState && userState == other.userState;
}