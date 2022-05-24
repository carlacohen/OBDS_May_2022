# Cheatsheet - `Seurat, part 1`

## Table of contents

<!-- 
Edit as needed when sections are created or renamed.
-->

- [Import data](#import-data)
- [Assay data](#assay-data)
- [Cell identities](#cell-identities)
- [Quality control](#quality-control)
- [Subsetting and combining](#subsetting-and-combining)
- [Transformations and normalisation](#transformations-and-normalisation)
- [Variable features](#variable-features)
- [Dimensionality reduction](#dimensionality-reduction)
- [Clustering](#clustering)
- [Markers](#markers)
- [Visualisations](#visualisations)
- [Miscellaneous](#miscellaneous)

## Import data


- `Read10X()`, imports data from a Cell Ranger output directory as a sparse matrix.
- `CreateSeuratObject()`, creates a Seurat from a matrix of UMI counts.

## Assay data

- `DefaultAssay()`, returns the name of the active assay, used by default if unspecified.
- `DefaultAssay(object) <- "name"`, replaces the name of the active assay.
- `Assays()`, returns the names of the assays available.
- `[[`, fetches one assay or one column of cell metadata, as a `data.frame`.
  + `object[[]]`, returns the entire `data.frame` of cell metadata.
- `FetchData()`, fetches multiple columns of cell metadata, feature data, and dimensionality reduction coordinates.
- `$`, fetches one column of cell metadata, as a `vector`.
- `GetAssayData()`, fetches one matrix from an assay.
- Mathematical operations: `colMeans()`, `colSums()`, `rowMeans()`, `rowSums()`.

## Cell identities

- `Idents()`, returns the vector of "active" identity for each cell.
- `Idents(object) <- "name"`, assigns the metadata column called `"name"` as the active identity.
- `SetIdent(object, cells = NULL, value)`, replaces the value of the active identity for a subset of cells.

## Quality control

- `PercentageFeatureSet()`, computes the fraction of reads assigned to a subset of genes, for each cell.

## Subsetting and combining

- `WhichCells()`, returns the names of cells that match a logical expression.
- `subset()`, returns a new Seurat object restricted to certain features and cells.
- `merge()`, combines the information from two Seurat objects into one.

## Transformations and normalisation

- `NormalizeData()`, provides a choice of standard normalisation strategies to normalise the data in a given assay.
- `SCTransform()`, normalises UMI count data using regularised negative binomial regression.
- `ScaleData()`, scales and centers features in an assay.

## Variable features

- `FindVariableFeatures()`, identifies features that are outliers on a "mean-variability plot".
- `VariableFeatures()`, returns the names of variable features for an assay.

## Dimensionality reduction

- `RunPCA()`, runs a PCA on an assay.
- `Reductions()`, returns the names of dimensionality reduction results available.

## Clustering

- `FindNeighbors()`, computes the nearest neighbors.
- `FindClusters()`, identify clusters of cells.
- `Graphs()`, returns the names of graphs available.

## Markers

- `FindAllMarkers()`, identifies differentially expressed genes for each of the identity classes.
- `FindMarkers()`, identifies differentially expressed genes for one or two identity classes.
- `FindConservedMarkers()`, identifies differentially expressed genes that are conserved between multiple groups of cells.

## Visualisations

- `VlnPlot()`, produces a violin plot for a selection of per-cell features.
- `FeatureScatter()`, produces a scatter plot of two per-cell features.
- `VariableFeaturePlot()`, produces a "mean-variance" scatter plot.
- `ElbowPlot()`, plots the amount of variance explained by principal components, to visually identify an elbow in the graph.
- `DimPlot()`, produces a scatterplot of two components from a dimensionality reduction result, colored by identity class or cell metadata.
- `PCAPlot()`, special case of `DimPlot()` for PCA results.
- `TSNEPlot()`, special case of `DimPlot()` for t-SNE results.
- `UMAPPlot()`, special case of `DimPlot()` for UMAP results.
- `FeaturePlot()`, special case of `DimPlot()` for coloring by feature data.
- `DoHeatmap()`, produces a feature-by-cell heatmap of scaled feature expression data.

## Miscellaneous

- `@`, fetches an internal slot by name (use with care!).

# Credits

- Kevin Rue-Albrecht