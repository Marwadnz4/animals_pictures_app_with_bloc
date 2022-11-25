import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/modules/container/cubit/states.dart';

class ColorCubit extends Cubit<ColorStates> {
  ColorCubit() : super(InitStates());
  String image = 'https://imgs.search.brave.com/2N6T4xA1TB6G4kfue5Byuo0NdnXT0_Jn55COfKalPMc/rs:fit:474:225:1/g:ce/aHR0cHM6Ly90c2Uz/Lm1tLmJpbmcubmV0/L3RoP2lkPU9JUC5o/cGRzclRiMkFxclFq/OFBXWmJRemt3SGFI/YSZwaWQ9QXBp';
  String text = 'Black';
  static ColorCubit get(context) => BlocProvider.of(context);

  void changeImage(String image) {
    this.image = image;
    emit(ChangeColorState());
  }

  void changeText(text) {
    this.text = text;
    emit(TextState());
  }
}
