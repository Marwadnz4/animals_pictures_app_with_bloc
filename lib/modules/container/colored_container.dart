import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/modules/container/cubit/states.dart';
import 'package:audioplayers/audioplayers.dart';
import 'cubit/cubit.dart';

class ColoredContainer extends StatelessWidget {
  const ColoredContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ColorCubit(),
      child: BlocConsumer<ColorCubit, ColorStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text('ANIMALS'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      animalButton(context,
                          text: 'GOAT',
                          imageURL:
                              'https://imgs.search.brave.com/l2wKsBeLzk2DZcIA0-Fn117rOG6LWoTLXJ4B4HThGwY/rs:fit:655:225:1/g:ce/aHR0cHM6Ly90c2Uz/Lm1tLmJpbmcubmV0/L3RoP2lkPU9JUC40/Ulo2S3gxOTVKMUI0/VV9pSDE2TF93SGFG/WCZwaWQ9QXBp'),
                      animalButton(context,
                          text: 'COW',
                          imageURL:
                              'https://imgs.search.brave.com/6LolcGGcM0MFvePuXt38yGxTKAkg2ZRXp9w1A0a92EQ/rs:fit:472:225:1/g:ce/aHR0cHM6Ly90c2Uz/Lm1tLmJpbmcubmV0/L3RoP2lkPU9JUC5L/OC1Sa1BnSVZCM2Rp/d2lVaVdCSXRRSGFI/YyZwaWQ9QXBp'),
                      animalButton(context,
                          text: 'DONKEY',
                          imageURL:
                              'https://imgs.search.brave.com/tP93Zu-zb1is0yhZNQZjzCp1a3UAEUzyPI8rxHnqog8/rs:fit:711:225:1/g:ce/aHR0cHM6Ly90c2U0/Lm1tLmJpbmcubmV0/L3RoP2lkPU9JUC5N/RjlsWVE0dGZpRmE1/c2lfUDBoSEJRSGFF/OCZwaWQ9QXBp'),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.network(
                      ColorCubit.get(context).image,
                      height: 250,
                      width: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    'Animal name is: ${ColorCubit.get(context).text}',
                    style: const TextStyle(
                      color: Colors.cyanAccent,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

void playSound(String soundNumber) {
  final player = AudioPlayer();
  player.play(AssetSource('$soundNumber.mp3'));
}

Widget animalButton(
  context, {
  required String text,
  required String imageURL,
}) =>
    TextButton(
      onPressed: () {
        playSound(text);
        ColorCubit.get(context).changeImage(imageURL);
        ColorCubit.get(context).changeText(text);
      },
      child: Text(
        text,
        style: const TextStyle(color: Colors.cyan, fontSize: 25.0),
      ),
    );
