using Taw_POC;

namespace UnitTest
{
    public class Tests
    {
        private Calculator _calculator;
        
        [SetUp]
        public void Setup()
        {
            _calculator = new Calculator();
        }

        [Test]
        public void CalcultorAdd_Return_True()
        {
            var result = _calculator.Add(3, 4);

            Assert.That(result, Is.EqualTo(7));
        }

        [Test]
        public void CalcultorAdd_Return_False()
        {
            var result = _calculator.Add(3, 4);

            Assert.That(result, Is.EqualTo(9));
        }
    }
}