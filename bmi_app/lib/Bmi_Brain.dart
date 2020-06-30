import 'dart:math';

class CalculatorBrain
{
  CalculatorBrain({this.height,this.weight});
  final int height;
  final int weight;
  double bmi;
  String Calculate()
  {

    bmi= weight/pow(height/100, 2);
    return bmi.toStringAsFixed(2);
  }

  String getResult()
  {
    if(bmi>25)
      {
        return 'Overweight';
      }
    else if (bmi>18.50)
      {
        return 'Normal';
      }
    else
      {
        return 'Underweight';
      }
  }

  String getinterpret()
  {
    if(bmi>25)
    {
      return 'Exercise more';
    }
    else if (bmi>18.50)
    {
      return 'Shabaaaaash';
    }
    else
    {
      return 'Thoda aur kha lukde pehelwan';
    }
  }
}
