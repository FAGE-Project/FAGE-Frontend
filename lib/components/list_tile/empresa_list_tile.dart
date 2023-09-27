import 'package:fage/routes/routes.dart';
import 'package:flutter/material.dart';

class EmpresaListTile extends StatefulWidget {
  final int id;
  final String title;
  final String foto;
  bool favorito;
  final int nota;
  final String documento;
  final bool aberta;
  final String descricao;

  EmpresaListTile({
    super.key,
    required this.title,
    required this.id,
    required this.foto,
    this.favorito = false,
    required this.nota,
    required this.documento,
    required this.aberta,
    required this.descricao,
  });

  @override
  State<EmpresaListTile> createState() => _EmpresaListTileState();
}

class _EmpresaListTileState extends State<EmpresaListTile> {

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      onPressed: () => Navigator.pushNamed(context, Routes.empresa, arguments: widget.id),
      child: ListTile(
        isThreeLine: true,
        title: Text(widget.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber),
                Text("${widget.nota}", style: const TextStyle(color: Colors.amber)),
                Text(widget.aberta ? " • Aberta" : " • Fechada"),
                const Text(" • Barbearia"),
              ],
            ),
            Text(widget.descricao, overflow: TextOverflow.ellipsis,)
          ],
        ),
        leading: Image.network(widget.foto),
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
      ),
    );
  }
}
