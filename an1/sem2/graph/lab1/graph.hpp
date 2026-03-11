#pragma once

#include <iterator>
#include <list>
#include <map>
#include <utility>
#include <vector>
#include <unordered_map>
class Graph {
   

  public:
    int getVertexNumber() { return vertecies.size(); };
    int getEdgesNumber() { return nrEdges; };

    void add_vertex(int vertexName);
    void remove_vertex(int vertexName);

    void add_edge(int source, int target);
    void remove_edge(int source,int target ,int cost);
    void add_edge_cost(int source,int target,int cost);
    bool isVertex(int id);

    auto beginVert(){return vertecies.begin();}//iterator for vertices

  private:
    int nrEdges;

 /*   struct Edge {
        int source;
        int target;
        int cost;
    };
*/
    std::vector<int> vertecies;      // 
    std::unordered_map<int, std::vector<int>> outEdges; //  vertex -> indices in edges
    std::unordered_map<int, std::vector<int>> inEdges;  //  vertex -> indices in edges
    std::unordered_map<std::pair<int, int>,int> edgeMap; //the pair is the in,out vertices and the int is the cost 
};