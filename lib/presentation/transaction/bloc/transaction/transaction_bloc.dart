import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodmarket_app/data/datasources/transaction_remote_datasource.dart';
import 'package:foodmarket_app/data/models/transaction_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';
part 'transaction_bloc.freezed.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  TransactionBloc() : super(const _Initial()) {
    on<_GetTransaction>((event, emit) async {
      emit(const _Loading());
      final result = await TransactionRemoteDatasource().getTransaction();
      result.fold(
        (error) => emit(_Error(error)),
        (data) => emit(_Loaded(data)),
      );
    });
  }
}
