#include "graph.hpp"

void Graph::add_edge(int vertexID1,int vertexID1,int cost){
    
    Edge e{vertexID1,vertexID1,cost};

    edges.push_back(e);
    outbound[e.beg].push_back(e);
    inbound[e.end].push_back(e);
}
void Graph::add_vertex(int vertexID,int vertexName){
    vertices.push_back(vertex(vertexID,vertexName));

}