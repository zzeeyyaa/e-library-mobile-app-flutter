const String createUser = '''
CREATE TABLE user (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  email TEXT NOT NULL UNIQUE,
  password TEXT NOT NULL
)
''';

const String createBook = '''
CREATE TABLE book (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT NOT NULL,
  description TEXT,
  author TEXT,
  year INTEGER,
  thumbnail TEXT,
  isFavorite INTEGER NOT NULL DEFAULT 0
)
''';
