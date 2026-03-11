#include "FixedCapBiMap.h"
#include "FixedCapBiMapIterator.h"
#include <stdexcept>
#include <utility>

FixedCapBiMap::FixedCapBiMap(int capacity) {
    // TODO - Implementation

    if (capacity <= 0)
        throw std::range_error("Invalid number (less than or equla to 0)");
    length = 0;
    maxLength = capacity;
    data = new TElem[capacity];
}

FixedCapBiMap::~FixedCapBiMap() {
    // TODO - Implementation
    delete[] data;
}
bool FixedCapBiMap::add(TKey c, TValue v) {

    if (isFull()) {
        throw std::range_error("the container is full");
    }
    ValuePair search_entry = search(c);

    if (search_entry.first != NULL_TVALUE &&
        search_entry.second != NULL_TVALUE) {
        return false;
    }

    data[length] = TElem(c, v);
    length++;

    return true;
}

ValuePair FixedCapBiMap::search(TKey c) const {
    TElem result = TElem{NULL_TVALUE, NULL_TVALUE};
    int nrfound = 0;
    for (int i = 0; i < length; i++) {
        if (data[i].first == c) { // found key
            {
                if (nrfound == 0) {
                    result.first = data[i].second;
                } else {
                    result.second = data[i].second;
                }
                nrfound++;
            }
        }
    }

    return result;
}

bool FixedCapBiMap::remove(TKey c, TValue v) {
    // TODO - Implementation
    auto search_entry = search(c);
    if (search_entry.first == NULL_TVALUE &&
        search_entry.second == NULL_TVALUE) {
        return false;
    }
    bool found = false;
    for (int i = 0; i < length; i++) {
        if (data[i].first == c && data[i].second == v) {
            found = true;
			length--;
        }
        if (found) {
            data[i] = data[i + 1];
        }
    }
    
    return found;
}

int FixedCapBiMap::size() const {
    // TODO - Implementation
    return length;
}

bool FixedCapBiMap::isEmpty() const {
    if (length == 0) {
        return true;
    } else
        return false;
}

bool FixedCapBiMap::isFull() const {
    // TODO - Implementation
    if (length == maxLength) {
        return true;
    }

    return false;
}

FixedCapBiMapIterator FixedCapBiMap::iterator() const {
    return FixedCapBiMapIterator(*this);
}
