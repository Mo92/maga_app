import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maga_app/app/dashboard/data/dashboard_repository.dart';
import 'package:maga_app/app/dashboard/logic/dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit(this._dashboardRepository) : super(DashboardLoading());

  final DashboardRepository _dashboardRepository;

  void loadDashboardContent() async {
    try {
      final gastros = await _dashboardRepository.getGastros();

      emit(DashboardLoaded(gastros: gastros));
    } on Error catch (e) {
      emit(DashboardError(errorMessage: e.toString()));
    }
  }
}
