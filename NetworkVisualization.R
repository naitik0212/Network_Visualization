# Importing library
library(data.table)
library(magrittr)
library(igraph)
library(visNetwork)

# Importing Data
data <- fread("/Users/naitikshah/Desktop/DV/Assignment 3/Assignment3/assign3_email.csv", header = T, stringsAsFactors=FALSE)

# Making a directed graph
graph <- graph.data.frame(data, directed=FALSE, vertices = NULL)

# Removing multiple edges, by assigning weight as 1 to all edges.
E(graph)$w <- 1
graph <- simplify(graph, edge.attr.comb=list(w = "sum", function(x)length(x)))
# plot(graph)


networks <- clusters(as.undirected(graph))
V(graph)$network <- networks$membership
#plot(graph)


wc <- walktrap.community(graph)
plot(wc, graph)

clustered_g <- clusters(graph)
plot(clustered)

modularity(wc)
membership(wc)

fc<-fastgreedy.community(graph)
modularity(fc)
membership(fc)
plot(fc, graph)

centralization.degree(graph)
centralization.degree(graph)$centralization

centralization.betweenness (graph)

btw <- betweenness(graph) 
btw.score <- round(btw) + 1
btw.colors <- heat.colors(max(btw.score))
V(graph)$color <- btw.colors[ btw.score ] 
plot(graph ,vertex.label=V(graph)$label)

btw.colors <- rev(heat.colors(max(btw.score))) 

centralization.betweenness (graph)


nodes <- get.data.frame(graph, what="vertices")
dt <- data.table(merge(data, nodes, by.x=c("From"), by.y=c("name")))


nodes <- data.frame(id = nodes$name, title = nodes$name, group = nodes$network)
nodes <- nodes[order(nodes$id, decreasing = F),]

edges <- get.data.frame(graph, what="edges")[1:2]

visNetwork(nodes, edges, height = "700px", width = "100%") %>%
  #visNodes(scaling = list(min = 10, max = 30)) %>%
  visOptions(highlightNearest = list(enabled =TRUE), 
             nodesIdSelection = list(enabled = TRUE,
                                     style = 'width: 200px; height: 35px;
                                     background: #f8f8f8;
                                     color: darkblue;
                                     border:black;
                                     outline:black;')) %>%
  visLayout(randomSeed = 123)
