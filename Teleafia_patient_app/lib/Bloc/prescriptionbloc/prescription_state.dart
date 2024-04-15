part of 'prescription_bloc.dart';

@immutable
abstract class PrescriptionState {}

class PrescriptionInitial extends PrescriptionState {}
class ImagePickingState extends PrescriptionState{}
class ImagePickedState extends PrescriptionState{
  final File imageFile;
  ImagePickedState(this.imageFile);
}
