import 'package:dio_flutter_cep/models/back4app_cep_model.dart';
import 'package:dio_flutter_cep/models/via_cep_model.dart';
import 'package:dio_flutter_cep/repository/back4app/back4app_cep_repository.dart';
import 'package:dio_flutter_cep/repository/via_cep_repository.dart';
import 'package:flutter/material.dart';

class ListaCep extends StatefulWidget {
  const ListaCep({super.key, required this.title});

  final String title;

  @override
  State<ListaCep> createState() => _ListaCepState();
}

class _ListaCepState extends State<ListaCep> {
  var b4aCepModel = <Back4AppCepModel>[];
  final _b4aCepRepo = Back4AppCepRepository();

  @override
  void initState() {
    _buscaCEPs();
    super.initState();
  }

  Future<void> _buscaCEPs() async {
    b4aCepModel = await _b4aCepRepo.listar();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: b4aCepModel.length,
        itemBuilder: (_, index) {
          var cep1 = b4aCepModel[index].localidade;
          return const Card(
            child: ListTile(
              title: Text("teste"),
              subtitle: Text("Santa Bárbara d'Oeste-SP"),
              leading: Text("13456-005"),
              trailing: SizedBox(
                width: 64,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.edit),
                    Icon(Icons.delete),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Pesquisar Cep',
        child: const Icon(Icons.find_in_page),
      ),
    );
  }
}
