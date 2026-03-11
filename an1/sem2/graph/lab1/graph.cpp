
#include "graph.hpp"
#include <cstdio>
#include <stdexcept>
#include <vector>
void Graph::add_vertex(int vertexName) {
    if (isVertex(vertexName)) {
        perror("the number is already inside");
        return;
    }
    vertecies.push_back(vertexName);
    outEdges[vertexName] = {};
    inEdges[vertexName] = {};
}

void Graph::remove_vertex(int vertexName) {
    if (!isVertex(vertexName)) {
        perror("the number is not inside");
        return;
    }
    int i;
    for (i = 0; i < getVertexNumber(); i++) {
        if (vertecies[i] == vertexName) {
            break;
        }
    }
    vertecies.erase(vertecies.begin() + i);
    inEdges.erase(vertexName);
    outEdges.erase(vertexName);
}

void Graph::add_edge(int source, int target) {
    int exists=0;
    for(int vert :vertecies){
        if(vert==source){
            exists++;
        }
        if(vert==target){
            exists++;
        }
        if (vert!=2){

        }
    }
    inEdges[target].push_back(source);
    outEdges[source].push_back(target);
    edgeMap[{source, target}] = 0;
}

void Graph::add_edge_cost(int source, int target, int cost) {
    if (edgeMap.find({source,target})==edgeMap.end()){
        throw std::invalid_argument("the source and target vertices do not exist");
    }
    edgeMap[{source, target}] = cost;
}
bool Graph::isVertex(int vertexID) {
    for (int i = 0; i < getVertexNumber(); i++) {
        if (vertecies[i] == vertexID)
            return true;
    }
    return false;
}
