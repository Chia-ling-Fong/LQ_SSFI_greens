library(openxlsx)
library(cluster)
library(ggplot2)
library(dendextend)

# Step 1: Check DATASET SSFI_XLQ
SSFI_XLQ<-read.xlsx("SSFI_XLQ.xlsx") 
SSFI_matrix <- as.matrix(na.omit(SSFI_XLQ$XLQ))

# Step 2: Compute distance matrix
dist_matrix <- dist(SSFI_matrix, method = "euclidean")

# Step 3: Run AHC using Ward.D2
ahc_result <- hclust(dist_matrix, method = "ward.D2")

# Step 4: Plot dendrogram
plot(ahc_result, main = "AHC Dendrogram (Ward.D2 + Euclidean)",
     xlab = "Turtles", ylab = "Dissimilarity")

# Step 5: Compute Cophenetic Correlation Coefficient (CPCC)
cpcc <- cor(cophenetic(ahc_result), dist_matrix)
cat("Cophenetic Correlation Coefficient (CPCC):", round(cpcc, 4), "\n")

# Set k range
k_values <- 2:10
silhouette_scores <- numeric(length(k_values))

# Loop through k and calculate mean silhouette score
for (i in seq_along(k_values)) {
  k <- k_values[i]
  clusters <- cutree(ahc_result, k = k)
  sil <- silhouette(clusters, dist_matrix)
  silhouette_scores[i] <- mean(sil[, 3])
}

plot(k_values, silhouette_scores, type = "b", pch = 16, col = "blue",
     xlab = "Number of Clusters (k)", ylab = "Mean Silhouette Score",
     main = "Silhouette Analysis for Optimal k")

# Add Cluster Number to Data
k <- 2  # best k
clusters <- cutree(ahc_result, k = k)
SSFI_XLQ$Cluster <- clusters
write.xlsx(SSFI_XLQ, file = "SSFI_XLQ_with_clusters_k2.xlsx", rowNames = FALSE)

# Calculate silhouette scores
sil <- silhouette(clusters, dist_matrix)


