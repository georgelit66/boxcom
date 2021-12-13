import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class DatabaseRepository {
  DatabaseRepository.privateConstructor();

  static final DatabaseRepository instance =
  DatabaseRepository.privateConstructor();

  final _databaseName = 'boxcomDatabase';
  final _databaseVersion = 1;

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await _initDatabase();
    }
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: onCreate);
  }

  Future onCreate(Database db, int version) async {

    await db.execute('''
          CREATE TABLE user (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name STRING NOT NULL,
            surname STRING NOT NULL,
            birth_date DATE NOT NULL,
            sex STRING NOT NULL,
            country STRING NOT NULL,
            town STRING NOT NULL,
            address STRING NOT NULL,
            email STRING NOT NULL,
            phoneNumber CHAR(10),
            creationDate DATE NOT NULL,
            suppressionDate DATE NOT NULL, 
            state INT NOT NULL,
            FK_contact_category INT NOT NULL,
            FOREIGN KEY (FK_contact_category) REFERENCES category (categoryId) 
            
          )
          ''');

    await db.execute('''
          CREATE TABLE enterprise (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            tagName STRING NOT NULL,
            name STRING NOT NULL,
            enterpriseSector STRING,
            description TEXT,
            country STRING,
            town STRING,
            address STRING,
            website STRING,
            openHour STRING,
            closingHour STRING,
            phoneNumber  CHAR(10),
            email STRING,
            creationDate DATE NOT NULL,
            suppressionDate DATE,
            state INT NOT NULL,
            FK_creator_id INT NOT NULL,
            FOREIGN KEY (FK_creator_id) REFERENCES user (id) 
          )
          ''');


    await db.execute('''
          CREATE TABLE boutique (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            tagName STRING NOT NULL,
            name STRING NOT NULL,
            boutiqueSector STRING,
            description TEXT,
            country STRING,
            town STRING,
            address STRING,
            website STRING,
            openHour STRING,
            closingHour STRING,
            phoneNumber  CHAR(10),
            email STRING,
            creationDate DATE NOT NULL,
            suppressionDate DATE,
            state INT NOT NULL,
            FK_creator_id INT NOT NULL,
            FOREIGN KEY (FK_creator_id) REFERENCES user (id) 
          )
          ''');

    await db.execute('''
          CREATE TABLE post (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            creation_date DATE ,
            name STRING NOT NULL,
            boutiqueSector STRING,
            delete_date DATE,
            file_type STRING NOT NULL,
            likes INT,
            price STRING,
            description TEXT,
            state STRING,
            FK__id INT NOT NULL,
            FOREIGN KEY (FK_user_id) REFERENCES user (id) 
          )
          ''');


    await db.execute('''
          CREATE TABLE comment(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            creation_date DATE ,
            text STRING,
            FK_post_id INT NOT NULL,
            FOREIGN KEY (FK_post_id) REFERENCES post (id) 
          )
          ''');


    await db.execute(
      '''
      CREATE TABLE country(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
       name STRING NOT NULL,
      )
      ''');
  }
}