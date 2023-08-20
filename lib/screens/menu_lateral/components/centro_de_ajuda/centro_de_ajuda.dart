import 'package:bashiri_hight_school/Models/ajuda.dart';
import 'package:bashiri_hight_school/Models/view_models/conetividade.dart';
import 'package:bashiri_hight_school/Screens/sem_internet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'components/perguntas_e_respostas.dart';

class _CentroDeAjudaState extends State<CentroDeAjuda> {
  @override
  void initState() {
    super.initState();
    Provider.of<Conectividade>(context, listen: false).verificarLigacao();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Conectividade>(
      builder: (context, utilizador, child) {
        if (utilizador.isOnline != null) {
          return utilizador.isOnline ?? false
              ? Scaffold(
                  backgroundColor: Colors.white,

                  // barra da página
                  appBar: topoDaPaginaAjuda(context),

                  // Lista para carregar as perguntas e repostas
                  body: ListView.builder(
                    itemCount: perguntasERespostas.length,
                    itemBuilder: (BuildContext context, int index) =>
                        PerguntasERespostas(
                      perguntasERespostas[index],
                    ),
                  ),
                )
              : SemInternet();
        }
        return Container(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  AppBar topoDaPaginaAjuda(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/voltar.svg"),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text(
        'Centro de ajuda',
        style: TextStyle(
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.bold,
          color: Theme.of(context).textTheme.headline6!.color,
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }
}

class CentroDeAjuda extends StatefulWidget {
  const CentroDeAjuda({Key? key}) : super(key: key);

  @override
  State<CentroDeAjuda> createState() => _CentroDeAjudaState();
}