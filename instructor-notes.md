# Data Analysis for Social Sciences - 2022/23

Thank you for showing interest in these teaching materials. They are being shared with the hope that they minimise and support your efforts to develop quantitative data analysis teaching materials for social science courses.

## Instructor Notes

The following is a brief description of how these materials were produced and how they might be adopted / adapted by other quantitative methods instructors.

### Purpose

* The materials were developed as part of an [undergraduate module](https://psmd.uws.ac.uk/ModuleDescriptors/ModuleDescriptorsBySchool/ModuleDescriptor.aspx?documentGroupCode=MD0004564) at University of the West of Scotland.
* The materials support a practical, short (four-to-six week) introduction to social science quantitative data analysis.
* There are [two preparatory lectures](./lectures/) that students take in advance of engaging with the practical lessons.
* The aim is to build students' ability to conduct the following:
	* Univariate analysis (e.g., means and standard deviations)
	* Bivariate analysis (e.g., graphing joint distributions and producing measures of association)
	* Multivariate analysis (e.g., three-way contingency tables)
	* Inferential statistics (e.g., 95% confidence intervals)

### Lessons

* There are six lessons (each corresponding to a week in the module).
* Each lesson is written in a Jupyter Notebook containing executable R code and uses real, open social science datasets.
	* The exception is Week 8 which is guidance on how to setup R and RStudio.
* Lessons are mainly self-directed though I usually demonstrate some of the code and analysis at the beginning.

### Computing environments

* The lessons use R code contained in a Jupyter Notebook.
* The Notebooks can be executed online without the need for a local installation.
	* Notebooks can be run using Google Colab (requires Google account) or mybinder.
	* Both platforms are free, though Colab is more reliable.
* The R code is also provided in a R syntax file for students to execute and adapt on their local machines.

### Pedagogical approach

* Learning quantitative methods and programming at the same time is hard, so the lessons try to minimise the cognitive load on students in a number of ways:
	* R code is used for teaching data analysis methods, not studied or taught in its own right (no loops or functions here).
	* Base R code is used almost exclusively to reduce the computational complexity (i.e., students are not struggling with installing and loading packages).
	* The use of Jupyter Notebooks allows an interleaving of lecture notes, code and statistical outputs in a single document.
	* Small, manageable exercises are provided at various points in the lessons, encouraging students to adapt existing code.
	
### Data

* Each lesson uses real data from the following study: [National Survey of Sexual Attitudes and Lifestyles, 2010-2012: Open Access Teaching Dataset](https://beta.ukdataservice.ac.uk/datacatalogue/studies/study?id=8786)
* Students are then encouraged to perform similar analyses on a [richer version](https://beta.ukdataservice.ac.uk/datacatalogue/studies/study?id=8735) of this dataset.

### Feedback

* I'd love to hear if you've made use of these materials or had critical comments on their value.
* [diarmuid.mcdonnell@uws.ac.uk](mailto:diarmuid.mcdonnell@uws.ac.uk)

[Dr Diarmuid McDonnell](https://research-portal.uws.ac.uk/en/persons/diarmuid-mcdonnell)
2023-01-12