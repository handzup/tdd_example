import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entites/number_trivia.dart';

abstract class NumberTriviaRepository {
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int number);
  Future<Either<Failure, NumberTrivia>> getrandomNumberTrivia();
}
