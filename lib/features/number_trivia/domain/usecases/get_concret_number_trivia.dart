import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:tdd_example/core/error/failures.dart';
import 'package:tdd_example/features/number_trivia/domain/entites/number_trivia.dart';

import '../repositories/number_trivia_repository.dart';

class GetConcreteNumberTrivia {
  final NumberTriviaRepository repository;

  GetConcreteNumberTrivia(this.repository);
  Future<Either<Failure, NumberTrivia>> execute({
    @required int number,
  }) async {
    return await repository.getConcreteNumberTrivia(number);
  }
}
