import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';


class InjectedMiddleware<Deps, Perf> {

  final Deps deps;
  final Perf perf;

  const InjectedMiddleware({this.deps, this.perf});

  void thunkMiddlewareInjector<State>(
      Store<State> store,
      dynamic action,
      NextDispatcher next,
      ) {
    if (action is ThunkInjectedAction<Deps, Perf, State>) {
      action(deps, perf)(store);
    } else {
      next(action);
    }
  }
}

typedef ThunkAction<State> ThunkInjectedAction<Deps, Perf, State>(Deps deps, Perf perf);
