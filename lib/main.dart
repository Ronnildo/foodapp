import 'package:cardapioapp/src/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main(){
  sqfliteFfiInit();
  runApp(CardapioApp());
}