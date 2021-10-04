import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Interface {
  static botao(String _titulo, Function _f) {
    return Container(
      child: RaisedButton(
        color: Colors.blue,
        textColor: Colors.white,
        padding: EdgeInsets.all(15),
        child: Text(
          _titulo,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        onPressed: _f,
      ),
    );
  }

  static text(String _texto) {
    return Text(
      _texto,
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static appBar(String _titulo ) {
    return AppBar(
      title: Text(_titulo),
      backgroundColor: Colors.blue,
    );
  }

  static textField(String label, TextEditingController textEditingController) {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: label),
      controller: textEditingController,
      style: TextStyle(fontSize: 22),
    );
  }


}
