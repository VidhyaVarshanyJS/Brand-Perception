# Clustering for each of the Tech Gadgets
library("factoextra")
library("NbClust")
library("dplyr")
library("cluster")
library(ggbiplot)
library("rstatix")
library("FactoMineR")
library(parameters)

smartphone <-
  read.table(
    file = "D:/Files/CIT/M.Sc.DCS/4th Semester/17MDC46 - PA Lab/PA Sem IV project/smartphone.csv",
    sep = ",",
    dec = ".",
    header = TRUE,
  )

sm =  smartphone[2:11]
#preprocessing the data by replacing the NA values with zero
sm[is.na(sm)] = 0
# sm =  scale(sm)
sm

#Elbow method
fviz_nbclust(sm, kmeans, method = "wss") +
  geom_vline(xintercept = 4, linetype = 2) +
  labs(subtitle = "Elbow method")

#silhouette method

fviz_nbclust(sm, kmeans , method = "silhouette")

#gap statistics method

gap_stat = clusGap(
  sm ,
  FUN = kmeans ,
  nstart = 25 ,
  K.max = 10 ,
  B = 50
)
fviz_gap_stat(gap_stat)

# Consensus Based Algorithm

clust <- n_clusters(
  sm,
  package = c("easystats", "NbClust", "mclust"),
  standardize = TRUE,
  fast = TRUE,
  nbclust_method = "kmeans"
)
clust
plot(clust)


# Elbow Method - 4 , silhouette = 7 , gap statistic - 9 , Consense based algorithm -3

smart_result_e = kmeans(sm , 4 , nstart = 25)
smart_result_e

fviz_cluster(
  smart_result_e,
  data = sm,
  palette = c("#2E9FDF", "#00AFBB", "#E7B800", "violet"),
  geom = "point",
  ellipse.type = "convex",
  ggtheme = theme_bw()
)
# silhoutte = 7
smart_result_s = kmeans(sm , 7)
smart_result_s

fviz_cluster(
  smart_result_s,
  data = sm,
  palette = c(
    "#2E9FDF",
    "#00AFBB",
    "#E7B800" ,
    "violet",
    "red",
    "pink",
    "green"
  ),
  geom = "point",
  ellipse.type = "convex",
  ggtheme = theme_bw()
)



# gap statistic - 9
smart_result_g = kmeans(sm , 9)
smart_result_g


fviz_cluster(
  smart_result_g,
  data = sm,
  palette = c(
    "#2E9FDF",
    "#00AFBB",
    "#E7B800" ,
    "violet",
    "red",
    "pink",
    "green",
    "brown",
    "yellow"
  ),
  geom = "point",
  ellipse.type = "convex",
  ggtheme = theme_bw()
)

# Final Optimal Cluster  #Consense based algorithm  is taken with the optimal clusters of 3

optimal_cluster = kmeans(sm , 3 , nstart = 25)
optimal_cluster



fviz_cluster(
  optimal_cluster,
  data = sm,
  palette = c("#2E9FDF",
              "#00AFBB",
              "#E7B800"),
  geom = "point",
  ellipse.type = "convex",
  ggtheme = theme_bw()
)

#quality of k-means partition
BSS = optimal_cluster$betweenss
TSS = optimal_cluster$totss
# We calculate the quality of the partition
BSS / TSS * 100

# Slihoutte value

km_res <- kmeans(sm, centers = 3, nstart = 25)

sil <- silhouette(km_res$cluster, dist(sm))
fviz_silhouette(sil)




#Principle Component analysis

res.pca = PCA(sm)
res.pca

#Extract and visualize the eigen values
get_eig(res.pca)

#Visualize the eigen values/variances
fviz_screeplot(res.pca , addlabels = TRUE, ylim = c(0, 50))

# Extract the results from the variables
var =  get_pca_var(res.pca)
var

#Coordinates of variables
head(var$coord)

#Contribution of variables
head(var$contrib)

sm.pca <- prcomp(sm, center = TRUE, scale. = TRUE)
summary(sm.pca)

# Contribution of the variasbles with the
res.km <- kmeans(var$coord, centers = 3, nstart = 25)
grp <- as.factor(res.km$cluster)
# Color variables by groups
fviz_pca_var(res.pca, col.var = grp, 
             palette = c("#0073C2FF", "#EFC000FF", "#868686FF"),
             legend.title = "Cluster",addEllipses = TRUE ,repel = TRUE)

ggbiplot(
  sm.pca,
  ellipse = TRUE,
  obs.scale = 1,
  var.scale = 1,
  var.axes = T,
  groups = smartphone$Smartphone
) + theme_minimal()
