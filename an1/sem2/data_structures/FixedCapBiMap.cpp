#include "FixedCapBiMap.h"
#include "FixedCapBiMapIterator.h"
#include <stdexcept>

FixedCapBiMap::FixedCapBiMap(int capacity) {
	//TODO - Implementation
	
	if (capacity <=0)
	throw new std::exception("Invalid number (less than or equla to 0)");
	
	maxLength=capacity;
	data=new TElem[capacity];
	 
}

FixedCapBiMap::~FixedCapBiMap() {
	//TODO - Implementation
	delete data;

}

bool FixedCapBiMap::add(TKey c, TValue v){

	if (isFull()){
		throw std::exception("the array is full");
	}
	auto search_entry=search(c);
	
	if(search_entry.first != NULL_TVALUE && search_entry.second != NULL_TVALUE){
		throw std::exception();
	}

	data[length]=TElem(c,v);
	length++;

	return true;
}

ValuePair FixedCapBiMap::search(TKey c) const{
	//TODO - Implementation
	return std::pair<TValue, TValue>(NULL_TVALUE, NULL_TVALUE);
}

bool FixedCapBiMap::remove(TKey c, TValue v){
	//TODO - Implementation
	auto search_entry=search(c);
	if(search_entry.first == NULL_TVALUE && search_entry.second == NULL_TVALUE){
		return false;
	}
	bool found=false;
	for(int i=0;i<length;i++){
		if (data[i].first==c && data[i].second==v){
			found=true;
		}
		if(found){
			data[i]=data[i+1];
		}
	}
	length--;
	return true;
}


int FixedCapBiMap::size() const {
	//TODO - Implementation
	return length;
}

bool FixedCapBiMap::isEmpty() const{
	if (length==0){
			return true;
		}
	else
		return false;
}

bool FixedCapBiMap::isFull() const {
	//TODO - Implementation
	if (length==maxLength){
		return true;
	}
	return false;
}

FixedCapBiMapIterator FixedCapBiMap::iterator() const {
	return FixedCapBiMapIterator(*this);
}



