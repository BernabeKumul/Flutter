import 'package:app_demo/app/Core/common/AlbumServiceDependency.dart';
import 'package:app_demo/app/Core/store/actions/albumActions.dart';
import 'package:app_demo/app/Core/utils/middleware_injector.dart';
import 'package:app_demo/app/Core/store/models/appState.dart';

ThunkInjectedAction<AlbumServiceDependency, AppState> fetchAbumsAction() {
  return (deps) => (store) {
        store.dispatch(new StartLoadingAlbumAction());
        deps.albumService.getAll().then((albums) {
          store.dispatch(new AlbumSuccessAction(albums));
        }).catchError((exception) => print(exception.toString()));
      };
}