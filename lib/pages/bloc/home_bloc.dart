import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/pages/bloc/home_event.dart';
import 'package:flutter_cubit/pages/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(HomeState initialState) : super(HomeLoadingState());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    var state;
    switch (event.runtimeType) {
      case HomeFetchList:
        state = await _fetchList();
        break;
      case HomeFetchListWithError:
        state = await _fetchListWithError();
        break;
      case HomeFetchListWithEmptyList:
        state = await _fetchListWithEmptyList();
        break;
    }
    yield state;
  }

  Future<HomeState> _fetchList() async {
    var list = await Future.delayed(
      Duration(seconds: 3),
      () => <String>[
        'Bruno',
        'Lena',
        'Gustavo',
        'Pedro',
      ],
    );
    return HomeStateLoaded(list: list);
  }

  Future<HomeState> _fetchListWithError() async {
    return await Future.delayed(
      Duration(seconds: 3),
      () => HomeErrorState(message: 'Não foi possivel carregar os dados.'),
    );
  }

  Future<HomeState> _fetchListWithEmptyList() async {
    var list = await Future.delayed(
      Duration(seconds: 3),
          () => <String>[
      ],
    );
    return HomeStateEmpty(list: list);
  }
}
