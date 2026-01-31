package com.example.demo.service;

import com.example.demo.model.Book;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Service
public class BookService {

    private List<Book> books = new ArrayList<>();

    // Constructor: thêm dữ liệu mẫu
    public BookService() {
        books.add(new Book(1, "Java Basics", "Nguyen Van A"));
        books.add(new Book(2, "Spring Boot", "Tran Van B"));
    }

    // GET all
    public List<Book> getAllBooks() {
        return books;
    }

    // GET by id
    public Book getBookById(Integer id) {
        return books.stream()
                .filter(book -> Objects.equals(book.getId(), id))
                .findFirst()
                .orElse(null);
    }

    // POST
    public void addBook(Book book) {
        books.add(book);
    }

    // PUT
    public void updateBook(Integer id, Book updatedBook) {
        books.stream()
                .filter(book -> Objects.equals(book.getId(), id))
                .findFirst()
                .ifPresent(book -> {
                    book.setTitle(updatedBook.getTitle());
                    book.setAuthor(updatedBook.getAuthor());
                });
    }

    // DELETE
    public void deleteBook(Integer id) {
        books.removeIf(book -> Objects.equals(book.getId(), id));
    }
}
