# CatsVsDogs

This is a first attempt to build an image classifier of cats vs. dogs.  

1.	I downloaded a dataset from a previous competition on Kaggle.org of 25000 images of cats and dogs (https://www.kaggle.com/c/dogs-vs-cats) and chose 2000 at random (1000 dogs and 1000 cats) as my dataset.  

2.	The images were different sizes; thus, I resized and cropped all the images to 300 x 300 pixels (image_process_cat.R, image_process_dog.R). 

3.	I performed a PCA on the images (pca2.tot) and chose the first 600 components, which explained 99% of the variance (disp_variance.R) for dimensionality reduction (reduce_data.R).  As a first pass, I performed a logistic regression upon the dimensionally reduced dataset (70% training, 30% test) to classify cats vs. dogs (logistic.R). 

The accuracy of the classification was just above chance, about 53%.  The images had not been centered upon the cat or dog, and also were not filtered for other objects in the image, such as people interacting with the animals. Thus, the poor performance of the logistic regression was not surprising.  Clearly other algorithms would be expected to do better, such as a neural network.  
disp_component.R: To see the spatial profile of a single component from PCA. 
