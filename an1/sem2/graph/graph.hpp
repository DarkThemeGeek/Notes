#pragma once

#include<map>
#include<list>
#include <vector>


class Graph{
struct vertex
{
   int id;
   int name;
};
public:

int getVertexNumber(){return nrVertex;};
bool isEdge(vertex vertexName1,vertex vertexName2);


void add_edge(int vertexID1,int vertexID2 ,int cost);
void add_vertex(vertex vertex);
void delete_vertex(vertex vertexName);
void list_vertices(vertex vertexName);


private:
int nrVertex;
int neEdges;

struct Edge{
    int beg;
    int end;
    int cost;
    long long id;
};



//storing as vertex name and vertex id
std::list<vertex> vertices;

std::vector<Edge>edges;
//storing as vertex id and outgoing edges list
std::vector<std::vector<Edge>>outbound;
std::vector<std::vector<Edge>>inbound;



};
