# Network_Visualization
Network Visualization using R (iGraph and VisNetwork) and comparing it with Gephi.

The dataset provided is of Email list in the course Data Visualization for the month of February. Prior to importing dataset in the Gephi, need to change the column names to Source and Target in the original dataset so that Gephi is able to read the dataset correctly using import as edge list. 

The modularity gives the number of subnetworks within the network. In this dataset, there are 2 communities present with the below described values.
The parameters used for running modularity included: 
"	Resolution:  0.4, Randomize: On, Use edge weights: On
Results:
"	Modularity: 0.060
"	Number of Communities: 2 
The labels have been color coded using Red and Black based on the modularity class, that is the community to which it belongs.

Average Degree Centrality: 
The number of email interactions with any user in the community is defined by the average degree centrality. In the provided dataset, average degree centrality is 1.84, denoting that each person in this email network has interacted 1.84 times with someone in the network on an average.

Average Betweenness Centrality: 
The number of times node appear on the shortest path between the nodes in the email network is defined using average betweenness centrality. The value of average betweeness is 17.76 which gives the average of all betweenness centrality. Though, the dataset is heavily skewed towards two nodes.

Average Eigenvector Centrality:
Eigen Vector centrality denotes how much a node is important in the network based on the node connections. In the given network Average Eigenvector Centrality is 0.215. Dr. Sharon is the most important node of the network while Yihan is the second most important node, which justifies the definition based on high number of communication between professor, TA and students.

Layout Algorithm: 
I network visualization uses the Force Atlas algorithm which is a force directed algorithm having complexity is O(n^2). Various algorithms like Fruchterman-Reingold and Force Atlas 2 were tried out, before finalizing Force Atlas, as it gave a easy to represent and user-friendly network visualization. Default parameters along with Repulsion factor as 50000 and attraction strength 1 is used. Dr. Sharon is the most important node in the network followed by Yihan. The nodes have been color coded using the Eigenvector centrality where the darker shade denotes the higher value of eigenvector centrality. Also the sizes of the nodes are based on Eigenvector centrality. The min size is 20 and max size is 150. The min and max sizes are selected such that each node shows the required importance in the network. Finally, the modularity class is selected as the ranking parameter to color code the labels which  distinctly shows the 2 communities in the email network of CSE 572: Data Visualization.
