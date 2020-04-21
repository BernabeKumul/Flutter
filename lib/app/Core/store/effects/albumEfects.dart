import 'package:app_demo/app/Core/common/AlbumServiceDependency.dart';
import 'package:app_demo/app/Core/common/perfil_service_dependency.dart';
import 'package:app_demo/app/Core/store/actions/albumActions.dart';
import 'package:app_demo/app/Core/utils/middleware_injector.dart';
import 'package:app_demo/app/Core/store/models/appState.dart';

ThunkInjectedAction<AlbumServiceDependency, PerfilServiceDependency, AppState> fetchAbumsAction() {
  return (deps, perf) => (store) {
        store.dispatch(new StartLoadingAlbumAction());
        deps.albumService.getAll().then((albums) {
          store.dispatch(new AlbumSuccessAction(albums));
        }).catchError((exception) => print(exception.toString()));
      };
}