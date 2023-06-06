import 'package:flutter/material.dart';
import 'dart:convert';

class Book {
  String name = '';
  String image = '';
  double rate = 0;
  int value = 0;
  String? description = '';
  bool Ebook = false;

  Book(this.name, this.image, this.value, this.Ebook);
}

Book b1984 = new Book('1984', 'images/1984.jpg', 150000, false);
Book reasonWhy =
    new Book('13 reasons why', 'images/13-reasons-why.jpg', 180000, false);
Book dracula = new Book('Dracula', 'images/dracula.jpg', 130000, false);
Book invisible =
    new Book('Invisible man', 'images/Invisible-Man.jpg', 110000, false);
Book harryPotter =
    new Book('Harry potter', 'images/harry-potter.jpg', 200000, false);
Book years100 = new Book('One hundred years\n of solitude',
    'images/One-Hundred-Years-of-Solitude.jpg', 150000, false);
Book killMina = new Book('To kill a mockingbird',
    'images/To-Kill-a-Mockingbird-many-1961.jpg.webp', 110000, false);

var books = [
  b1984,
  reasonWhy,
  dracula,
  invisible,
  harryPotter,
  years100,
  killMina
];
