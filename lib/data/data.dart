import 'package:prueba_final_flutter/model/product_model.dart';

class LocalDataService {
  static List<ProductModel> _books = [];

  // Inicializar datos locales desde el servidor
  static void initializeFromServer(List<ProductModel> serverBooks) {
    _books = List.from(serverBooks);
  }

  // Obtener todos los libros locales
  static List<ProductModel> getBooks() {
    return List.from(_books);
  }

  // Agregar libro localmente
  static void addBook(ProductModel book) {
    _books.add(book);
  }

  // Actualizar libro localmente
  static void updateBook(ProductModel updatedBook) {
    final index = _books.indexWhere((book) => book.id == updatedBook.id);
    if (index != -1) {
      _books[index] = updatedBook;
    }
  }

  static void deleteBook(ProductModel book) {
    _books.removeWhere((b) => b.id == book.id);
  }
}
