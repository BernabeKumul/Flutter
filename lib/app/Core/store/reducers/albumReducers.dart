


import 'package:app_demo/app/Core/store/actions/albumActions.dart';
import 'package:app_demo/app/Core/store/models/AlbumState.dart';
import 'package:redux/redux.dart';

final albumReducer = combineReducers<AlbumState>(
  [
      TypedReducer<AlbumState,AlbumSuccessAction >(_albumSuccess),
      TypedReducer<AlbumState,AlbumFailedAction >(_albumFailed),
      TypedReducer<AlbumState,StartLoadingAlbumAction >(_albumloading),
  ]
);


AlbumState _albumSuccess(AlbumState state, AlbumSuccessAction action){
  return state.copyWith(
    isLoading: false,
    loadingError: false,
    albums: action.data
  );
}

AlbumState _albumFailed(AlbumState state, AlbumFailedAction action){
  return state.copyWith(
    isLoading: false,
    loadingError: true,
    albums: null
  );
}

AlbumState _albumloading(AlbumState state, StartLoadingAlbumAction action){
  return state.copyWith(
    isLoading: true,
    loadingError: false,
    albums: null
  );
}