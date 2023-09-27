import 'package:fage/routes/routes.dart';
import 'package:flutter/material.dart';

class TitleEmpresaListTile extends StatefulWidget {
  final String nomeEmpresa;
  bool favorito;
  final String endereco;

  TitleEmpresaListTile({
    super.key,
    required this.nomeEmpresa,
    this.favorito = false,
    required this.endereco,
  });

  @override
  State<TitleEmpresaListTile> createState() => _TitleEmpresaListTileState();
}

class _TitleEmpresaListTileState extends State<TitleEmpresaListTile> {

  @override
  Widget build(BuildContext context) {
    return ListTile(
      isThreeLine: true,
      title: Text(widget.nomeEmpresa),
      subtitle: Text(widget.endereco),
      trailing: IconButton(
        icon: Icon(
          widget.favorito ? Icons.favorite : Icons.favorite_border,
          color: widget.favorito ? Colors.red : Colors.white,
        ),
        onPressed: () {
          setState(() {
            widget.favorito = !widget.favorito;
          });
        },
      ),
    );
  }
}
