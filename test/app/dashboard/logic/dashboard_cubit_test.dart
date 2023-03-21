import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:maga_app/app/dashboard/data/dashboard_repository.dart';
import 'package:maga_app/app/dashboard/data/models/gastro_model.dart';
import 'package:maga_app/app/dashboard/logic/dashboard_cubit.dart';
import 'package:maga_app/app/dashboard/logic/dashboard_state.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MockDashboardRepository extends Mock implements DashboardRepository {}

final gastrosMock = <GastroModel>[
  GastroModel(
      name: 'name',
      street: 'street',
      houseNr: 'houseNr',
      postalCode: 00000,
      city: 'city',
      distance: 'distance',
      queue: 1,
      averageWaitingTime: 'averageWaitingTime',
      backgroundImageUrl: 'backgroundImageUrl')
];

void main() {
  late MockDashboardRepository mockDashboardRepository;

  setUp(() {
    mockDashboardRepository = MockDashboardRepository();
  });

  blocTest<DashboardCubit, DashboardState>(
    'emits DashboardLoaded when loadDashboardContent() is called successfully',
    setUp: () {
      when(() => mockDashboardRepository.getGastros())
          .thenAnswer((_) async => gastrosMock);
    },
    build: () => DashboardCubit(mockDashboardRepository),
    act: (cubit) => cubit.loadDashboardContent(),
    expect: () => [DashboardLoaded(gastros: gastrosMock)],
    verify: (_) async {
      verify(() => mockDashboardRepository.getGastros()).called(1);
    },
  );

  blocTest<DashboardCubit, DashboardState>(
    'emits DashboardError when loadDashboardContent() throws exception',
    setUp: () {
      when(() => mockDashboardRepository.getGastros()).thenThrow(Exception());
    },
    build: () => DashboardCubit(mockDashboardRepository),
    act: (cubit) => cubit.loadDashboardContent(),
    expect: () => [
      DashboardError(errorMessage: Exception().toString()),
    ],
    verify: (_) async {
      verify(() => mockDashboardRepository.getGastros()).called(1);
    },
  );
}
