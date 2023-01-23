import 'package:flutter_application_ceiba/models/user_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class UserDBRepository {
  final table = 'users';
  
  Future<Database> _openDB() async{
    String query = 'CREATE TABLE $table (id INTEGER PRIMARY KEY, name TEXT, email TEXT, phone TEXT)';

    return openDatabase( 
      path.join(await getDatabasesPath(), '$table.db'),
      onCreate: (db, version)  => db.execute(query),
      version : 1
    );
  }

  Future<Future<int>> insertUsers(UserModel user) async{
    Database database = await _openDB();

    return database.insert(table, user.toMap());
  }

  Future<List<UserModel>> readLocalUsers() async {
    Database database = await _openDB();
    
    final List<Map<String, dynamic>> usersMap = await database.query(table);
    return List.generate(usersMap.length,
      (index) => UserModel(
        id    : usersMap[index]['id'],
        name  : usersMap[index]['name'],
        email : usersMap[index]['email'],
        phone : usersMap[index]['phone']
      )
    );
  }
}