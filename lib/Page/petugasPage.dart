import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_ui/responsive_ui.dart';
import 'package:url_launcher/url_launcher_string.dart';

class RespoEx extends StatelessWidget {
  const RespoEx({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final MyAppBar = AppBar(
      title: Text("Pengaduan Masyarakat"),
    );
    return Scaffold(
      appBar: MyAppBar,
      body: SingleChildScrollView(
        child: Responsive(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: List.generate(10, (i) {
              if (i == 5) {}
              return GenerateWidget(i + 1);
            })),
      ),
    );
  }
}

class GenerateWidget extends StatefulWidget {
  const GenerateWidget(this.i, {Key? key}) : super(key: key);
  final int i;

  @override
  State<StatefulWidget> createState() => _GenerateWidgetState();
}

class _GenerateWidgetState extends State<GenerateWidget> {
  int colXL = 4;
  int colL = 4;
  int colM = 4;
  int colS = 6;
  int colXS = 12;

  @override
  Widget build(BuildContext context) {
    return Div(
      divison: Division(
        colXS: colXS,
        colS: colS,
        colM: colM,
        colL: colL,
        colXL: colXL,
      ),
      child: Card(
        color: Colors.blue,
        child: SizedBox(
          height: 100,
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  Text(
                      "halohaldguuefuesfsjdjsgdhghsywtuhalohaldguuefuesfsjdjsgdhghsywtuywtywtfyuwtuywtfuywtuywtuwytfuywtfwuytfwuytohalohaldguuefuesfsjdjsgdhghsywtuywtywtfyuhalohaldguuefuesfsjdjsgdhghsywtuhalohaldguuefuesfsjdjsgdhghsywtuywtywtfyuwtuywtfuywtuywtuwytfuywtfwuytfwuytohalohaldguuefuesfsjdjsgdhghsywtuywtywtfyuwtuywtfuywtuywtuwytfuywtfwuytfwuytoywtywtfyuwtuywtfuywtuywtuwytfuywtfwuytfwuytowtuywtfuywtuywtuwytfuywtfwuytfwuytoywtywtfyuwtuywtfuywtuywtuwytfuywtfwuytfwuyto"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
