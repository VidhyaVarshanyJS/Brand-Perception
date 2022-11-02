# TECH GADGETS BRAND ANALYSIS

This project aims to analyze and discover the common standard features shared by various tech gadgets from various brands that help the brand stand out in the market.

## DATASET :

Different brands of tech gadgets with various features are chosen for analysis and collected via typeform - `129(Respondents)`
  
**Gadgets names** – Smartphone, Mouse Keyboard, Headphone  Camera and Laptop

## Data Collection

- The collected datas are then separated based on different gadgets namely Camera , Headphones , Keyboard , Mouse and Smart Phone
- The 5 point scale gadgets specfic Feature questions  are alone extracted and kept in a csv file

## Problem Analysis

Each of the technological gadgets is available in a variety of brands. In this modern era, it is difficult to determine which brand a customer should purchase based on their preferences, so clustering analysis and PCA analysis are used to classify the brand based on the characteristics and standard features shared by each brand.

## Gadget taken for further analysis - `Smartphone`

Smartphone brand data is analyzed and clustered based on feature similarities, and the most important features that contribute the most to the brand are identified using dimensionality reduction using PCA.


## METHODOLOGY USED
- Clustering Analysis using K- Means Algorithm - -  data classification based on characteristic similarity
- Principle Component Analysis - to identify the variables that have the greatest impact on all brands
   
## SOFTWARE USED
- Data Collection - Typeform
- Data Analysis - R- Studio


## Interpretation

- The variables Performance, Quality, and Design contribute the most to the PC1 component, while Price and Performance contribute the most to the PC2 component. This means that the greater the contribution value, the more the variable contributes to the component.

- the variables `Get. Used to. Habit, Brand` contributes more to the cluster 1 
`Services, Reputation, Value, and Quality` contribute more to the cluster 2
`Operating Platform/System, Design, Performance, and Price` contribute more to the cluster 3

### Brand Inference

When comparing the clusters with the brands, the above characteristic best fits the top three brands, namely `Samsung, Xiaomi, and Apple` and we can say that customers buys smartphones from these brands based on the characteristic depicted by each of the three clusters regarding the variables.

For example :
The person who seeks for best design, price, and performance can buy Apple Smartphones
The person who is Brand-specific will buy Samsung smartphones
The person who strives for the best Quality goes for Xiaomi smartphones

## Overall view form the survey report and Analysis

The above clustering analysis creates clusters based on customers' preferences for brands, and through PCA analysis, the features that contribute the most to each brand of smartphone are identified and validated with the clusters, making it easier for consumers to select brands based on their preferences. For each brand, the output is verified and compared with survey respondents. The techniques described above can also be applied to other types of technology to determine brand categorization based on features.
•	Smartphone - Samsung
•	Mouse - Logitech
•	Headphone - Oneplus
•	Camera – Canon
•	Keyboard  - Apple
•	Laptop - HP

![image](https://user-images.githubusercontent.com/76642252/199512375-050234c7-c621-4ec9-93b0-dbf80ce3b3fc.png)



## Reference 
[Brand-Perception.pdf](https://github.com/VidhyaVarshanyJS/Brand-Perception/blob/8dee06d62b966a881277288a524b95784cd92479/Project%20Documentation.pdf)


