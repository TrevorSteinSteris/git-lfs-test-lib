#ifndef TESTCLASS_HPP
#define TESTCLASS_HPP

class TestClass
{
    public:
        TestClass() = default;
        ~TestClass() = default;
        TestClass( const TestClass & ) = default;
        TestClass( TestClass && ) = default;
        TestClass &operator=( const TestClass & ) = default;
        TestClass &operator=( TestClass && ) = default;

        void print();
        void printV2();
};

#endif // TESTCLASS_HPP