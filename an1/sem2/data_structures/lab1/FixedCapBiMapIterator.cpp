#include "FixedCapBiMapIterator.h"
#include "FixedCapBiMap.h"
#include <exception>
#include <stdexcept>

using namespace std;

FixedCapBiMapIterator::FixedCapBiMapIterator(const FixedCapBiMap &d) : map(d) {
    // TODO - Implementation
    currentPosition = 0;
}

void FixedCapBiMapIterator::first() {
    // TODO - Implementation
    currentPosition = 0;
}

void FixedCapBiMapIterator::next() {
    // TODO - Implementation
    if (valid()) {
        currentPosition++;
    } else {
		throw std::out_of_range("reached the end");
    }
}

TElem FixedCapBiMapIterator::getCurrent() {
    // TODO - Implementation
    if (valid()) {
        return map.data[currentPosition];
    } else {
        throw std::out_of_range("reached the end");
    }
}

bool FixedCapBiMapIterator::valid() const {
    // TODO - Implementation
    if (currentPosition >= map.size()) {
        return false;
    }
    return true;
}
