#pragma once

#include <iterator>

class FibIterator
{
private:
    size_t a = 0;
    size_t b = 1;
    size_t nextTerm = 0;

    int value_;
    class intholder
    {
        int value_;
    public:
        intholder(int value): value_(value) {}
        int operator*() { return value_; }
    };
public:
    // Previously provided by std::iterator - see update below
    typedef int                     value_type;
    typedef std::ptrdiff_t          difference_type;
    typedef int*                    pointer;
    typedef int&                    reference;
    typedef std::input_iterator_tag iterator_category;

    explicit FibIterator(){}
    int operator*() const { return value_; }
    bool operator==(const FibIterator& other) const { return value_ == other.value_; }
    bool operator!=(const FibIterator& other) const { return !(*this == other); }
    intholder operator++(int)
    {
        intholder ret(value_);
        ++*this;
        return ret;
    }
    myit& operator++()
    {
        ++value_;
        return *this;
    }
};
