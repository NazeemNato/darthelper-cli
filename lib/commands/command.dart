import 'dart:io';
import 'package:args/command_runner.dart';
import 'package:dartHelp/data/quotes.dart';
import 'dart:math';
abstract class DartCmd extends Command {

  createFileForUsers(String fileName);

  @override 
  Future<void> run() async{
    if(argResults.arguments.isEmpty){
     throw Exception("Project name argument is required");
    }
    final fileName = argResults.arguments[0];
    final loadingString = "\nCreating $fileName...";
    stdout.write(loadingString);
    stdout.write('\n${quotes[Random().nextInt(quotes.length)]} \n\n');

    var doit = await createFileForUsers(fileName);
    stdout.write('\n$doit');
  }
}