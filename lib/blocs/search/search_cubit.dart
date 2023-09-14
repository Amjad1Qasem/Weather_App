import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/controllers/controller.dart';
import 'package:weather_app/models/class.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  void search(String location) async {
    emit(SearchLoading());
    // search logic
    try {
      final currentModel = await WeatherCurrentController.getCurrentWeather(
        cityName: location,
      );
      // emit state
      emit(SearchFetched(currentModel));
    } catch (e) {
      emit(SearchError(e.toString().replaceFirst('Exception: ', '')));
    }
  }
}
