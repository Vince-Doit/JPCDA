# JPCDA
Joint Principal Component and Discriminant Analysis for Dimensionality Reduction

This repo hosts the code for paper "Joint Principal Component and Discriminant Analysis for Dimensionality Reduction, in TNNLS-2020".

The proposed method addresses the limitation of the two-step feature extraction, which may fail to obtain the most discriminant information for classification tasks. Unlike traditional approaches that perform PCA and LDA sequentially, we introduce a novel method called joint principal component and discriminant analysis (JPCDA) for dimensionality reduction. With JPCDA, we can effectively avoid the small sample size problem while simultaneously extracting discriminant information that is crucial for classification tasks.

The repo also hosts some baseline systems as we compared in the paper. We would like to thank the authors of the baseline systems for their codes. If any baseline systems cannot be licensed freely here, please drop me an email, so we can remove it from the collection.

If you find this repo useful, please kindly cite the paper below.

@article{zhao2019joint,
  title={Joint principal component and discriminant analysis for dimensionality reduction},
  author={Zhao, Xiaowei and Guo, Jun and Nie, Feiping and Chen, Ling and Li, Zhihui and Zhang, Huaxiang},
  journal={IEEE transactions on neural networks and learning systems},
  volume={31},
  number={2},
  pages={433--444},
  year={2020},
  publisher={IEEE}
}
