import 'package:dio/dio.dart';
import 'package:prueba_final_flutter/model/product_model.dart';

class FirebaseService {
  final Dio _dio = Dio();
  final String _baseUrl =
      'https://prueba-flutter-ebook-default-rtdb.firebaseio.com';

  // Crear un nuevo libro
  Future<void> addBook(ProductModel book) async {
    try {
      await _dio.post('$_baseUrl/books.json', data: book.toJson());
    } catch (e) {
      print('Error adding book: $e');
    }
  }

  // Leer todos los libros
  Future<List<ProductModel>> getBooks() async {
    try {
      final response = await _dio.get('$_baseUrl/books.json');
      if (response.data != null) {
        final data = response.data as Map<String, dynamic>;
        return data.entries.map((e) => ProductModel.fromJson(e.value)).toList();
      }
      return [];
    } catch (e) {
      print('Error getting books: $e');
      return [];
    }
  }

  // Actualizar un libro existente
  Future<void> updateBook(String bookId, ProductModel updatedBook) async {
    try {
      await _dio.put('$_baseUrl/books/$bookId.json',
          data: updatedBook.toJson());
    } catch (e) {
      print('Error updating book: $e');
    }
  }

  // Eliminar un libro
  Future<void> deleteBook(String bookId) async {
    try {
      await _dio.delete('$_baseUrl/books/$bookId.json');
    } catch (e) {
      print('Error deleting book: $e');
    }
  }
}
