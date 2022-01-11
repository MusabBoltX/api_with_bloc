import 'package:equatable/equatable.dart';

abstract class DoctorsEvent extends Equatable {}

class FetchPostEvent extends DoctorsEvent {
  @override
  List<Object> get props => [];
}