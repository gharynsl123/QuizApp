import 'package:aplikasi_quiz/question.dart';

class QuestionLogic {
  int _questionNumber = 0;


  List<Question> _questionList = [
    Question("Makanan Dan Minum Tanpa Mengucapkan Basmallah", false),
    Question("Jin Lebih Tinggi Derajatnya Dari Pada Manusia", false),
    Question("Masuk Kedalam Kamar Mandi Dengan Kaki Kiri", true),
    Question("Makanlah Yang Paling Dekat Dengan Kalian", true),
    Question("Menyakiti Orang Lain Itu Tak boleh Kecuali Terpaksa", false),
    Question("Tidak Usah Meminta Maaf Jika Kita Bersalah", false),
    Question("Kita Tidak Boleh Boros Air Ketika Kita Memakainya", true),
    Question("Harus Membaca Do'a Sebelum Masuk Kamar Mandi", true),
    Question("Kita Harus Memaksa Jika Kita Ingin Sesuatu", false),
    Question("Harus Menuruti Kata Kata Kedua Orang Tua Kita", true),
    Question("Membantu Orang Tua Kita Adalah Hal Yang Baik", true),
    Question("Mencela Orang Lain Adalah Hal Yang Di Sukai Orang Lain", false),
  ];
  String getQuestion() => _questionList[_questionNumber].question;

  int getTotalQuestionText() => _questionList.length;

  int getQuestionNumberText() => _questionNumber + 1;

  bool getCorrectAnswer() =>
      _questionList[_questionNumber].answer;

  void nextQuestion() {
    if (_questionNumber < _questionList.length - 1) {
      _questionNumber++;
      print(_questionNumber);
    }
  }

  bool isFinished() {
    if (_questionNumber >= _questionList.length - 1){
      return true;
    }else{
      return false;
    }
  }
  void resetQuestion() => _questionNumber = 0;
}
