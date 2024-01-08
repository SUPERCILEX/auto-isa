#include <iostream>
#include <fstream>
#include <boost/graph/adjacency_list.hpp>
#include <boost/graph/breadth_first_search.hpp>

using namespace boost;

int main(int argc, char* argv[]) {
    if (argc != 4) {
        std::cerr << "Usage: " << argv[0] << " <file_path> <node_id1> <node_id2>" << std::endl;
        return 1;
    }

    std::string file_path = argv[1];
    std::string start_node_id = argv[2];
    std::string end_node_id = argv[3];

    // Define the graph type with strings for IDs
    typedef adjacency_list<vecS, vecS, directedS, property<vertex_index_t, size_t>, property<edge_index_t, std::string>> Graph;
    typedef graph_traits<Graph>::vertex_descriptor Vertex;

    // Create an instance of the graph
    Graph g;

    // Boost unordered_map to store the association between string IDs and vertices
    boost::unordered_map<std::string, Vertex> id_to_vertex;

    {
        // Set to store the added edges and check for duplicates
        boost::unordered_set<std::pair<Vertex, Vertex>> added_edges;

        // Open the text file
        std::ifstream infile(file_path);

        if (!infile) {
            std::cerr << "Error: Could not open file." << std::endl;
            return 1;
        }

        // Read the edge list from the file
        std::string from_id_str, to_id_str;
        while (infile >> from_id_str >> to_id_str) {
            // Add vertices and edges to the graph
            Vertex from_vertex, to_vertex;

            auto from_it = id_to_vertex.find(from_id_str);
            if (from_it == id_to_vertex.end()) {
                from_vertex = add_vertex(g);
                id_to_vertex[from_id_str] = from_vertex;
            } else {
                from_vertex = from_it->second;
            }

            auto to_it = id_to_vertex.find(to_id_str);
            if (to_it == id_to_vertex.end()) {
                to_vertex = add_vertex(g);
                id_to_vertex[to_id_str] = to_vertex;
            } else {
                to_vertex = to_it->second;
            }

            // Check for duplicate edges
            if (added_edges.find({from_vertex, to_vertex}) == added_edges.end()) {
                // Add the edge to the graph
                add_edge(from_vertex, to_vertex, g);
                added_edges.insert({from_vertex, to_vertex});
            }
        }
    }

    // Output the number of vertices and edges in the graph
    std::cout << "Number of vertices: " << num_vertices(g) << std::endl;
    std::cout << "Number of edges: " << num_edges(g) << std::endl;
    std::cout << std::endl;

    {
        // Find the vertex descriptors for the specified node IDs
        auto start_vertex_it = id_to_vertex.find(start_node_id);
        auto end_vertex_it = id_to_vertex.find(end_node_id);

        if (start_vertex_it != id_to_vertex.end() && end_vertex_it != id_to_vertex.end()) {
            Vertex start_vertex = start_vertex_it->second;
            Vertex end_vertex = end_vertex_it->second;

            // Perform BFS from start_node_id to end_node_id
            std::vector<int> distances(num_vertices(g), 0);
            breadth_first_search(g, start_vertex,
                visitor(make_bfs_visitor(record_distances(&distances[0], on_tree_edge{}))));

            // Output BFS distance from start_node_id to end_node_id
            std::cout << "BFS Distance from node " << start_node_id << " to node " << end_node_id << ": "
                      << distances[end_vertex] << std::endl;
        } else {
            std::cerr << "One or both of the specified nodes not found in the graph." << std::endl;
        }
        std::cout << std::endl;
    }

    return 0;
}
