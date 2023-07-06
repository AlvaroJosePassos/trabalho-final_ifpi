import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

initDatabase() async {
  var bd = await openDatabase(
    join(await getDatabasesPath(), 'usuarios.db'),
    version: 1,
    onCreate: onCreate,
  );
  print('Banco: ' + bd.isOpen.toString());
  return bd;
}

onCreate(db, versao) async {
  await db.execute(_usuario);
  await db.execute(_contatos);
}

String get _usuario => '''
    CREATE TABLE usuario (
      email VARCHAR(40),
      senha VARCHAR(30),
      latitude DECIMAL,
      longitude DECIMAL,
    );
  ''';

Future<void> inserirUsuario(email, senha, latitude, longitude) async {
  var db = await initDatabase();
  await db.execute(
      "INSERT INTO usuario (email, senha, latitude, longitude) VALUES ('$email', '$senha', '$latitude', '$longitude')");
}

Future<List> pegarUsuario(email) async {
  var db = await initDatabase();
  var map = await db.query("usuario",
      columns: ['*'], where: '"email" = ?', whereArgs: [email]);
  print(map);
  double? latitude = double.tryParse(map[0]['latitude'].toString());
  double? longitude = double.tryParse(map[0]['longitude'].toString());
  return [email, latitude, longitude];
}

Future<bool> verificarUsuario(email, senha) async {
  var db = await initDatabase();
  late var senhabd;
  var count = await db.query("usuario",
      columns: ['*'], where: '"email" = ?', whereArgs: [email]);
  print(count);
  try {
    senhabd = count[0]['senha'].toString();
  } catch (e) {
    senhabd = null;
  }
  if (senhabd == senha) {
    return true;
  }
  return false;
}

String get _contatos => '''
    CREATE TABLE contatos (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nome VARCHAR(30),
      latitude DECIMAL,
      longitude DECIMAL,
    );
''';

Future<void> inserirContatos(nome, latitude, longitude) async {
  var db = await initDatabase();
  await db.execute(
      'INSERT INTO contatos (nome, latitude, longitude) VALUES ("$nome", "$latitude", "$longitude")');
  print('foi');
}

Future<List> pegarContatos(id) async {
  var db = await initDatabase();
  var map = await db.query("contatos",
      columns: ['*'], where: '"id" = ?', whereArgs: [id]);
  String? nome = map[0]['nome'].toString();
  double? latitude = double.tryParse(map[0]['latitude'].toString());
  double? longitude = double.tryParse(map[0]['longitude'].toString());
  List lista = [nome, latitude, longitude];
  return lista;
}

PegarListaContatos() async {
  var db = await initDatabase();
  var map = await db.query(
    "contatos",
  );
  print(map);
  return map;
}
