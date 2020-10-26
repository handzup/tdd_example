import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:tdd_example/features/number_trivia/domain/entites/number_trivia.dart';
import 'package:tdd_example/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_example/features/number_trivia/domain/usecases/get_concret_number_trivia.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  GetConcreteNumberTrivia usecase;
  MockNumberTriviaRepository mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository);
  });
  final tNumber = 1;
  final tNumberTrivia = NumberTrivia(number: 1, text: 'test');
  test(
    'should get trivia for the number from repository',
    () async {
      when(mockNumberTriviaRepository.getConcreteNumberTrivia(any))
          .thenAnswer((_) async => Right(tNumberTrivia));
      final result = await usecase.execute(number: tNumber);

      expect(result, Right(tNumberTrivia));
      verify(mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber));
      verifyNoMoreInteractions(mockNumberTriviaRepository);
    },
  );
}
