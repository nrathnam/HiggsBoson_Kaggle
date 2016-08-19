# nycdsa-kaggle-project
Machine Learning Kaggle Competition for NYC DSA Project<br>
Higgs Boson Challenge

Due August 21:<br><br>
  
  <strong>Entire Team:</strong><br> 
    * Perform all single basic algorithms + determine what features to use + document all AMS scores<br>
    * Start documenting and sending me your materials for slides (in PPT is ok)<br>
    * When you're writing code, fork your own first, then after full unit test, merge into higgs_adv_new.py<br>
    * Be sure to write code that is self-contained so you do not affect other functions within the entire source file<br>
    * stretch goal: create and perform ensemble train/validate/testing pipeline<br><br>

  <strong>Deepak:</strong><br>
    * Featurre analysis - find what predictors have multicollinearity and analyze what can be dropped<br>
    * Investigate if features can be dropped based on a mutated new fields using Particile Physics formulas<br>
    * Determine what rows/observations can be dropped on missingness impact (if at all)<br>
    * Use R or Phython to create visualizations on feature analysis and engineering<br>

  <strong>Nanda:</strong><br>
    * Help Venkat on the Model Ensemble pipeline<br>
    * Perform SVM, and Boosting algorithm (varying 6 imputter, 2 scaler, 2 pca, n thresholds)<br>
    * Perform XGBoost algorithm (varying 6 imputter, 2 scaler, 2 pca, n thresholds)<br>

  <strong>Venkat:</strong><br>
    * Enhance code to extend imputter to include K-Nearest Neighbors<br>
    * Start writing framework pipeline code for the Model Ensemble<br>
  
  <strong>Bernard:</strong><br>
    * Create AMS reporting sheet for all parameter combinations<br>
    * Enhance code to extend sklearn imputter to include "median" and "most_frequent" strategies<br>
    * Enhance code to run as a batch using command line params (higgs_adv_batch.py)<br>
    * Start compiling and preparing presentation slides<br>
    * Implement and test feasibility of using deep learning algorithm using Theano/Pylearn2<br>

<strong>Team Demibots Members:</strong><br>
<ul>
  <li>Bernard</li>
  <li>Deepak</li>
  <li>Nanda</li>
  <li>Venkat</li>
</ul>
<br>

Baseline Source code for reference:<br>
http://www.johnwittenauer.net/lessons-learned-from-the-higgs-boson-kaggle-challenge/
