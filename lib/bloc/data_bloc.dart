import 'package:bloc/bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/data_event.dart';
import 'package:news_app/bloc/data_state.dart';
import 'package:news_app/models/data_model.dart';
import 'package:news_app/services/api_service.dart';

class DoctorsBloc extends Bloc<DoctorsEvent, DoctorsStates> {
  DoctorRepository repository = DoctorRepository();

  DoctorsBloc(DoctorsStates initialState) : super(initialState);

  @override
  Stream<DoctorsStates> mapEventToState(DoctorsEvent event) async* {
    if (event is FetchPostEvent) {
      yield DoctorsLoadingState();
      try {
        List<DoctorsModel> posts = await repository.getDoctors();
        print("doctors posts");

        yield DoctorsLoadedState(list: posts);
      } catch (e) {
        yield DoctorsErrorState(message: e.toString());
      }
    }
  }
}
