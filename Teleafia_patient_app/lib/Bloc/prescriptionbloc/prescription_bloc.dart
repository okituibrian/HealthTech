import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:image_picker/image_picker.dart';

part 'prescription_event.dart';
part 'prescription_state.dart';

class PrescriptionBloc extends Bloc<PrescriptionEvent, PrescriptionState> {
  final ImagePicker _picker = ImagePicker();

  PrescriptionBloc() : super(ImagePickingState());

  @override
  Stream<PrescriptionState> mapEventToState(PrescriptionEvent event) async* {
    if (event is PickImageEvent) {
      yield ImagePickingState();
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        yield ImagePickedState(File(pickedFile.path));
      }
    }
  }
}

