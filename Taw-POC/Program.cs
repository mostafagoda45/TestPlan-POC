using Taw_POC;

Console.Write("Please enter first number: ");
int a = int.Parse(Console.ReadLine());

Console.Write("Please enter Second number: ");
int b = int.Parse(Console.ReadLine());

var calculator = new Calculator();
Console.WriteLine($"Result = {calculator.Add(a, b)}");