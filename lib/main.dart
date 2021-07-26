import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ibmapp/view/resultPage/result_page.dart';
import 'package:ibmapp/viewModel/ibmNotifier.dart';

import 'view/inputPage/input_page.dart';

final ibm = ChangeNotifierProvider<IbmNotifier>((ref) => IbmNotifier());
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        sliderTheme: SliderTheme.of(context).copyWith(
            thumbShape: RoundSliderThumbShape(
              enabledThumbRadius: 10.0,
            ),
            activeTrackColor: Colors.white,
            thumbColor: Color(0xFFEB1555),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0)),
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      routes: {
        ResultPage.id: (context) => ResultPage(
              bmiresult: '',
              interpretation: '',
              resultText: '',
            ),
      },
      home: InputPage(),
    );
  }
}
