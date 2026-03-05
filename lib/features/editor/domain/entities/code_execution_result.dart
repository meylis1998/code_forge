import 'package:equatable/equatable.dart';

class CodeExecutionResult extends Equatable {
  const CodeExecutionResult({
    required this.state,
    this.statusCode,
    this.statusMessage,
    this.statusRuntime,
    this.statusMemory,
    this.runtimePercentile,
    this.memoryPercentile,
    this.totalCorrect,
    this.totalTestcases,
    this.codeAnswer,
    this.expectedAnswer,
    this.compileError,
    this.runtimeError,
    this.lastTestcase,
    this.stdOutput,
    this.submissionId,
  });

  // Status codes from LeetCode
  static const int statusAccepted = 10;
  static const int statusWrongAnswer = 11;
  static const int statusTimeLimitExceeded = 14;
  static const int statusRuntimeError = 15;
  static const int statusCompileError = 20;

  final String state; // SUCCESS, PENDING, STARTED
  final int? statusCode;
  final String? statusMessage;
  final String? statusRuntime;
  final String? statusMemory;
  final double? runtimePercentile;
  final double? memoryPercentile;
  final int? totalCorrect;
  final int? totalTestcases;
  final List<String>? codeAnswer;
  final List<String>? expectedAnswer;
  final String? compileError;
  final String? runtimeError;
  final String? lastTestcase;
  final String? stdOutput;
  final String? submissionId;

  bool get isAccepted => statusCode == statusAccepted;
  bool get isWrongAnswer => statusCode == statusWrongAnswer;
  bool get isTimeLimitExceeded => statusCode == statusTimeLimitExceeded;
  bool get isRuntimeError => statusCode == statusRuntimeError;
  bool get isCompileError => statusCode == statusCompileError;
  bool get isPending => state == 'PENDING' || state == 'STARTED';
  bool get isFinished => state == 'SUCCESS';

  String get statusLabel {
    switch (statusCode) {
      case statusAccepted:
        return 'Accepted';
      case statusWrongAnswer:
        return 'Wrong Answer';
      case statusTimeLimitExceeded:
        return 'Time Limit Exceeded';
      case statusRuntimeError:
        return 'Runtime Error';
      case statusCompileError:
        return 'Compile Error';
      default:
        return statusMessage ?? 'Unknown';
    }
  }

  String? get errorDetail {
    if (isCompileError) return compileError;
    if (isRuntimeError) return runtimeError;
    return null;
  }

  @override
  List<Object?> get props => [state, statusCode, submissionId];
}
