import 'package:app_demo/app/Core/common/AlbumServiceDependency.dart';
import 'package:app_demo/app/Core/common/perfil_service_dependency.dart';
import 'package:app_demo/app/Core/store/actions/albumActions.dart';
import 'package:app_demo/app/Core/store/actions/perfil_actions.dart';
import 'package:app_demo/app/Core/utils/middleware_injector.dart';
import 'package:app_demo/app/Core/store/models/appState.dart';

ThunkInjectedAction<AlbumServiceDependency, PerfilServiceDependency, AppState> fetchPerfilAction() {
  return (deps, perf) => (store) {
        store.dispatch(new StartLoadingAlbumAction());
        perf.perfilService.getAll().then((perfil) {
          store.dispatch(new PerfilSuccessAction(perfil));
        }).catchError((exception) => print(exception.toString()));
      };
}