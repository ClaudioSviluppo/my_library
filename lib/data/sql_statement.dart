import '../data/libri.dart' as libri;

class SQlStatement {
  String sqlLibri =
      'Create Table ${libri.tableName}(${libri.columnId}integer primary key autoincrement, ${libri.columnAuthor} text not null, ${libri.columnTitle} text not null, ${libri.columnCategory} text not null )';

  // SQlStatement(this.sqlLibri);
}
