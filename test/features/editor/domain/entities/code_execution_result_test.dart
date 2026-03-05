import 'package:code_forge/features/editor/domain/entities/code_execution_result.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CodeExecutionResult', () {
    test('isAccepted returns true for statusCode 10', () {
      const result = CodeExecutionResult(state: 'SUCCESS', statusCode: 10);
      expect(result.isAccepted, true);
    });

    test('isAccepted returns false for non-10 statusCode', () {
      const result = CodeExecutionResult(state: 'SUCCESS', statusCode: 11);
      expect(result.isAccepted, false);
    });

    test('isPending returns true for PENDING state', () {
      const result = CodeExecutionResult(state: 'PENDING');
      expect(result.isPending, true);
    });

    test('isPending returns true for STARTED state', () {
      const result = CodeExecutionResult(state: 'STARTED');
      expect(result.isPending, true);
    });

    test('isPending returns false for SUCCESS state', () {
      const result = CodeExecutionResult(state: 'SUCCESS');
      expect(result.isPending, false);
    });

    test('isFinished returns true for SUCCESS state', () {
      const result = CodeExecutionResult(state: 'SUCCESS');
      expect(result.isFinished, true);
    });

    test('isFinished returns false for PENDING state', () {
      const result = CodeExecutionResult(state: 'PENDING');
      expect(result.isFinished, false);
    });

    test('supports equality based on state, statusCode, submissionId', () {
      const result1 = CodeExecutionResult(
        state: 'SUCCESS',
        statusCode: 10,
        submissionId: '123',
      );
      const result2 = CodeExecutionResult(
        state: 'SUCCESS',
        statusCode: 10,
        submissionId: '123',
        statusRuntime: '32 ms',
      );
      expect(result1, result2);
    });
  });
}
