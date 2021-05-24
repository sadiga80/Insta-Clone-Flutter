import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String code;
  final String message;

  const Failure({
    this.code = '',
    this.message = '',
  });

  @override
  bool get stringify =>
      true; //prints instance in readable format (mentioned in props)

  @override
  List<Object> get props => [
        code,
        message
      ]; //to determine whether 2 instances are equal. helps to compare 2 objects completely by specified properties here rather than comparing properties one by one.
}
