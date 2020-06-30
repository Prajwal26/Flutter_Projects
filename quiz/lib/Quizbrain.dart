import 'Questions.dart';
class Quizbrain
{

  int _questionNumber=0;

  List<Questions> _questionbank=[
    Questions (q:  'Pranjal abhi padhrhi hai.', a:true),
    Questions (q:  'Prasoon is Rishika;s friend.', a:true),
    Questions (q:  'Priyansha likes Pradeep', a:true),
    Questions (q:  'Shrikant likes aish.', a:false),
    Questions (q:  'Jain are mc.', a:true),
    Questions (q:  'Rishikas fav 171', a:false),
    Questions (q:  'Apun hi bhagwan hai.', a:false),

  ];

  void nextquestion()
  {
    if(_questionNumber < _questionbank.length-1)
      {
        _questionNumber++;
      }


  }
  String getquestion()
  {
    return _questionbank[_questionNumber].Quest;
  }
  bool getanswers()
  {
    return _questionbank[_questionNumber].Ans;
  }

  bool isFinished()
  {
    if(_questionNumber >= _questionbank.length - 1)
    {
      return true;
    }
    else{
      return false;
    }
  }
  void reset()
  {
    _questionNumber=0;
  }
}
