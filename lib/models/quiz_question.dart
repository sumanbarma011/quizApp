class QuizQuestion{
  const QuizQuestion({required this.text,required this.answer});
  final  String text;
  final List<String> answer;
  List <String> getShuffledAnswer(){
    final  shuffledAns=List.of(answer);
    shuffledAns.shuffle();
    return shuffledAns;
  }
}